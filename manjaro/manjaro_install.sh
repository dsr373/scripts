cd ~

# absolutely necessary
sudo pacman -S git --noconfirm
# sysadmin
sudo pacman -S htop --noconfirm
sudo pacman -S powertop --noconfirm
sudo pacman -S timeshift --noconfirm
# tools
sudo pacman -S go --noconfirm
sudo pacman -S vim neovim --noconfirm
sudo pacman -S zathura zathura-djvu --noconfirm
sudo pacman -S ranger --noconfirm
sudo pacman -S pandoc --noconfirm
sudo pacman -S redshift --noconfirm
sudo pacman -S speedcrunch --noconfirm
sudo pacman -S vlc --noconfirm
sudo pacman -S qtpass --noconfirm
sudo pacman -S chromium --noconfirm
sudo pacman -S evolution --noconfirm
sudo pacman -S gnome-keyring --noconfirm
sudo pacman -S thefuck --noconfirm
# input
sudo pacman -S xdotool --noconfirm
sudo pacman -S ruby --noconfirm
sudo pacman -S xf86-input-synaptics --noconfirm
sudo gem install fusuma

# snap
sudo pacman -S snapd
# REMEBER TO RUN: sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# AUR
pamac build onedrive
pamac build google-chrome

sudo pip3 install matplotlib numpy scipy
sudo pip3 install youtube-dl
sudo pip install pynvim

