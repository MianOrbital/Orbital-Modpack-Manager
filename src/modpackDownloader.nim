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
  echo "Starting modpack download"
  try:
    let response = client.get(modpackUrl)
    let f = open(modpackNameZip, fmWrite)
    f.write(response.body)
    f.close()
    echo "Downloaded modpack!"
  except HttpRequestError as e:
    echo "HTTP error: ", e.msg
  except CatchableError as e:
    echo "General error: ", e.msg
  finally:
    try:
      client.close()
    except Exception as e:
      echo "Error closing client: ", e.msg
  echo "Finished Downloader!"

proc unzipper() =
  echo "setting dir to mainDir"
  setCurrentDir(mainDir)
  echo "joining dlPath"
  let dlPath = joinPath("tempDownloads", modpackNameZip)
  echo "starting extract"
  try:
    echo "extracting dlPath to tempDownloads"
    extractAll(dlPath, tempZipPath)
    echo "Finished Unzipping!"
  except CatchableError as e:
    echo "Error during unzip: ", e.msg

proc installer() =
  echo "Starting install"
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