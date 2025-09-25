#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#Std LIBTARD!
import std/os

#local 
import ../config/globalValues

proc dirCreator() =
  try:
    setcurrentDir(topLvlStdLib.userLocalAppDir)
    echo("Moved to User Local App Directory!")
  except:
    echo("Error Setting User Directory: " &
     getCurrentExceptionMsg())
  try:
    createDir(topLvlNoDep.mainDirName)
    echo("Created the Main Modpack Directory!")
  except:
    echo("Error Creating Main Launcher Directory: " &
    getCurrentExceptionMsg())
  try:
    setcurrentDir(secLvlStdLib.mainDir)
    echo("Moved to the Main Modpack Directory!")
  except:
    echo("Error Moving To Modpack Directory: " &
    getCurrentExceptionMsg())
  try:
    createDir("Modpacks")
    echo("Created the Modpacks Subdirectory!")
  except:
    echo("Error Creating Modpacks Subdirectory: " &
    getCurrentExceptionMsg())
  echo "Directory Manager Finished!"

proc launcherInstaller*() =
    dirCreator()


