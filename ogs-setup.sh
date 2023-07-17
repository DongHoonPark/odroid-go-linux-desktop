# This is instruction and bash script to setup odroid-go super
# target system is ubuntu 20.04 focal 

# 1. Remove default gui emulation station

sudo systemctl disable emulationstation
# sudo systemctl disable go4.service #OGU
sudo systemctl enable getty@tty1
# sudo apt remove emulationstation-go2 emulators-64bit-go2 emulators-32bit-go2

# 2. Update package manager

sudo apt-get update
sudo apt-get upgrade

# 3. Reboot
sudo reboot

# 4. Update ubuntu to 20.04 focal LTS
sudo apt install update-manager-core
sudo do-release-upgrade

# 5. Setup X11 xorg.conf and lightdm setting
# OGS : https://forum.odroid.com/viewtopic.php?t=42196 
# OGU : https://forum.odroid.com/viewtopic.php?f=220&t=46487

sudo apt install lightdm xfce4 xfce4-power-manager
# IMPORTANT!: At the "Configuring lightdm" screen, choose "lightdm", NOT "gdm3"
sudo cp xorg.ogs.conf /etc/X11/xorg.conf
# sudo cp xorg.ogu.conf /etc/X11/xorg.conf
sudo cp lightdm.conf /etc/lightdm/lightdm.conf
sudo systemctl start lightdm

# 5. Install antimicro/ antimicrox to enable joystick input 
cd ~
wget https://github.com/DongHoonPark/antimicrox/releases/download/v3.3.4-aarch64/antimicrox-3.3.4-focal-aarch64.deb
sudo apt install qt5-default #execution dependency
sudo dpkg -i antimicrox-3.3.4-focal-aarch64.deb

# 6. Install misc apps 
sudo apt isntall onboard # virtual keyboard
#sudo apt install blueman # bluetooth manager

# 7. Install pip 
sudo apt install python3-pip

# 8. Install PySide2 : Takes long time..
sudo apt isntall libpyside2-dev python3-pyside2.*


