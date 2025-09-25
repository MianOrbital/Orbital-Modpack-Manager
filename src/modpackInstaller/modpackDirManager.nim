#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#Procedure handling directories as part of modpack install

import std/os

import ../config/globalValues

proc deletee*() =
  setCurrentDir(secLvlStdLib.mainDir)
  removeDir("tempDownloads")
  echo "Finished cleanup!"