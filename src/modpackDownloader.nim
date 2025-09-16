#This handles the download of the modpack
#Client is sync currently, I have vague understandings of what that means.
#This is extreamly scuffed (LOL!)

import std/os
import std/httpclient
import globalValues
import zippy/ziparchives

proc downloaderClient()=
  setCurrentDir(mainDir)
  createDir("Temp Downloads")
  setCurrentDir("Temp Downloads")
  let client = newHttpClient()
  downloadFile(client, modpackUrl, modpackName)
  httpclient.close(client)

proc unzipper() =
  setCurrentDir(mainDir)
  createDir(modpackNameNoZip)
  let dlPath = joinPath("Temp Downloads", modpackName)
  extractAll(dlPath, "tempUnzip")

proc installer() =
  setCurrentDir(mainDir)
  createDir("Modpacks//Infinite Hyperdeath 3")
  let modpackDir = joinPath("tempUnzip", "Infinite Hyperdeath 3", "Infinite Hyperdeath 3")
  let modpackInstall = joinPath("Modpacks", "Infinite Hyperdeath 3")
  moveDir(modpackDir, modpackInstall)

  setCurrentDir(minecraftDir)
  createDir("versions//forge-47.4.0")
  let forgeVer = joinPath(maindir, "tempUnzip", "Infinite Hyperdeath 3", "forge-47.4.0")
  let forgeInstall = joinPath("versions", "forge-47.4.0")
  moveDir(forgeVer, forgeInstall)

proc deletee() =
  setCurrentDir(mainDir)
  removeDir("tempUnzip")
  removeDir("Temp Downloads")

proc modpackDownloader*() =
  downloaderClient()
  unzipper()
  installer()
  deletee()
modpackDownloader()