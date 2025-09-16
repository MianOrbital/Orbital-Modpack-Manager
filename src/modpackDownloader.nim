#This handles the download of the modpack
#Client is sync currently, I have vague understandings of what that means.
#This is somewhat less scuffed (HEHE!)

#Standard Library
import std/[os, httpclient]
#Third Party
import zippy/ziparchives
#Local
import globalValues

proc downloaderClient()=
  setCurrentDir(mainDir)
  createDir("tempDownloads")
  setCurrentDir("tempDownloads")
  let client = newHttpClient()
  downloadFile(client, modpackUrl, modpackNameZip)
  httpclient.close(client)
  echo "Finished Downloader!"

proc unzipper() =
  setCurrentDir(mainDir)
  let dlPath = joinPath("tempDownloads", modpackNameZip)
  extractAll(dlPath, "tempDownloads")
  echo "Finished Unzipping!"

proc installer() =
  createDir("Modpacks" / modpackName)
  moveDir(modpackDlDir, modpackInstallDir)

  setCurrentDir(minecraftBin)
  createDir("versions" / modpackFramework)
  moveDir(frameworkDlDir, frameworkInstallDir)
  echo "Finished install!"

proc deletee() =
  setCurrentDir(mainDir)
  removeDir("tempDownloads")
  echo "Finished cleanup!"

proc modpackDownloader*() =
  downloaderClient()
  unzipper()
  installer()
  deletee()
modpackDownloader()