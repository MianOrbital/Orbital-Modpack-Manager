#Procedure to alter the default Minecraft launcher_profiles.json

#Standard Library
import std/[os, json]
#Local
import globalValues

proc jsonEditor() =
  setCurrentDir(minecraftBin)
  var launcherProfileNode = parsefile("launcher_profiles.json")
  let modpackNode = %*  
    {"icon": "Enchanting_Table",
    "gamedir": mainDir / "Modpacks" / modpackName,
    "name": modpackName,
    "lastVersionID": modpackFramework,
    "type": "custom"}
  launcherProfileNode["profiles"]["Infinite Hyperdeath 3"] =modpackNode #joins modpackNode to existing profile
  writeFile("launcher_profiles.json", pretty(launcherProfileNode)) #still "unsafe"
  echo "JSON Managment Finished!"



proc modpackJsonManager*() =
  jsonEditor()
modpackJsonManager()