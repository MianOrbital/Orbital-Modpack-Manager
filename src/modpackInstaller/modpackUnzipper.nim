#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#This unzips the dl

import std/os

import zippy/ziparchives

import ../config/globalValues

proc modpackUnzipper*() =
  echo "setting dir to mainDir"
  setCurrentDir(secLvlStdLib.mainDir)
  echo "joining dlPath"
  let dlPath = joinPath("tempDownloads", topLvlModVars.modpackNameZip)
  echo "starting extract"
  try:
    echo "extracting dlPath to tempDownloads"
    extractAll(dlPath, secLvlModVars.tempZipPath)
    echo "Finished Unzipping!"
  except CatchableError as e:
    echo "Error during unzip: ", e.msg