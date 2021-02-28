sudo apt update -y
sudo apt install python3-pip python3-neovim nodejs npm -y
sudo npm i -g bash-language-server

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
wait(2)

./nvim.appimage --appimage-extract
sudo mv squashfs-root /usr/share/neovim
sudo ln -s /usr/share/neovim/AppRun /usr/bin/nvim
cp -R ./nvim ~/.config
 ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm -rf nvim.appimage
