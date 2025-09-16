#Procedure to edit the default launcher_profile.JSON
#The jsonEditor procedure will be updated in V0.2

import std/os
import std/json
import globalValues

proc directoryMapper() =
  try:
    setCurrentDir(minecraftDir)
  except OSError:
    let dirError = getCurrentExceptionMsg()
    echo "Error during directory finding: ", dirError

proc jsonEditor() =
  var launcherProfileNode = parsefile("launcher_profiles.json")
  let modpackNode = %*  
    {"icon": "Enchanting_Table",
    "gamedir": mainDir / "Modpacks/Infinite Hyperdeath 3",
    "name": "Infinite Hyperdeath 3",
    "lastVersionID": "forge-47.4.0",
    "type": "custom"}
  echo pretty(modpackNode)
  
  launcherProfileNode["profiles"]["Infinite Hyperdeath 3"] =modpackNode
  writeFile("launcher_profiles.json", pretty(launcherProfileNode))



proc modpackJsonManager*() =
  directoryMapper()
  jsonEditor()
modpackJsonManager()