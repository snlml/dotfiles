#!/bin/bash


echo "Package install"

sudo xbps-install -Syy
sudo xbps-install -u xbps
sudo xbps-install -Syu
sudo xbps-install -Rs void-repo-nonfree 
sudo xbps-install i3-gaps kitty rofi polybar feh zsh git wget curl neofetch 7zip unzip unrar nano ImageMagick htop flatpak qbittorrent dunst

echo "Zsh/theme install"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
set default zsh
cp .zshrc ~/.zshrc
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "Zsh/theme installed"

echo "Dotfiles install"

mkdir -p ~/.config
cp -r "$SCRIPT_DIR/config/"* ~/.config/
cp -r "$SCRIPT_DIR/config"/.??* ~/.config/ 2>/dev/null || true

echo "Dotfiles installed!"

echo "Font install"

fc-cache -fv
