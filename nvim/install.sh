sudo apt update -y
sudo apt install curl git fuse libfuse2 ack-grep python3-pip python3-neovim nodejs npm -y
pip3 install neovim

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /usr/share/neovim
sudo ln -s /usr/share/neovim/AppRun /usr/bin/nvim

mkdir -p ~/.config
cp -R ./nvim ~/.config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo npm i -g bash-language-server
rm -rf nvim.appimage

echo Install nvim plugins:
echo :PlugInstall
echo :UpdateRemotePlugins
echo :PlugUpdate

