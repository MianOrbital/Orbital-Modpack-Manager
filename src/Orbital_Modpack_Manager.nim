#Sic Semper Tyranus

#Imports the other .nim files
import packDirsManager
import modpackDownloader
import jsonManager

proc install() =
  packDirsManager()
  modpackDownloader()
  modpackJsonManager()

proc run() =
  echo "WIP - launch via Mojang Launcher (set ram!)"

proc main() =
  echo:
    """To install enter 1
    To launch enter 2
    WOE UPON THEE WHO ATTEMPT TO INSTALL THIS TWICE
    I also did not test this as a full program!"""
  let userInput = readLine(stdin)
  if userInput == "1":
    install()
  elif userInput == "2":
    run()
  else:
    echo "Wrong"
    main()
main()