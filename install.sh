cd ~

# absolutely necessary
sudo apt install git
# sysadmin
sudo apt install tlp --install-recommends
# tools
sudo apt install python3 python3-pip golang
sudo apt install vim neovim
sudo apt install zathura zathura-djvu pqiv ranger redshift speedcrunch onedrive vlc
# input
sudo apt install xdotool libinput-tools ruby
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
