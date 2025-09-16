#This created the main manager directory and the Modpacks folder

#Standard Library
import std/os
#local 
import globalValues

proc dirCreator() =
  setcurrentDir(userLocalAppDir)
  createDir(mainDirName)
  setcurrentDir(mainDir)
  createDir("Modpacks")
  echo "Directory Manager Finished!"

proc packDirsManager*() =
  dirCreator()
packDirsManager()