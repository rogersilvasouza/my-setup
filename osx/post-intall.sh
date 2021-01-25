#!/usr/bin/env sh

##
#
#   To install CMD + Space bar > Terminal
#   curl -sL https://raw.githubusercontent.com/rogersilvasouza/my-setup/master/osx/post-intall.sh | sh
#
# 	Original Forked  https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
#   Works in 11.1
#
#   Red Bold     : \e[1;31m

# Enter the OS X administrator password
printf '\e[1;31mOS X Password (Privileges of Admistrador)\e[0m\n'
sudo -v

printf '\e[1;31mDisable the sound effects on boot\e[0m\n'
sudo nvram SystemAudioVolume=" "

printf '\e[1;31mCheck for software updates daily, not just once per week\e[0m\n'
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

printf '\e[1;31mSet sidebar icon size to medium\e[0m\n'
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

printf '\e[1;31mExpand save panel by default\e[0m\n'
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

printf '\e[1;31mExpand print panel by default\e[0m\n'
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

printf '\e[1;31mRemove duplicates in the Open With menu (also see lscleanup alias)\e[0m\n'
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

printf '\e[1;31mDisable the “Are you sure you want to open this application?” dialog\e[0m\n'
defaults write com.apple.LaunchServices LSQuarantine -bool false

printf '\e[1;31mSave screenshots to the Downloads\e[0m\n'
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

printf '\e[1;31mSave screenshots in JPG format (other options: BMP, GIF, JPG, PDF, TIFF)\e[0m\n'
defaults write com.apple.screencapture type -string "jpg"

printf '\e[1;31mDisable shadow in screenshots\e[0m\n'
defaults write com.apple.screencapture disable-shadow -bool true

printf '\e[1;31mListar Arquivos sempre em listview\e[0m\n'
sudo defaults write com.apple.Finder FXPreferredViewStyle Nlsv

printf '\e[1;31mFinder: disable window animations and Get Info animations\e[0m\n'
defaults write com.apple.finder DisableAllAnimations -bool true

printf '\e[1;31mShow icons for hard drives, servers, and removable media on the desktop\e[0m\n'
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop         -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop     -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop     -bool false

printf '\e[1;31mDisplay full POSIX path as Finder window title\e[0m\n'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

printf '\e[1;31mDisable local Time Machine backups\e[0m\n'
hash tmutil &> /dev/null && sudo tmutil disablelocal

printf '\e[1;31mAcesso Total ao Teclado (Ex:Ativar a tecla Tab, em caixas de diálogo modais)\e[0m\n'
sudo defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

printf '\e[1;31mHabilitar subpixel e renderização de fontes em LCDs não-Apple\e[0m\n'
sudo defaults write NSGlobalDomain AppleFontSmoothing -int 2

printf '\e[1;31mHabilitar o Dock 2D\e[0m\n'
sudo defaults write com.apple.dock no-glass -bool true

printf '\e[1;31mDesativar transparência na barra de menu\e[0m\n'
sudo defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

printf '\e[1;31mSempre mostrar as barras de rolagem\e[0m\n'
sudo defaults write NSGlobalDomain AppleShowScrollBars -string "Auto"

printf '\e[1;31mDesativar animações de janelas e pastas\e[0m\n'
sudo defaults write com.apple.finder DisableAllAnimations -bool true

printf '\e[1;31mMostrar todas as extensções de arquivo no Finder\e[0m\n'
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf '\e[1;31mUse o diretório atual como escopo de pesquisa padrão no Finder\e[0m\n'
sudo defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

printf '\e[1;31mMostrar a barra do caminho no Finder\e[0m\n'
sudo defaults write com.apple.finder ShowPathbar -bool true

printf '\e[1;31mMostrar barra de status no Finder\e[0m\n'
sudo defaults write com.apple.finder ShowStatusBar -bool true

printf '\e[1;31mMostrar luzes indicadoras para os aplicativos abertos no Dock\e[0m\n'
sudo defaults write com.apple.dock show-process-indicators -bool false

printf '\e[1;31mAbrir aplicativos sem animação a partir do Dock\e[0m\n'
sudo defaults write com.apple.dock launchanim -bool false

printf '\e[1;31mDesativar animações ao abrir e fechar janelas\e[0m\n'
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

printf '\e[1;31mDesabilitar a verificação de imagem de disco\e[0m\n'
sudo defaults write com.apple.frameworks.diskimages skip-verify -bool true
sudo defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
sudo defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

printf '\e[1;31mAutomaticamente abrir uma nova janela do Finder quando um volume estão montado\e[0m\n'
sudo defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
sudo defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
sudo defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

printf '\e[1;31mEvite criar .DS_Store Volumes de rede\e[0m\n'
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf '\e[1;31mDesativar o aviso quando mudar uma extensão de arquivo\e[0m\n'
sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf '\e[1;31mHabilitar snap-to-grid para ícones do desktop\e[0m\n'
sudo /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

printf '\e[1;31mHabilitar o aviso antes de esvaziar a Lixeira\e[0m\n'
sudo defaults write com.apple.finder WarnOnEmptyTrash -bool false

printf '\e[1;31mDesativar cache do Safari para os Top Sites\e[0m\n'
sudo defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

printf '\e[1;31mAtivar menu de debug do Safari\e[0m\n'
sudo defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

printf '\e[1;31mDesative o reabrir as janelas quando o desligar o Mac\e[0m\n'
sudo defaults write com.apple.loginwindow TALLogoutSavesState -bool false
sudo defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

printf '\e[1;31mMostrar a Pasta ~/Library\e[0m\n'
sudo chflags nohidden ~/Library

printf '\e[1;31mMostrar Arquivos Ocultos\e[0m\n'
defaults write com.apple.Finder AppleShowAllFiles YES;
killall -HUP Finder;

# printf '\e[1;31mEscondendo o Icone do Spotlight\e[0m\n'
# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
# killall SystemUIServer

printf '\e[1;31mReindex Apps\e[0m\n'
sudo mdutil -E /

# printf '\e[1;31mInstalando o Oh My zsh\e[0m\n'
# sudo curl -L http://install.ohmyz.sh | sh

# Brew version https://brew.sh/
# printf '\e[1;31mInstall Brew (Package Management)\e[0m\n'
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

printf '\e[1;31mPermitir instalar apps de terceiros\e[0m\n'
sudo spctl --master-disable

printf '\e[1;31mDesabilitar repetição de teclas\e[0m\n'
sudo efaults write -g ApplePressAndHoldEnabled -bool false
