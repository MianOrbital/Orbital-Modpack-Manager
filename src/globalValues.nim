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
var modpackUrl* = "https://www.dropbox.com/scl/fi/onwi6ki68raf4j3ug7zom/Modpack.zip?rlkey=qnrkd649iuy9v5gcatmh5ub5y&st=5wtjiz50&dl=1"
var modpackNameZip* = "modpack.zip" #standardize
var modpackName* = "Infinite Hyperdeath 3"
var modpackFramework* = "forge-47.4.0"

#Modpack Dependent Specifics
let tempZipPath* = joinPath("tempDownloads", "tempZip")
let modpackDlDir* = joinPath(mainDir, tempZipPath, modpackName)
let modpackInstallDir* = joinPath(mainDir, "Modpacks", modpackName)
let frameworkDlDir* = joinPath(maindir, tempZipPath, modpackFramework)
let frameworkInstallDir* = joinPath(minecraftBin, "versions", modpackFramework)