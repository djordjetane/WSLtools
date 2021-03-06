if [ $USER = "root" ]
then
  echo "Don't run script as root"
  exit 1
fi

sudo apt update && sudo apt install zsh fonts-powerline -y
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp agnoster.zsh-theme /home/$USER/.oh-my-zsh/themes
cp .zshrc /home/$USER

echo "1) Set fonts from Ubuntu->Properties->Font->\"ubuntu mono derivative powerline\""
echo "2) Run powershell script from Windows"
echo "3) Logout and enter again"
