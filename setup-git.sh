#!/bin/bash

if [ $USER = "root" ]
then
  echo "Don't run this script as root!"
  exit 1
fi

# Install
sudo apt update
sudo apt install git git-flow -y

# Setup ssh
ssh-keygen -t ed25519 -C "djordje.tanaskovic1998@gmail.com"
eval `ssh-agent -s`
sudo ssh-add ~/.ssh/id_ed25519
 
# Add to GitHub
clip.exe < ~/.ssh/id_ed25519.pub
echo Content of file id_ed25519 is copied to clipboard
echo Add it to Github - https://github.com/settings/keys

read -p "Press button [Y/n]: " -n 1 -r

if [[ $REPLY =~ ^[Nn]$ ]]
then
  echo "Abort."
  exit 1
else
  echo ""
fi


# User configuration
EMAIL="djordje.tanaskovic1998@gmail.com"
NAME="djordjetane"

read -p \
"Email: djordje.tanaskovic1998@gmail.com
Username: djordjetane
Do you want to change? (Y/n): " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
	
	MAILREGEX=[a-zA-Z0-9][a-zA-Z0-9\.1?#]+@[a-z]+\.[a-z]+ 
  echo "Please enter"
  while true
    do
      echo -e -n "Email: "
      read EMAIL

      if [[ $EMAIL =~ ^$MAILREGEX$ ]]
      then
        break  
      else
        echo "Incorrect email format"
      fi
    done

    while true
    do
      echo -e -n "Username: "
      read NAME
      
      VAL=$(grep -cF "^[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$" <<< $NAME)
			
			if [ $VAL == "1" ]
      then
        break
      else
        echo "Username has invalid characters"
      fi        
    done
fi

git config --global user.email "$EMAIL"
git config --global user.name "$NAME"

# Making neovim default editor
which nvim > /dev/null
if [ $? == 0 ]
then
  git config --global core.editor "nvim"
  echo "Neovim set as default git editor"
else
  echo "Neovim does not exist" 
  which vim > /dev/null

  if [ $? == 0 ]
  then
    git config --global core.editor "nvim"
    echo "Vim set as default git editor"
  else
    git config --global core.editor "vi"
    echo "Vi set as default git editor"
  fi
fi

# Aliases
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
