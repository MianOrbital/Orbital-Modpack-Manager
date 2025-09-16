#Sic Semper Tyranus

#Imports the other .nim files
import jsonManager
import packDirsManager
import modpackDownloader

proc main() =
  packDirsManager()
  modpackDownloader()
  modpackJsonManager()

proc theBigInstall() =
  echo "To install enter 1 /n To launch enter 2 /n WOE UPON THEE WHO ATTEMPT TO INSTALL THIS TWICE /n I also did not test this as a full program!"
  let userInput = readLine(stdin)
  if userInput == "1":
    main()
  elif userInput == "2":
    echo "I LIED IT DOESNT LAUNCH IT YET (LOL!)"
  else:
    echo "Wrong"
    quit()
theBigInstall()