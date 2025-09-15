#Procedure to edit the default launcher_profile.JSON
#The jsonEditor procedure will be updated in V0.2

import std/os
import std/json

proc directoryMapper() =
  let userHomeDir = getHomeDir()
  let minecraftDir = joinPath(userHomeDir, "AppData", "Roaming", ".minecraft")
  
  try:
    setCurrentDir(minecraftDir)
  except OSError:
    let dirError = getCurrentExceptionMsg()
    echo "Error during directory finding: ", dirError

proc jsonEditor() =
  var launcherProfileNode = parsefile("launcher_profiles.json")
  let modpackNode = %*  
    {"created": "DATE-PLACEHOLDER",
    "icon": "ICON-PLACEHOLDER",
    "lasUsed": "LAST-PLACEHOLDER",
    "name": "Infinite Hyperdeath 3",
    "lastVersionID": "Version 1.1",
    "type": "custom"}
  
  launcherProfileNode["profiles"]["Infinite Hyperdeath 3"] =modpackNode
  writeFile("launcher_profiles.json", pretty(launcherProfileNode))



proc modpackJsonManager*() =
  directoryMapper()
  jsonEditor()
modpackJsonManager()