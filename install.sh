#!/usr/bin/sh

echo "Updates packages repositories..."
sudo pacman -Syu

echo "Installing and set up Zsh with Oh my Zsh..."
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp .zshrc ~/ && cp -r .oh-my-zsh ~/.oh-my-zsh

source ~/.zshrc

echo "Set up Git config..."
cp .gitconfig ~/

echo "Installing Yay packager manager..."
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si

cd .. & rm -rf yay/

echo "Installing Google Chrome..."
yay -S google-chrome

echo "Installing Visual Studio Code and your extensions..."
yay -S visual-studio-code-bin

code --install-extension PKief.material-icon-theme
code --install-extension EditorConfig.EditorConfig
code --install-extension fisheva.eva-theme
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-vscode.cpptools
code --install-extension ocamllabs.ocaml-platform
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension icrawl.discord-vscode

echo "Installing Nodejs environment..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
sudo pacman -S yarn

echo "Installing Discord..."
sudo pacman -S discord

echo "Installation finished!"
