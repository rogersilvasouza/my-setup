#!/usr/bin/env sh

##
#   curl -sL https://gist.github.com/rogersilvasouza/3884717/raw/e728528194146f5c8508b41d4b69f707b1b6c91a/hack.sh | sh
#
#
# 	Original https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#

# Ask for the administrator password upfront
echo "Senha do administrator"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set standby delay to 24 hours (default is 1 hour)
echo "Set standby delay to 24 hours (default is 1 hour)"
sudo pmset -a standbydelay 86400

echo "# Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "

echo "# Menu bar: hide the Time Machine, Volume, User, and Bluetooth icons"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
	defaults write "${domain}" dontAutoLoad -array \
		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
		"/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu"

echo "# Set highlight color to green"
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

echo "# Never go into computer sleep mode"
sudo systemsetup -setcomputersleep Off > /dev/null

echo "# Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "# Set sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

echo "# Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "# Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "# Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

echo "# Reveal IP address, hostname, OS version, etc. when clicking the clock # in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo "# Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "# Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "# Save screenshots to the Downloads"
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

echo "# Save screenshots in JPG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "jpg"

echo "# Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo "# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo "Listar Arquivos sempre em listview"
sudo defaults write com.apple.Finder FXPreferredViewStyle Nlsv

echo "# Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

echo "# Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "# Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "# Disable local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

echo "# Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

echo "# Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

echo "# Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

echo "# Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

echo "Sincronizar Hora com NTP"
sudo ntpdate -u time.apple.com

echo "Acesso Total ao Teclado (Ex:Ativar a tecla Tab, em caixas de diÃ¡logo modais)"
sudo defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Habilitar subpixel e renderizaÃ§Ã£o de fontes em LCDs nÃ£o-Apple"
sudo defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Habilitar o Dock 2D"
sudo defaults write com.apple.dock no-glass -bool true

echo "AplicaÃ§Ãµes minizadas/escondidas ficam icones transparentes"
sudo defaults write com.apple.dock showhidden -bool true

echo "Desativar transparÃªncia na barra de menu"
sudo defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

echo "Sempre mostrar as barras de rolagem"
sudo defaults write NSGlobalDomain AppleShowScrollBars -string "Auto"

echo "Desativar animaÃ§Ãµes de janelas e pastas"
sudo defaults write com.apple.finder DisableAllAnimations -bool true

echo "Mostrar todas as extensÃµes de arquivo no Finder"
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Use o diretÃ³rio atual como escopo de pesquisa padrÃ£o no Finder"
sudo defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Mostrar a barra do caminho no Finder"
sudo defaults write com.apple.finder ShowPathbar -bool true

echo "Mostrar barra de status no Finder"
sudo defaults write com.apple.finder ShowStatusBar -bool true

echo "Desativar sombra em screenshots"
sudo defaults write com.apple.screencapture disable-shadow -bool true

echo "Mostrar luzes indicadoras para os aplicativos abertos no Dock"
sudo defaults write com.apple.dock show-process-indicators -bool true

echo "Abrir aplicativos sem animaÃ§Ã£o a partir do Dock"
sudo defaults write com.apple.dock launchanim -bool false

echo "Desativar animaÃ§Ãµes ao abrir e fechar janelas"
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

echo "Desabilitar a verificaÃ§Ã£o de imagem de disco"
sudo defaults write com.apple.frameworks.diskimages skip-verify -bool true
sudo defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
sudo defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Automaticamente abrir uma nova janela do Finder quando um volume estÃ¡ montado"
sudo defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
sudo defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
sudo defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo "Evite criar .DS_Store Volumes de rede"
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Desativar o aviso quando mudar uma extensÃ£o de arquivo"
sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Habilitar snap-to-grid para Ã­cones do desktop"
sudo /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "Habilitar o aviso antes de esvaziar a Lixeira"
sudo defaults write com.apple.finder WarnOnEmptyTrash -bool true

echo "Exigir senha imediatamente apÃ³s o Sleep ou Screen Saver"
sudo defaults write com.apple.screensaver askForPassword -int 1
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Desativar cache do Safari para os Top Sites"
sudo defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "Ativar menu de debug do Safari"
sudo defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Adicionar um item de menu de contexto para mostrar o Web Inspector"
sudo defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

echo "Usar apenas UTF-8 no Terminal"
sudo defaults write com.apple.terminal StringEncodings -array 4

echo "Desative o reabrir as janelas quando o desligar o Mac"
sudo defaults write com.apple.loginwindow TALLogoutSavesState -bool false
sudo defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

echo "Habilitar Dashboard -Dev Mode- (permite manter widgets na Ã¡rea de trabalho)"
sudo defaults write com.apple.dashboard devmode -bool true

echo "Redefinir Launchpad"
[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

echo "Mostrar a Pasta ~/Library"
sudo chflags nohidden ~/Library

echo "Desativar backups do Time Machine"
sudo hash tmutil &> /dev/null && sudo tmutil disablelocal

echo "Mostrar Arquivos Ocultos"
defaults write com.apple.Finder AppleShowAllFiles YES; 
killall -HUP Finder;

echo "Escondendo o Icone do Spotlight"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
killall SystemUIServer

echo "Instalando o Oh My zsh"
curl -L http://install.ohmyz.sh | sh