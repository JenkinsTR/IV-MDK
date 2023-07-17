param (
    [string]$iniFile,
    [string]$file1Path,
    [string]$file2Path,
    [int]$newVehicleBudget
)

# Calculate the sizes of FILE1 and FILE2
$file1Size = (Get-Item -Path $file1Path).Length
$file2Size = (Get-Item -Path $file2Path).Length

# Read the INI file content and retrieve the previous value
$content = Get-Content $iniFile
$previousValue = $content | Where-Object { $_ -match '^VehicleBudget=' } | ForEach-Object { $_ -replace '^VehicleBudget=' }

# Update the VehicleBudget value and add comment in the INI file content
for ($i = 0; $i -lt $content.Length; $i++) {
    if ($content[$i] -match '^VehicleBudget=') {
        $content[$i] = "VehicleBudget=$newVehicleBudget"
        $comment = "; Previous value: $previousValue. Automatically updated at $((Get-Date).ToString('yyyy-MM-dd HH:mm:ss')) by $((Split-Path -Leaf $PSCommandPath))"
        $content = $content[0..$i] + $comment + "; Mod size: $file1Size bytes`n; Vanilla size: $file2Size bytes" + $content[($i+1)..($content.Length-1)]
        break
    }
}

# Write the updated content back to the INI file
$content | Set-Content $iniFile
