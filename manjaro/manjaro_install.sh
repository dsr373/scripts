cd ~

# absolutely necessary
sudo pacman -S git --noconfirm
# sysadmin
sudo pacman -S htop --noconfirm
sudo pacman -S timeshift --noconfirm
# tools
sudo pacman -S go --noconfirm
sudo pacman -S vim neovim --noconfirm
sudo pacman -S zathura zathura-djvu --noconfirm
sudo pacman -S ranger --noconfirm
sudo pacman -S redshift --noconfirm
sudo pacman -S speedcrunch --noconfirm
sudo pacman -S vlc --noconfirm
# input
sudo pacman -S xdotool --noconfirm
sudo pacman -S ruby --noconfirm
# sudo gem install fusuma

# snap
sudo pacman -S snapd
# REMEBER TO RUN: sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# AUR
pamac build onedrive
pamac build google-chrome

