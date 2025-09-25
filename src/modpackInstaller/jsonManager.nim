#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#Procedure to alter the default Minecraft launcher_profiles.json

#Standard Library
import std/[os, json]

#Local
import ../config/globalValues
import userPrompt

proc jsonManager*() =
  try:
    setCurrentDir(secLvlStdLib.minecraftBin)
  except:
    echo("Error Setting Minecraft Directory: " &
    getCurrentExceptionMsg())
  var launcherProfileNode = parsefile("launcher_profiles.json")
  let modpackNode = %*  
    {"icon": "Enchanting_Table",
    "gamedir": secLvlStdLib.mainDir / "Modpacks" / topLvlModVars.modpackName,
    "name": topLvlModVars.modpackName,
    "lastVersionID": topLvlModVars.modpackFramework,
    "JavaArgs": localRamArg,
    "type": "custom"}
  launcherProfileNode["profiles"]["Infinite Hyperdeath 3"] =modpackNode #joins modpackNode to existing profile
  writeFile("launcher_profiles.json", pretty(launcherProfileNode)) #still "unsafe"
  echo "JSON Managment Finished!"