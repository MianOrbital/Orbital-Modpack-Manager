#This established the modpacks directory system and unpacks the modpack

import std/os
import globalValues

proc dirCreator() =
  let userHomeDir = getHomeDir()
  let userLocalDir = joinPath(userHomeDir, "AppData", "Local")
  setcurrentDir(userLocalDir)

  createDir(parentLauncherDir)

proc packDirsManager*() =
  dirCreator()
packDirsManager()