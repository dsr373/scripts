cd ~

# absolutely necessary
sudo pacman -Syu git --noconfirm
# sysadmin
sudo pacman -S htop powertop timeshift --noconfirm
sudo pacman -S tlp --noconfirm
# tools
sudo pacman -S go --noconfirm
sudo pacman -S vim neovim --noconfirm
sudo pacman -S zathura zathura-pdf-mupdf zathura-djvu --noconfirm
sudo pacman -S ranger pandoc speedcrunch --noconfirm
sudo pacman -S vlc --noconfirm
sudo pacman -S qtpass chromium gnome-keyring --noconfirm
sudo pacman -S browserpass browserpass-chromium broswerpass-firefox --noconfirm
sudo pacman -S thefuck --noconfirm
# plasma stuff -- I assume KDE for sanity
sudo pacman -S breeze-gtk --noconfirm
sudo pacman -S redshift plasma5-applets-redshift-control plasma5-applets-weather-widget --noconfirm
# input
sudo pacman -S xdotool ruby xf86-input-synaptics --noconfirm
sudo gem install fusuma

# snap
#sudo pacman -S snapd
# REMEBER TO RUN: sudo systemctl enable --now snapd.socket
#sudo ln -s /var/lib/snapd/snap /snap

sudo pip3 install matplotlib numpy scipy
sudo pip3 install youtube-dl
sudo pip install pynvim

# AUR
pamac build onedrive-abraunegg
pamac build google-chrome

