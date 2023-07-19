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
sudo apt install update-manager-core -y
sudo do-release-upgrade
# Upgrade to 20.04 focal fosa
# You need to enter several times during upgrade. Please make sure your eyes on it.

# 5. Setup X11 xorg.conf and lightdm setting
# OGS : https://forum.odroid.com/viewtopic.php?t=42196 
# OGU : https://forum.odroid.com/viewtopic.php?f=220&t=46487

sudo apt install lightdm xfce4 xfce4-power-manager git
# IMPORTANT!: At the "Configuring lightdm" screen, choose "lightdm", NOT "gdm3"
cd ~
git clone https://github.com/DongHoonPark/odroid-go-linux-desktop
cd odroid-go-linux-desktop
sudo cp xorg.ogs.conf /etc/X11/xorg.conf
sudo cp lightdm.conf /etc/lightdm/lightdm.conf
sudo systemctl start lightdm

# 6. Install antimicrox, onboard to enable joystick input and virtual keyboard
cd ~
wget https://github.com/DongHoonPark/antimicrox/releases/download/v3.3.4-aarch64/antimicrox-3.3.4-focal-aarch64.deb
sudo apt install qt5-default #execution dependency
sudo dpkg -i antimicrox-3.3.4-focal-aarch64.deb
rm antimicrox-3.3.4-focal-aarch64.deb
sudo apt install onboard -y # virtual keyboard
cd odroid-go-linux-desktop
# copy settings
sudo cp -r odroid/.config/ ../ 
sudo cp -r odroid/.local/ ../ 


# 7. Install misc apps 
sudo apt install xrdp -y    # remote desktop
echo xfce4-session > ~/.xsession
sudo service xrdp restart 

# 8. Install alternative booting process logo
# I had been followed instruction for debian in
# https://github.com/adi1090x/plymouth-themes
# you can apply any booting animation which prefer!
sudo apt install plymouth-themes -y
cd ~
git clone https://github.com/adi1090x/plymouth-themes
cd plymouth-themes/pack_1
sudo cp -r blockchain /usr/share/plymouth/themes/
cd ~
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/blockchain/blockchain.plymouth 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u
rm -rf plymouth-themes

# 9. Install pip and setup env
sudo apt install python3-pip -y
sudo apt install python-is-python3 -y

# 10. Install PySide2 
sudo apt install libpyside2-dev python3-pyside2.* -y

# 11. Disable unnecessary service : speed up booting
sudo systemctl disable smbd.service
sudo systemctl disable nmbd.service
sudo systemctl disable NetworkManager-wait-online.service

# 12. Finalizing install
sudo reboot