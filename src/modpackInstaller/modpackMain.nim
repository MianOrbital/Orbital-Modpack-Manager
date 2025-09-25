#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#Main caller for all modpack Procs

import jsonManager
import modpackDirManager
import modpackDl
import modpackInstaller
import modpackUnzipper
import userPrompt

proc modpackMain*() =
 userPrompt()
 modpackDl()
 modpackUnzipper()
 modpackInstaller()
 deletee()
 jsonManager()