# Checking user
if [ $USER = "root" ]
then
  echo "Do not run this script as root!"
  exit 1
fi


# Getting requirements
sudo apt update -y
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install git curl fuse libfuse2 ack-grep python3-pip python3-neovim nodejs npm -y
python3 -m pip install neovim
sudo npm install -g neovim


# Extracting binaries from app image
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /usr/share/neovim
sudo ln -s /usr/share/neovim/AppRun /usr/bin/nvim


# Configuration and plugins
mkdir -p ~/.config
cp -R ./nvim ~/.config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Getting bash lang server for bash scripts autocomplete
sudo npm i -g bash-language-server


# Cleaning app image
rm -rf nvim.appimage


# Plugins installation
nvim -c "PlugInstall" -c "UpdateRemotePlugins"

