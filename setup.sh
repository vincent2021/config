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
open "${HOME}/.config/Solarized_vimucchi.itermcolors"

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Copy Config file VIM/ZSH
cp .vimrc ~
cp .zshrc ~

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Symlinksgoinfre
ln -s /sgoinfre/goinfre/Perso/vimucchi ~/sgoinfre

# Install Powerline font
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Launch Application
open -a "iTerm"
open -a "Managed Software Center"
#Slack configuration
open -a "Google Chrome" 'https://42born2code.slack.com/'
#quit terminal
killall Terminal
