Written in September of 2025 by Mian using Nim

Version 0.2
  -The functional edition

Installation: 
  -Simply download the "Orbital Modpack Manager.exe" file from the above directory.
  -This file is optimized for amd64 (It may not work at all on other archetecture, recompiling using a different argument should allow that)
  -It currently does not run on linux or macOS (Only whitespace conflicts, brave users can fix this or wait for ~v0.6 or so)

Notes:
  -This application is dependent on having the default minecraft Launcher installed (It also kinda works with curseforge)
  -This sets no ram allocations, ensure you do so!

Files:
  -globalValues - This just assigns some values (mainly paths) used accross the program. This will probably become an .ini in the future.
  -jsonManager - This handles the JSON parsing and updating. This needs optimized
  -modpackDownloader - This downloads, extracts, and installs, the modpack and its framework. This needs trimmed.
  -packDirsManager - This makes some of the directory folders. This needs expanded
  -Orbital_Modpack_Manager - This calls the other folders and the user CLI (Which doesnt work right now)

Todo:
  -Assign global vars
  -More documentation
  -Make JSON editing safe
  -Fix CLI
  -Kiss my wife goodmorning
  -Optimize imports