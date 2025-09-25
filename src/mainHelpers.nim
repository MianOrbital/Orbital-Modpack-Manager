#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#This is the file for procs that don't have a home elsewhere (ORPHANS ! LOL!)

#local imports
import config/globalValues
import launcher/launcher
import launcherInstaller/launcherInstaller
import modpackInstaller/userPrompt

#Startup CLI
proc welcome() =
  echo("Welcome to ", topLvlNoDep.mainName) #This is very ugly but you know what it do
  echo("Version ", topLvlNoDep.version)
  echo("")
  echo("Please select from the following:")
  echo("Install - Installs the ", topLvlNoDep.mainName) #truple from globalValues - WIP
  echo("Run - Starts the launcher (not really)")
  echo("Modpacks - Starts the modpack managment system")

  #Choice selection - var for rechoicer
  var userIn = readLine(stdin)
  if userIn == "Install":
    try:
      launcherInstaller()
    except:
      echo("Error: ", getCurrentExceptionMsg())
  elif userIn == "Run":
    try:
      launcher()
    except:
      echo("Error: ", getCurrentExceptionMsg())
  elif userIn == "Modpacks":
    try:
      userPrompt()
    except:
      echo("Error: ", getCurrentExceptionMsg())
  else:
    echo("Did the clanker clunk or did the meatbag do a dumpy?")
    welcome()

proc mainHelpers*() = 
  welcome()