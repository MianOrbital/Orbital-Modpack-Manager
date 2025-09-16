#Assigns Global Values
#This will likely evolve into a config.ini

#Standard Library
import std/os

#Constants that should only be used in this file AND packDirsManager
const mainDirName* = "Orbital Modpack Manager" #Allows easy renaming of program
const userLocalAppDir* = getCacheDir() #Cross Platform
const userRoamAppDir* = getEnv("APPDATA") #Windows specific

#Constants used in other files
const mainDir* = joinPath(userLocalAppDir, mainDirName)
const minecraftBin* = joinPath(userRoamAppDir, ".minecraft")

#Modpack Specifc (These will be assigned elsewhere in the future)
var modpackUrl* = "https://www.dropbox.com/scl/fi/4antn6746pgogj23mg0rp/Infinite-Hyperdeath-3.7z?rlkey=gwvd96svqzdv3ukp16g1d6drj&st=nlpjntw1&dl=1"
var modpackNameZip* = "Infinite Hyperdeath 3.zip"
var modpackName* = "Infinite Hyperdeath 3"
var modpackFramework* = "forge-47.4.0"

#Modpack Dependent Specifics
let modpackDlDir* = joinPath(mainDir, modpackName, modpackName)
let modpackInstallDir* = joinPath(mainDir, "Modpacks", modpackName)
let frameworkDlDir* = joinPath(maindir, "tempDownloads", modpackName, modpackFramework)
let frameworkInstallDir* = joinPath(minecraftBin, "versions", modpackFramework)