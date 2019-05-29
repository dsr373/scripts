cd ~

# absolutely necessary
sudo apt install git -y
# sysadmin
sudo apt install tlp --install-recommends -y
sudo apt install htop -y
sudo apt install timeshift -y
# tools
sudo apt install python3 python3-pip golang -y
sudo apt install vim neovim -y
sudo apt install zathura zathura-djvu pqiv ranger redshift speedcrunch onedrive vlc -y
# input
sudo apt install xserver-xorg-input-synaptics -y
sudo apt install xdotool libinput-tools ruby -y
sudo gem install fusuma

sudo snap install code --classic
sudo snap install skype --classic
sudo snap install spotify
sudo snap install mailspring

# set up go env
source .profile
mkdir -p ~/go/bin
mkdir -p ~/go/src

# powerline
go get -u github.com/justjanne/powerline-go

# chrome
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
cd ~

# python libs
sudo pip3 install matplotlib numpy scipy
