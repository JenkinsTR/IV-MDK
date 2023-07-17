# IV-MDK (GTAIV Modding Development Kit)

IV-MDK (GTAIV Modding Development Kit) is a comprehensive collection of tools and documentation for modding and developing modifications for Grand Theft Auto IV (GTA IV). This repository provides various tools and resources that can be utilized to enhance and modify different aspects of the game.

## Table of Contents

- [Tools](#tools)
  - [Audio](#audio)
  - [Misc](#misc)
  - [Models](#models)
  - [Textures](#textures)
  - [Vehicles](#vehicles)
  - [Audio Batch Files](#audio-batch-files)
  - [Misc Batch Files](#misc-batch-files)
    - [IVTweaker AutoUpdate Vehicle Budget](#ivtweaker-autoupdate-vehicle-budget)
  - [Models Batch Files](#models-batch-files)
  - [Textures Batch Files](#textures-batch-files)
- [Documentation](#documentation)
- [Useful Links](#useful-links)
- [Contributing](#contributing)
- [Credits](#credits)

## Tools

### Audio

- **Andrew's Multichannel Audio Importer v0.9.1** by Andræs - [Link to Tool](https://gtaforums.com/topic/570466-reliv-andrews-multichannel-audio-importer/)
  - This tool allows for importing multichannel audio files into Grand Theft Auto IV (GTA IV). It enables the integration of custom audio content with multiple channels, enhancing the game's audio experience.
- **FFMpeg** - [Link to FFMpeg](https://ffmpeg.org/download.html)
  - FFMpeg is a multimedia framework that provides a collection of tools and libraries for handling various audio and video formats. It can be used for manipulating audio files in GTA IV modding, such as converting between different formats or performing audio processing tasks.

### Misc

- **GTA IV RSC Manager v0.5** by Dageron - [Link to Tool](https://libertycity.net/files/gta-4/193342-gta-4-rsc-manager-version-0-5.html)
  - This tool is designed for managing RSC files in GTA IV. RSC files contain game resources such as text strings, localization data, and configuration settings. The GTA IV RSC Manager enables easy editing and manipulation of these files, allowing for customization and modification of in-game text and settings.
- **OpenIV v4.0.0.44 Offline setup** by New Technology Studio - [Link to Tool](https://openiv.org/)
  - OpenIV is a powerful modding tool for Grand Theft Auto IV. It provides an open-source platform for accessing and modifying game files, including textures, models, and audio. With OpenIV, users can create and install various modifications, enhancing the visual and audio aspects of GTA IV.
- **SparkIV v0.8.84 (May2023 Beta)** by Ahmed Walid - [Link to Tool](https://ahmed605.github.io/SparkIV/)
  - SparkIV is another modding tool for GTA IV, offering similar functionality to OpenIV. It enables users to open and modify game files, including textures, models, and audio. With SparkIV, users can create custom modifications and enhance different elements of the game.

### Models

- **OpenFormatObjConverter** by svenar-nl with edits by JMDigital - [Link to Tool](https://github.com/svenar-nl/OpenFormatObjConverter)
  - This tool facilitates the conversion of models from OpenFormats to the OBJ format. OpenFormats is an open source format for storing 3D models exported from OpenIV. The OpenFormatObjConverter allows users to convert these models into the more widely supported OBJ format, making them compatible with various modeling and rendering software.
- **JMD-MTL-MissingTextures-Finder v1.3** by JMDigital - [Link to Tool](https://github.com/JenkinsTR/JMD-MTL-MissingTextures-Finder)
  - This tool helps to find missing textures in MTL files used in GTA IV modding. It scans the specified MTL directory and its subfolders, identifies missing textures referenced in the MTL files, and provides information about the missing textures. Additionally, it can update the MTL files with new texture paths and copy the textures to a chosen folder if desired. View the Github page for more information.

### Textures

- **Console Texture Editor v1.3.1 beta** by Dageron - [Link to Tool](https://libertycity.net/files/gta-5/71340-console-texure-editor-1.3.1-beta.html)
  - This tool is specifically designed for editing textures in the console version of GTA IV. It provides a graphical interface for modifying and customizing textures used in the game. Users can import, export, and manipulate textures to enhance the visual quality or apply custom textures to different in-game objects.

### Vehicles

- **CarcolsEditor v1.3** by Neil Siegried (npsgta) - [Link to Tool](http://download.gta-expert.it/gta-4/strumenti/13889-carcols-editor-v13.html)
  - This tool focuses on editing car colors in GTA IV. It allows users to modify the color definitions and configurations for vehicles in the game. Users can create custom color schemes or adjust existing colors for different vehicle models, enhancing the visual variety of the in-game cars.
- **Handling Editor v1.3** by CoMPuTer MAsSteR (CoMPMStR) - [Link to Tool](https://libertycity.net/files/gta-4/35044-gta-iv-handling-editor-v1.3.html)
  - The Handling Editor tool is used for modifying the handling characteristics of vehicles in GTA IV. It provides a user-friendly interface to adjust parameters such as acceleration, top speed, braking, and suspension behavior. By tweaking these parameters, users can create custom vehicle handling profiles to suit their preferences or create unique driving experiences.

### Audio Batch Files

- **convert_to_32khzWAV.bat** by JMDigital - [Link to File](Tools/Audio/convert_to_32khzWAV.bat)
  - This batch file is used for converting audio files to the 32kHz WAV format. It can be handy when preparing audio files for use in Andrew's Multichannel Audio Importer.

### Misc Batch Files

- **copy_dds.bat** by JMDigital - [Link to File](Tools/Misc/copy_dds.bat)
  - This batch file facilitates the copying of DDS (DirectDraw Surface) texture files. It simplifies the process of copying these files to desired locations.
- **copy_ofiv.bat** by JMDigital - [Link to File](Tools/Misc/copy_ofiv.bat)
  - This batch file is used for copying OpenFormats files. It helps manage OpenFormats files during the modding process.
- **del_openFormats.bat** by JMDigital - [Link to File](Tools/Misc/del_openFormats.bat)
  - This batch file assists in deleting OpenFormats files. It provides a streamlined approach for removing OpenFormats files when necessary.
- **list_unique_extensions.bat** by JMDigital - [Link to File](Tools/Misc/list_unique_extensions.bat)
  - This batch file lists the unique file extensions found within the game files. It can help modders identify the file formats used in GTA IV and understand the types of files they may encounter during modding.

#### IVTweaker AutoUpdate Vehicle Budget

- **update_budget.bat** by JMDigital - [Link to File](<Tools/Misc/IVTweaker AutoUpdate Vehicle Budget/update_budget.bat>)
- **UpdateVehicleBudget.ps1** by JMDigital - [Link to File](<Tools/Misc/IVTweaker AutoUpdate Vehicle Budget/UpdateVehicleBudget.ps1>)

  **Function: IVTweaker AutoUpdate Vehicle Budget**

  The IVTweaker AutoUpdate Vehicle Budget tool allows for automatic updating of the VehicleBudget value in the IVTweaker.ini file. The VehicleBudget value determines the maximum size of modified vehicles that can be loaded in the game.

  The tool consists of the following files:
  - **update_budget.bat**: This batch file retrieves the sizes of the vehicles.img files, calls the PowerShell script, and displays the updated VehicleBudget value.
  - **UpdateVehicleBudget.ps1**: This PowerShell script updates the VehicleBudget value in the IVTweaker.ini file by calculating the sizes of the vehicles.img files and modifying the INI file accordingly.

  To use the tool, run the `update_budget.bat` file, and it will automatically update the VehicleBudget value in the IVTweaker.ini file based on the sizes of the vehicles.img files. The updated VehicleBudget value will be displayed after the process is completed.

### Models Batch Files

- **convert_MESH_to_OBJ.bat** by JMDigital - [Link to File](Tools/Models/OpenFormatObjConverter/convert_MESH_to_OBJ.bat)
  - This batch file is related to the OpenFormatObjConverter tool. It is used to convert 3D model files in the MESH format to the more widely supported OBJ format.

### Textures Batch Files

- **convert_DDS_to_TGA_NEW2023.bat** by JMDigital - [Link to File](Tools/Textures/convert_DDS_to_TGA_NEW2023.bat)
  - This batch file converts DDS texture files to the TGA (Targa) format. It is useful for converting textures to a format more widely compatible than DDS.

## Documentation

The following documentation files are available in the repository:

- **1007_list_of_different_files_to_CE.txt** by JMDigital - A list of files that are different in 1.0.0.7 Downgrade compared to the Complete Edition. [Link to File](Docs/1007_list_of_different_files_to_CE.txt)
- **gameexe_commandline_options.txt** - A list of the game's exe command line options. [Link to File](Docs/gameexe_commandline_options.txt)
- **model_hashes.txt** - A list of the game's model hashes. [Link to File](Docs/model_hashes.txt)
- **streamed_vehicles_list_audio.txt** by JMDigital - A list of the game's vehicle streamed audio names and their categories. [Link to File](Docs/streamed_vehicles_list_audio.txt)
- **veh_extras.txt** - A detailed list with explanations of the game's vehicle extras. [Link to File](Docs/veh_extras.txt)
- **zmodeler_siren_dummies.txt** by JMDigital - Contains hierarchy information for siren dummies in the "police.wft" and "fbi.wft" files. [Link to File](Docs/zmodeler_siren_dummies.txt)

Please refer to the individual documentation files for more information.

## Useful Links

Here are some useful links related to GTA IV modding:

- [Notepad++](https://notepad-plus-plus.org/): A powerful text editor that can be used for editing various text files.
- [GTAMods Wiki](https://www.gtamods.com/wiki/Main_Page): A comprehensive wiki for GTA modding that provides tutorials, guides, and documentation.
- [GTAforums](https://gtaforums.com/): A popular forum community dedicated to GTA modding and discussions.
- [Wikipedia - DDS (file format)](https://en.wikipedia.org/wiki/DirectDraw_Surface): Information about the DDS (DirectDraw Surface) file format used for textures in GTA IV.
- [Wikipedia - TGA (file format)](https://en.wikipedia.org/wiki/Truevision_TGA): Information about the TGA (Truevision TGA) file format.
- [Wikipedia - OBJ (file format)](https://en.wikipedia.org/wiki/Wavefront_.obj_file): Information about the OBJ (Wavefront OBJ) file format.

## Contributing

Contributions to this project are welcome. If you have any improvements, bug fixes, or additional tools/documentation to add, please submit a pull request.

## Credits

The following individuals have contributed to the IV-MDK project:

- Andræs - Creator of "Andrew's Multichannel Audio Importer (AMAI)"
- Dageron - Creator of "GTA IV RSC Manager" and "Console Texture Editor"
- New Technology Studio - Creator of "OpenIV"
- Ahmed Walid - Creator of "SparkIV"
- svenar-nl - Creator of "OpenFormatObjConverter"
- JMDigital - Editor and contributor for various tools and documentation files in this MDK.

Please make sure to give credit to the original authors when using their tools or resources.
