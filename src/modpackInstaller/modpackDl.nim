#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

import std/os
import std/httpclient

import ../config/globalValues


#Alter scope, pass dir to dirmanager
proc modpackDl*()=
  setCurrentDir(secLvlStdLib.mainDir)
  createDir("tempDownloads")
  setCurrentDir("tempDownloads")

  let client = newHttpClient()
  echo "Starting Modpack Download!"
  try:
    let response = client.get(topLvlModVars.modpackUrl)
    let f = open(topLvlModVars.modpackNameZip, fmWrite)
    f.write(response.body)
    f.close()
    echo "Downloaded Modpack!"
  except HttpRequestError as e:
    echo "HTTP Error: ", e.msg
  except CatchableError as e:
    echo "General Error: ", e.msg
  finally:
    try:
      client.close()
    except Exception as e:
      echo "Error Closing Client: ", e.msg
  echo "Finished Downloader!"
