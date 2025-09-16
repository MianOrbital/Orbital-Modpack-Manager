#Assigns Global Values
#This will likely evolve into a config
import std/os

const parentLauncherDir* = "Orbital Modpack Manager" #For renamer
const userHomeDir* = getHomeDir()
const mainDir* = joinPath(userHomeDir, "AppData", "Local", parentLauncherDir)
const minecraftDir* = joinPath(userHomeDir, "AppData", "Roaming", ".minecraft")
var modpackUrl* = "https://www.dropbox.com/scl/fi/4antn6746pgogj23mg0rp/Infinite-Hyperdeath-3.7z?rlkey=gwvd96svqzdv3ukp16g1d6drj&st=nlpjntw1&dl=1"
var modpackName* = "Infinite Hyperdeath 3.zip"
var modpackNameNoZip* = "Infinite Hyperdeath 3"