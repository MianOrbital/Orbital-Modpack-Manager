#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#This is all of the procedures
#I may split some of this in the future but honestly Nim's circular import is stinky
#If split, they will only require values imports.

#Std Lib Imports
import std/os
import std/httpclient

#Community Imports
import zippy/ziparchives

#Local Imports
import values


#Forward Declarations


#Start Of Procedures

# Main CLI interface
proc mainCli() =
  echo(
    "Welcome to ", launcherName,
    "Version ", launcherVer,
    "",
    "Please select from the following:",
    "1. Launch ", launcherName,
    "2. Install a modpack",
    "3. List the available modpacks",
    "4. First time install"
  )
  var userIn = readLine(stdin) #Var for retries
  
  if userIn == "1":
    try:
      echo("Starting the launcher!")
      launcher()
    except:
      echo("Error starting the launcher.",
        getCurrentExceptionMsg()
      )
  
  elif userIn == "2":
    try:
      echo("Starting the modpack installer!")
      modpackCli()
      echo("Modpack install finished!")
      echo("Press enter to return to main menu")
      discard readLine(stdin)
      mainCli()
    except:
      echo(
        "Error during the modpack installation process",
        getCurrentExceptionMsg()
      )

  elif userIn == "3":
    try:
      echo("Here are the available packs")
      modpackList()
      echo("Press enter to return to the main menu")
      discard readLine(stdin)
      mainCli()
    except:
      echo(
      "Error during modpack listing",
      "Honestly not sure how that one happened",
      getCurrentExceptionMsg()
      )

  elif userIn == "4":
    try:
      echo("Starting the launcher install!")
      launcherInstaller()
      echo("Install finished!")
      echo("Press enter to return to the main menu")
      discard readLine(stdin)
      mainCli()
    except:
      echo(
        "Error during launcher install",
        getCurrentExceptionMsg()
      )
  
  else:
    echo("Uh oh... Stinky!")
    mainCli()


#Launchs the launcher -WIP
proc launcher() =
  echo "WIP - launch via Mojang Launcher (set ram!)"


#Main modpack CLI
proc modpackCli() =
  echo(
    "Please select from the following",
    "Modpack Name. Enter the modpack's name to install",
    "2. Set Ram - best to do this first",
    "3. List available modpacks"
    )
  
  var userIn = readLine(stdin) #var for retries
  
  if userIn == "test":
    try:
      echo("Installing ", userIn)
      modpackInstaller()
      echo("Finished installing ", userIn)
      echo("Press enter to return to the main menu")
      mainCli()
    except:
      echo(
        "Errror during modpack install",
        getCurrentExceptionMsg()
      )
      modpackCli()

  elif userIn == "2":
    try:
      let ramArg = ram()
      echo("Press enter to return to the modpack menu")
      discard readLine(stdin)
      modpackCli()
    except:
      echo(
        "Error during ram procedure",
        getCurrentExceptionMsg()
      )
      modpackCli()
  
  elif userIn == "3":
    try:
      echo("Here are the available packs")
      modpackList()
      echo("Press enter to return to the modpack menu")
      discard readLine(stdin)
      modpackCli()
    except:
      echo(
        "Error during modpack listing",
        "Honestly not sure how that one happened",
        getCurrentExceptionMsg()
      )
      modpackCli()
  
  else:
    echo("Invalid input, try again")
    modpackCli()


#Lists all available modpacks - Will probably make this fancy later
proc modpackList() =
  echo(
    "The following modpacks are available:",
    "Infinite Hyperdeath 3",
  )


#Installs the main files for the launcher
proc launcherInstaller() =
  echo("holder")
  #install in program files, make this posix


#Main modpackInstaller - very messy
proc modpackInstaller() =
  setCurrentDir(secLvlStdLib.mainDir)
  createDir("tempDownloads")
  setCurrentDir("tempDownloads")

  let client = newHttpClient()
  echo("Starting Modpack Download!")
  try:
    let response = client.get(topLvlModVars.modpackUrl)
    let f = open(topLvlModVars.modpackNameZip, fmWrite)
    f.write(response.body)
    f.close()
    echo("Downloaded Modpack!")
  except HttpRequestError as e:
    echo("HTTP Error: ", e.msg)
  except CatchableError as e:
    echo("General Error: ", e.msg)
  finally:
    try:
      client.close()
    except Exception as e:
      echo("Error Closing Client: ", e.msg)
  echo("Finished Downloader!")

  echo("setting dir to mainDir")
  setCurrentDir(secLvlStdLib.mainDir)
  echo("joining dlPath")
  let dlPath = joinPath("tempDownloads", topLvlModVars.modpackNameZip)
  echo("starting extract")
  try:
    echo("extracting dlPath to tempDownloads")
    extractAll(dlPath, secLvlModVars.tempZipPath)
    echo("Finished Unzipping!")
  except CatchableError as e:
    echo("Error during unzip: ", e.msg)

  echo("Starting Install!")
  createDir("Modpacks" / topLvlModVars.modpackName)
  moveDir(thrdLvlModVars.modpackDlDir, secLvlModVars.modpackInstallDir)

  setCurrentDir(secLvlStdLib.minecraftBin)
  createDir("versions" / topLvlModVars.modpackFramework)
  moveDir(thrdLvlModVars.frameworkDlDir, secLvlModVars.frameworkInstallDir)
  echo("Finished install!")

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
  echo("JSON Managment Finished!")

  setCurrentDir(secLvlStdLib.mainDir)
  removeDir("tempDownloads")
  echo("Finished cleanup!")


#Sets user ram
proc ram(): string =
  echo("Please enter the amount of ram you would like to allocate in GB")
  echo("For example: for 1GB enter 1")
  var userIn = readline(stdin)
  let ramArg = "-Xmx" & userIn & "G"
  result = ramArg
  echo("Ram Argument Set to: ", ramArg)