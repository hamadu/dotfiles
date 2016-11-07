#!/bin/sh

echo "#############"
echo "### nvram ###"
echo "#############"

echo "`Ja-n` volume on boot"
sudo nvram SystemAudioVolume=%05

echo "#################"
echo "### Keyboards ###"
echo "#################"

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Set key-repeat time"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

echo "##############"
echo "### Global ###"
echo "##############"

echo "Set Sidebar icon size Small"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

echo "Show all filename extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -boolean true

echo "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -boolean true

echo "Disable default file save path to iCloud"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Enable subpixel font rendering on non-Apple LCDs (1 light, 2 medium, 3 big)"
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2

echo "###############"
echo "### Menubar ###"
echo "###############"

echo "Show remaining battery time; hide percentage"
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

echo "Format datetime"
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

echo "############"
echo "### Dock ###"
echo "############"

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Speed up dock show"
defaults write com.apple.dock autohide-delay -float 0

echo "Remove the delay for showing the Dock in full screen"
defaults write com.apple.dock autohide-fullscreen-delayed -bool false

echo "Disable magnification"
defaults write com.apple.dock magnification -bool no

echo "Minimize in application"
defaults write com.apple.dock minimize-to-application -bool true

echo "###################"
echo "### Hot-corners ###"
echo "###################"

echo "Launch screensaver on bottomleft corner"
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

echo "Sleep display on topright corner"
defaults write com.apple.dock wvous-tr-corner -int 10
defaults write com.apple.dock wvous-tr-modifier -int 0


echo "############################"
echo "### Spaces and Dashboard ###"
echo "############################"

echo "Disable dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

echo "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "##############"
echo "### Finder ###"
echo "##############"

echo "Use list view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Hide Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool false

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "###################"
echo "### Screensaver ###"
echo "###################"

echo "Require password 5 seconds after sleep/screensaver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

echo "###################"
echo "### Screenshots ###"
echo "###################"

echo "Set screenshot file name prefix"
defaults write com.apple.screencapture name "SS"

echo "Disable window shadow"
defaults write com.apple.screencapture disable-shadow -bool true

echo "###############"
echo "### Restart ###"
echo "###############"

echo "Restart modules"
killall SystemUIServer
killall Finder
killall Dock

echo "###############"
echo "🎉 !Done! 🎉"
echo "###############"
