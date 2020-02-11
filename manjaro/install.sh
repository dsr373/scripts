cd ~

# absolutely necessary
sudo pacman -Syu git --noconfirm
# sysadmin
sudo pacman -S htop powertop tlp yay flatpak --noconfirm
# tools
sudo pacman -S go \
    python-matplotlib python-numpy python-scipy \
    neovim zathura zathura-pdf-mupdf zathura-djvu \
    ranger pandoc speedcrunch \
    youtube-dl vlc mpv \
    qtpass chromium gnome-keyring \
    browserpass browserpass-chromium broswerpass-firefox \
    thefuck --noconfirm
# plasma stuff -- I assume KDE for sanity
sudo pacman -S breeze-gtk --noconfirm
sudo pacman -S redshift plasma5-applets-redshift-control plasma5-applets-weather-widget --noconfirm
# input
sudo pacman -S xdotool ruby xf86-input-synaptics --noconfirm
sudo gem install fusuma

# AUR
yay -Syu onedrive-abraunegg
yay -S kdocker
yay -S megasync
yay -S mps-youtube-git

