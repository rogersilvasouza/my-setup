#!/usr/bin/env sh

##
#   curl -sL https://gist.github.com/rogersilvasouza/3884717/raw/e728528194146f5c8508b41d4b69f707b1b6c91a/hack.sh | sh
#

echo "Listar Arquivos sempre em listview"
sudo defaults write com.apple.Finder FXPreferredViewStyle Nlsv

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