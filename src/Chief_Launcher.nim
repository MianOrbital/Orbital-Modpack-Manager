#Sic Semper Tyranus

#Import std modules
import std/os

#Procedure to find & edit Minecraft's Launcher Profiles. Will only work on Windows with existing .minecraft directory 
proc launcherProfile() =
  #Moves into .minecraft
  let homeDir = getHomeDir()
  setCurrentDir(homeDir)
  let minecraftDir = joinPath("AppData", "Roaming", ".minecraft")
  setCurrentDir(minecraftDir)
  let reportDir = getCurrentDir()
  echo "Found Minecraft Directory at: ", reportDir

  #Finds json file
  let launcherJsonReal = fileExists("launcher_profiles.json")
  echo "Launcher JSON found: ", launcherJsonReal
 
 
proc main() =
  launcherProfile()
main()