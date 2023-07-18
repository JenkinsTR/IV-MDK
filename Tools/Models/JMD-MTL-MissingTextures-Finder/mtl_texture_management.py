# Import required modules
import os
import re
import shutil
import argparse
import glob
import multiprocessing

# ==============================================================================
# COPYRIGHT INFORMATION
# ==============================================================================
#
# This script is developed by JMDigital (https://jmd.vc) - Version 1.3 (07.2023)
#
# ==============================================================================

# Define ANSI escape codes for colors
colors = {
    "red": "\033[91m",
    "green": "\033[92m",
    "orange": "\033[93m",
    "reset": "\033[0m"
}

# Updated regular expression pattern to capture texture type and name without extensions
texture_pattern = r"(" + "|".join(rf"(?:{texture_type})" for texture_type in ["map_Ka", "map_Kd", "map_Ks", "map_Ns", "map_d", "map_bump", "bump", "disp", "decal"]) + r")\s+(\b(?!\.).+\b)"

# Function to find the largest texture path
def find_largest_texture(mtl_directory, texture_name, find_largest):
    largest_texture_size = 0
    largest_texture_path = ""

    # Iterate over texture files in the MTL directory and its subfolders
    for root, _, filenames in os.walk(mtl_directory):
        for filename in filenames:
            if texture_name.lower() in filename.lower():
                texture_path = os.path.join(root, filename)
                if find_largest:
                    texture_size = os.path.getsize(texture_path)
                    if texture_size > largest_texture_size:
                        largest_texture_size = texture_size
                        largest_texture_path = texture_path
                else:
                    return texture_path

    return largest_texture_path

# Function to find the texture path with different extensions
def find_texture_path(mtl_directory, texture_name):
    # Supported texture extensions
    texture_extensions = [".dds", ".png", ".jpg", ".jpeg", ".tga", ".bmp", ".gif"]

    # Iterate over supported extensions to find the texture path
    for extension in texture_extensions:
        texture_path = find_largest_texture(mtl_directory, texture_name + extension, find_largest=True)
        if texture_path:
            return texture_path

    return None

# Function to find missing textures in MTL files and save to a text file
def find_missing_textures(mtl_directory, scan_subfolders, save_file):
    missing_textures = []

    # Helper function to check if the file is an MTL file
    def is_mtl_file(filename):
        return filename.lower().endswith(".mtl")

    # Iterate over MTL files in the directory and its subfolders if required
    for root, _, filenames in os.walk(mtl_directory):
        if scan_subfolders or root == mtl_directory:
            for filename in filenames:
                if is_mtl_file(filename):
                    filepath = os.path.join(root, filename)

                    # Read the MTL file
                    with open(filepath, "r") as file:
                        lines = file.readlines()

                    # Iterate over the lines to find missing textures
                    for line in lines:
                        texture_match = re.match(texture_pattern, line)
                        if texture_match:
                            texture_type = texture_match.group(1)
                            texture_name = texture_match.group(2)

                            # Check if the texture name has no extension
                            if not os.path.splitext(texture_name)[1]:
                                texture_path = find_texture_path(mtl_directory, texture_name)
                                print(f"{colors['orange']}Found extensionless texture: {texture_type} {texture_name}{colors['reset']}")
                                if texture_path:
                                    print(f"{colors['green']}Largest texture found in:{colors['reset']} {texture_path}")
                                    print()
                                    missing_textures.append((texture_name, texture_type, filepath))
                                else:
                                    print(f"{colors['red']}WARNING! No matching texture found in '{mtl_directory}'{colors['reset']}")
                                    print()

    # Print missing textures and save to file
    if missing_textures:
        print("Missing textures:")
        for texture, texture_type, mtl_file in missing_textures:
            print(f"Missing Texture: {texture} Type: {texture_type} found in (MTL: {mtl_file})")
        print()

        # Save to file if requested or if -f is not specified
        if save_file or not args.save_file:
            if save_file is True:
                save_file = os.path.join(mtl_directory, "missing_textures.txt")
            with open(save_file, "w") as output_file:
                for texture, texture_type, mtl_file in missing_textures:
                    output_file.write(f"Missing Texture: {texture} Type: {texture_type} found in (MTL: {mtl_file})\n")
            print(f"Missing textures saved to {save_file}")
            print()

    return missing_textures

# Function to process an individual MTL file
def process_mtl_file(mtl_info):
    texture_name, mtl_file = mtl_info
    new_texture_name = texture_name + ".dds"
    mtl_path = os.path.join(args.mtl_directory, mtl_file)

    largest_texture_path = find_largest_texture(args.mtl_directory, new_texture_name, args.find_largest)
    if largest_texture_path:
        new_texture_path = os.path.relpath(largest_texture_path, os.path.dirname(mtl_path))

        with open(mtl_path, "r") as file:
            mtl_lines = file.readlines()

        updated_mtl_lines = []
        for line in mtl_lines:
            texture_match = re.search(texture_pattern, line)
            if texture_match and texture_match.group(1) == texture_name:
                updated_line = line.replace(texture_name, new_texture_path)
                updated_mtl_lines.append(updated_line)
            else:
                updated_mtl_lines.append(line)

        if args.update_mtl:
            if args.backup:
                backup_path = mtl_path + "bkp"
                shutil.copy2(mtl_path, backup_path)

            with open(mtl_path, "w") as file:
                file.writelines(updated_mtl_lines)
                print(f"{colors['green']}Updated MTL file:{colors['reset']} {mtl_path}")

        if args.copy_textures and args.output_directory:
            output_texture_path = os.path.join(args.output_directory, new_texture_name)
            shutil.copy2(largest_texture_path, output_texture_path)
            print(f"Copied: {largest_texture_path} to {output_texture_path}")

# Parse command-line arguments
parser = argparse.ArgumentParser(description="Find missing textures, locate the largest versions, and update MTL files")
parser.add_argument("-i", "--mtl_directory", required=True, help="Path to the MTL directory")
parser.add_argument("-s", "--scan_subfolders", action="store_true", help="Scan all subfolders")
parser.add_argument("-f", "--save_file", nargs='?', const=True, default=False, metavar="FILE",
                    help="Save missing textures to a file. Specify custom name and location for the file.")
parser.add_argument("-c", "--copy_textures", action="store_true", help="Copy the textures to a chosen folder")
parser.add_argument("-o", "--output_directory", help="Path to the output directory for copied textures")
parser.add_argument("-u", "--update_mtl", action="store_true", help="Update the original MTL files with the new texture paths")
parser.add_argument("-b", "--backup", action="store_true", help="Create backup copies of the original MTL files with the extension '.mtlbkp'")
parser.add_argument("-L", "--find_largest", action="store_true", help="Find the largest versions of textures")
args = parser.parse_args()

# Call the function to find missing textures
print("Scanning for missing textures...")
missing_textures = find_missing_textures(args.mtl_directory, args.scan_subfolders, args.save_file)

# Determine the number of CPU cores available
num_cores = multiprocessing.cpu_count()

# Calculate the number of processes to create based on the number of cores
num_processes = min(len(missing_textures), num_cores)

# Create and start a process for each MTL file
processes = []
for i in range(num_processes):
    process = multiprocessing.Process(target=process_mtl_file, args=(missing_textures[i],))
    process.start()
    processes.append(process)

# Wait for all processes to complete
for process in processes:
    process.join()

# Call the function to update the MTL files if specified
if args.update_mtl:
    print("Updating MTL files...")
    for mtl_info in missing_textures:
        process_mtl_file(mtl_info)

# Call the function to copy textures if specified
if args.copy_textures and args.output_directory:
    print("Copying textures...")
    for mtl_info in missing_textures:
        process_mtl_file(mtl_info)

print("Script execution completed.")