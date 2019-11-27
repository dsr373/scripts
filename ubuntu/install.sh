# this script is meant to install and configure a number of tools
# tested on Ubuntu 18.04 and 19.04 with default repositories
# it assumes that your .profile has the GOPATH variable configured properly,
# otherwise the `go get` command will fail.

cd ~

# absolutely necessary
sudo apt install git -y
# sysadmin
sudo apt install tlp --install-recommends -y
sudo apt install htop -y
sudo apt install timeshift -y
# tools
sudo apt install qtpass -y
sudo apt install chromium-browser -y
sudo apt install python3 python3-pip golang -y
sudo apt install vim neovim -y
sudo apt install thefuck -y
sudo apt install pandoc -y
sudo apt install curl -y
sudo apt install zathura zathura-djvu pqiv ranger redshift speedcrunch onedrive vlc clementine fonts-firacode -y
# touchpad drivers
sudo apt install xserver-xorg-input-synaptics -y
sudo apt install xdotool libinput-tools ruby -y
sudo gem install fusuma

# setup neovim
mkdir -p ~/.config/nvim
printf "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc\n" > ~/.config/nvim/init.vim

sudo snap install code --classic
sudo snap install skype --classic
sudo snap install discord
sudo snap install mailspring

# set up go env
source .profile
mkdir -p ~/go/bin
mkdir -p ~/go/src

# chrome
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
cd ~

# python libs
sudo pip3 install matplotlib numpy scipy
sudo pip3 install youtube-dl