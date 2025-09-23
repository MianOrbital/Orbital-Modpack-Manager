#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#This moves the unzipped Dl

#Standard Library
import std/os

#Local
import ../config/globalValues

proc modpackInstaller*() =
  echo "Starting install"
  createDir("Modpacks" / topLvlModVars.modpackName)
  moveDir(thrdLvlModVars.modpackDlDir, secLvlModVars.modpackInstallDir)

  setCurrentDir(secLvlStdLib.minecraftBin)
  createDir("versions" / topLvlModVars.modpackFramework)
  moveDir(thrdLvlModVars.frameworkDlDir, secLvlModVars.frameworkInstallDir)
  echo "Finished install!"