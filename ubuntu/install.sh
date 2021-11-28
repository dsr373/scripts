# this script is meant to install and configure a number of tools
# tested on Ubuntu 20.04 with default repositories
# it assumes that your .profile has the GOPATH variable configured properly,
# otherwise the `go get` command will fail.

cd ~

# absolutely necessary
sudo apt install git -y
# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# sysadmin
sudo apt install tlp --install-recommends -y
sudo apt install htop -y
# tools
sudo apt install chromium-browser \
     python3 python3-pip golang \
     vim neovim curl \
     qt5-style-kvantum qt5-style-kvantum-themes \
     zathura zathura-ps zathura-djvu pqiv nomacs ranger \
     speedcrunch onedrive rclone vlc clementine fonts-firacode \
     evolution thunderbird pandoc mps-youtube thefuck kdocker -y
# touchpad drivers
sudo apt install xdotool libinput-tools ruby -y
sudo apt install xserver-xorg-input-synaptics -y
gem install fusuma
sudo apt install wmctrl -y
sudo gpasswd -a $USER input

# fix firefox input
echo export MOZ_USE_XINPUT2=1 | sudo tee /etc/profile.d/use-xinput2.sh

# nextcloud
sudo add-apt-repository ppa:nextcloud-devs/client
sudo apt install nextcloud-client -y

# signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# gnome extensions
# sudo apt install chrome-gnome-shell
# sudo apt install gnome-shell-extension-arc-menu \
    # gnome-shell-extension-bluetooth-quick-connect \
    # gnome-shell-extension-dash-to-panel -y

# setup neovim
mkdir -p ~/.config/nvim
printf "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc\n" > ~/.config/nvim/init.vim

flatpak install flathub com.skype.Client
# flatpak install flathub org.inkscape.Inkscape
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.bitwarden.desktop
flatpak install flathub com.visualstudio.code-oss

# set up go env
# source .profile
# mkdir -p ~/go/bin
# mkdir -p ~/go/src

# python libs
sudo pip3 install matplotlib numpy scipy
sudo pip3 install youtube-dl
