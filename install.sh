#!/bin/bash
echo "| ------------------------------- |"
echo "|    MacOS theme installer for    |"
echo "|           ElementaryOS          |"
echo "| ------------------------------- |"
echo "|                                 |"
echo "|              GITHUB             |"
echo "|          @marciioluucas         |"
echo "|                                 |"
echo "| ------------------------------- |"
# Installing ELEMENTARY TEWAK
echo "  >  Installing Elementary Tweak Tool"
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo apt-update
sudo apt install -y elementary-tweaks
echo " [✓] Elementary Tweak Tool was finished with success"
echo ""
PLANK_THEMES_FOLDER="~/.local/share/plank/themes"
ICONS_THEMES_FOLDER="~/.icons/"
THEMES_FOLDER="~/.themes"
# Checking necessary folders
echo "  >  Checking necessary folders"
if [ ! -d $PLANK_THEMES_FOLDER ]; then
  mkdir $PLANK_THEMES_FOLDER
fi
if [ ! -d $ICONS_THEMES_FOLDER ]; then
  mkdir $ICONS_THEMES_FOLDER
fi
if [ ! -d $THEMES_FOLDER ]; then
  mkdir $THEMES_FOLDER
fi
echo " [✓] Folders checked with successful"
echo ""
echo "  >  ICONS"
echo ""
echo "  >  Installing icons"

if [ ! -d $ICONS_THEMES_FOLDER/MacOS-Icons ]; then
mkdir $ICONS_THEMES_FOLDER/MacOS-Icons
fi
yes | cp -rf  ./theme-files/icons/ $ICONS_THEMES_FOLDER/MacOS-Icons

echo "  >  Configuring icons"
$ICONS_THEMES_FOLDER/MacOS-Icons/configure then
echo " [✓] Icons Installed"
echo ""
echo "  >  DOCK"
echo ""
echo "  >  Installing Dock"

#Changing dock theme
if [ ! -d $PLANK_THEMES_FOLDER/MacOS-Dock ]; then
mkdir $PLANK_THEMES_FOLDER/MacOS-Dock
fi

yes | cp ./theme-files/dock/* $PLANK_THEMES_FOLDER/MacOS-Dock

sudo apt install software-properties-common
sudo add-apt-repository ppa:ricotz/docky

#Installing zoom effect on dock
sudo apt update
sudo apt install --reinstall plank
killall plank

echo " [✓] Dock Installed"
echo ""
echo "  >  THEME"
echo ""
echo "  >  Installing Themes"
if [ ! -d $THEMES_FOLDER/Sierra-dark ]; then
mkdir $THEMES_FOLDER/Sierra-dark
fi
if [ ! -d $THEMES_FOLDER/Sierra-dark-solid ]; then
mkdir $THEMES_FOLDER/Sierra-dark-solid
fi
if [ ! -d $THEMES_FOLDER/Sierra-light-solid ]; then
mkdir $THEMES_FOLDER/Sierra-light-solid
fi

yes | cp -rf  ./theme-files/themes/Sierra-dark/ $THEMES_FOLDER/Sierra-dark
yes | cp -rf  ./theme-files/themes/Sierra-dark-solid/ $THEMES_FOLDER/Sierra-dark-solid
yes | cp -rf  ./theme-files/themes/Sierra-light-solid/ $THEMES_FOLDER/Sierra-light-solid
echo " [✓] Themes Installed"
chmod 777 -R $THEMES_FOLDER
chmod 777 -R $PLANK_THEMES_FOLDER
chmod 777 -R $ICONS_THEMES_FOLDER
plank --preferences
# Exit from the script with success (0)
exit 0