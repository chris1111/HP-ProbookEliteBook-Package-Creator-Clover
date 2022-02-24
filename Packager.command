#!/bin/sh
# HP ProBook EliteBook Packager
# (c) Copyright 2022 chris1111 
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
# Vars
apptitle="HP ProBook EliteBook Packager-Clover"
version="1.0"
# Set Icon directory and file
export ICNS=$(dirname "${0}")
iconfile="$ICNS/AppIcon.icns"
find . -name '.empty' -type f -delete
find . -name '.DS_Store' -type f -delete
find . -name '.gitkeep' -type f -delete
defaults write com.apple.terminal "Default Window Settings" "Pro"
defaults write com.apple.terminal "Startup Window Settings" "Pro"
#   Slick Progress Bar
sleep 1 & PID=$! #Progress Bar
echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`
                **************************************************** 
                ****** HP ProBook EliteBook Package Creator  ******* 
                ****************************************************
`tput sgr0` `tput setaf 7``tput sgr0`"


echo " "
echo " "
printf "["
# While process is running...
while kill -0 $PID 2> /dev/null; do 
    printf  "➤ ➤ ➤ ➤ ➤ ➤ ➤ ➤ "

    sleep 0.2
done

printf '\e[8;44;85t'

nameh=`users`
function echob() {
  echo "`tput bold`$1`tput sgr0`"
}
function head
{
clear
echo "                        `tput setaf 7``tput sgr0``tput bold``tput setaf 26`  © Copyright 2022 chris1111`tput sgr0` `tput setaf 7``tput sgr0`"
         echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "
                   
echo "                  `tput setaf 7``tput sgr0``tput bold``tput setaf 26` \033[5mHP ProBook EliteBook Package Creator Clover`tput sgr0` `tput setaf 7``tput sgr0`\033[0m"
         echo "              = = = = = = = = = = = = = = = = = = = = = = = = =  "
echo " "
}
function menu
{
echo "           Welcome "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`$nameh`tput sgr0` `tput setaf 7``tput sgr0`", HP ProBook EliteBook Package Creator Clover "
echo " "
echo "                       `tput setaf 26`
                  ===========================================
                  - Credit -
                  Tester: djams.
                  rehabMan: for all DSDT patch, pathmatic
                  Kext Devs: rehabman, vit9696, Mieze, lvs1974 
                  Intel: for IASL
                  Apple: for pkgbuild, productbuild
                  Clover team: for Clover
                  ==========================================="
echo "                Type:⬇︎"
echo " "
echo "                ✅ ➤ A  Build HP-ProBook-EliteBook-macOS.pkg "
echo "                ✅ ➤ B  Build Install Media HP Laptop Clover.app "
echo "                ❌ Type X  EXIT Programme "
                      

echo "                  ===========================================  "

echo "                 `tput setaf 7``tput sgr0``tput bold``tput setaf 26` \033[5mHP ProBook EliteBook Package Creator Clover`tput sgr0` `tput setaf 7``tput sgr0`\033[0m"
echo "               = = = = = = = = = = = = = = = = = = = = = = = = =  "

read -n 1 option
}
function PACKAGE
{
head
echo " "
echo "Build Package "
echo "
= = = = = = = = = = = = = = = = = = = = = = = = =  
File System Check   
= = = = = = = = = = = = = = = = = = = = = = = = =  "
/usr/libexec/PlistBuddy -c "Print :FilesystemType" /dev/stdin <<< $(diskutil info -plist /)
Sleep 1
rm -rf /$HOME/Desktop/HP-ProBook-EliteBook-Packager/HP-ProBook-EliteBook-macOS
rm -rf $HOME/Desktop/HP-ProBook-EliteBook-Packager/HP-ProBook-EliteBook-macOS.pkg
rm -rf /$HOME/Desktop/HP-ProBook-EliteBook-Packager/"Support Donate.html"
rm -rf $HOME/Desktop/HP-ProBook-EliteBook-Packager/Gatekeeper.command
./HPProBookEliteBookmacOS/HP-ProBook-EliteBook-Package-Creator.sh
# Done
response=$(osascript -e 'tell app "System Events" to display dialog "HP ProBook EliteBook Packager Clover
Done!\n" buttons {"Done"} default button 1 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'" giving up after 10 ')

action=$(echo $response | cut -d ':' -f2)

Open $HOME/Desktop/HP-ProBook-EliteBook-Packager
Sleep 1

echo " "
}
function INSTALLER
{
head
echo " "
echo "Build Install Media HP Laptop Clover.app"
Sleep 1
rm -rf $HOME/Desktop/HP-ProBook-EliteBook-Packager/"Install Media HP Laptop Clover.app"
./Create-Install-Media/create_app.sh
# Done
response=$(osascript -e 'tell app "System Events" to display dialog "Install Media HP Laptop Clover
Done!\n" buttons {"Done"} default button 1 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'" giving up after 10 ')

action=$(echo $response | cut -d ':' -f2)

Open $HOME/Desktop/HP-ProBook-EliteBook-Packager
Sleep 1

echo " "
}
function Quit
{
clear
echo " " 
echo "
Quit Programme"
echo " " 
echob "Thanks`tput setaf 7``tput sgr0``tput bold``tput setaf 26` $hours $nameh`tput sgr0` `tput setaf 7``tput sgr0`"
echo " " 
exit 0
}
while [ 1 ]
do
head
menu
case $option in

a|A)
echo
PACKAGE ;;
b|B)
echo
INSTALLER ;;
x|X)
echo
Quit ;;

*)
echo ""
esac
echo
echob "`tput setaf 7``tput sgr0``tput bold``tput setaf 26`Tye any key to return to menue`tput sgr0` `tput setaf 7``tput sgr0`"
echo
read -n 1 line
clear
done

exit




	
