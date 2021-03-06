sudo apt update && sudo apt install zsh fonts-powerline -y
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp agnoster.zsh-theme ~/.oh-my-zsh/themes
cp .zshrc ~

echo "Logout and enter again"
