# this script is meant to install and configure a number of tools
# tested on Ubuntu 18.04 and 19.04 with default repositories
# it assumes that your .profile has the GOPATH variable configured properly,
# otherwise the `go get` command will fail.

cd ~

# absolutely necessary
sudo apt install git -y
# flatpak
# sudo apt install flatpak gnome-software-plugin-flatpak -y
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# sysadmin
sudo apt install tlp --install-recommends -y
sudo apt install htop -y
# tools
sudo apt install qtpass \
	chromium-browser \
	python3 python3-pip golang \
	vim neovim \
	curl \
 	zathura zathura-ps zathura-djvu pqiv nomacs ranger \
        speedcrunch onedrive rclone vlc clementine fonts-firacode \
        evolution pandoc mps-youtube thefuck kdocker -y
# touchpad drivers
sudo apt install xserver-xorg-input-synaptics -y
sudo apt install xdotool libinput-tools ruby -y
gem install fusuma
sudo apt install wmctrl -y

# fix firefox input
echo export MOZ_USE_XINPUT2=1 | sudo tee /etc/profile.d/use-xinput2.sh

# nextcloud
sudo add-apt-repository ppa:nextcloud-devs/client
sudo apt install nextcloud-client -y

# gnome extensions
sudo apt install chrome-gnome-shell

# setup neovim
mkdir -p ~/.config/nvim
printf "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc\n" > ~/.config/nvim/init.vim

flatpak install flathub com.skype.Client
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub com.discordapp.Discord
flatpak install com.visualstudio.code.oss

# set up go env
source .profile
mkdir -p ~/go/bin
mkdir -p ~/go/src

# python libs
sudo pip3 install matplotlib numpy scipy
sudo pip3 install youtube-dl
