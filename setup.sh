

############
#SystemPref#
############

#Ask for password when screen is locked (doesn't work)
defaults delete com.apple.screensaver "tokenRemovalAction"
defaults write com.apple.screensaver askForPassword -bool true

#Mute the speaker
osascript -e "set Volume 0"

#Change icons in systray

defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.airplay" -bool false
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.airport" -bool false
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -bool true
defaults delete com.apple.systemuiserver menuExtras
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Volume.menu" "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"
killall SystemUIServer

#Import Dock Applications
defaults delete com.apple.dock
defaults import com.apple.dock ~/config/dock.xml
killall Dock

########
#iTerm2#
########

# Setup iTerm preference from the config PrefsCustomFolder
defaults write com.googlecode.iterm2 PrefsCustomFolder -string /Users/${USER}/config/iterm/

# Install the a custom Solarized Dark theme for iTerm
#open "${HOME}/.config/Solarized_vimucchi.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
#defaults write com.googlecode.iterm2 PromptOnQuit -bool false

#Make Chrom

#Launch Application
open -a "iTerm"
open -a "Managed Software Center"
#Slack configuration
open -a "Google Chrome" 'https://42born2code.slack.com/'
open -a "Spectacle"
#quit terminal
killall Terminal
