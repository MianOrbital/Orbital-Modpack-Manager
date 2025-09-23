#Copywrite Oribtal Softworks 2025
#Licensed under CC0 1.0
#Clunking Clankers 0

#This prompts some info to the user when The modpacks prompt is chosen



var localRamArg*: string

proc list() =
  echo "Infinite Hyperdeath 3"

proc ram(): string =
  echo("Please enter the amount of ram you would like to allocate in GB")
  echo("For example: for 1GB enter 1")
  var userIn = readline(stdin)
  let ramArg = "-Xmx" & userIn & "G"
  result = ramArg
  echo("Ram Argument Set to: ", ramArg)

proc userPrompt*() =
  echo("Please select one of the following options:")
  echo("List - Displays Available Modpacks")
  echo("Ram - Set Java Arguments")
  echo("ModpackName - Installs the requested modpack")
  var userIn = readline(stdin)
  if userIn == "List":
    list()
  elif userIn == "Ram":
    let localRamArg = ram()
    discard localRamArg
  elif userIn == "Infinite Hyperdeath 3":
    quit()
userPrompt()