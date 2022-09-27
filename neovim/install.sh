# Checking user
if [ $USER = "root" ]
then
  echo "Do not run this script as root!"
  exit 1
fi


# getting requirements
sudo apt update
sudo apt install -qq -y git curl fuse libfuse2 ack-grep python3 python3-pip python3-pyx python3-jedi
curl -fssl https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -qq -y nodejs npm
#sudo apt install -qq -y python3-neovim
python3 -m pip install pynvim neovim
sudo npm install -g neovim


# Extracting binaries from app image
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
test -d /usr/share/neovim && sudo rm -r /usr/share/neovim
sudo mv squashfs-root /usr/share/neovim
sudo ln -s /usr/share/neovim/AppRun /usr/bin/nvim


# Configuration and plugins
mkdir -p ~/.config/nvim 2>>/dev/null
cp -R ./config/* ~/.config/nvim/
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Getting bash lang server for bash scripts autocomplete
sudo npm i -g bash-language-server


# Cleaning app image
rm -rf nvim.appimage


# Plugins installation
nvim -c "PlugInstall" -c "UpdateRemotePlugins" -c "CocInstall coc-python"

