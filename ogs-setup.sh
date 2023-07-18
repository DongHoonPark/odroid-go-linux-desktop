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

# 6. Install antimicro/ antimicrox to enable joystick input 
cd ~
wget https://github.com/DongHoonPark/antimicrox/releases/download/v3.3.4-aarch64/antimicrox-3.3.4-focal-aarch64.deb
sudo apt install qt5-default git #execution dependency
sudo dpkg -i antimicrox-3.3.4-focal-aarch64.deb

# 7. Install misc apps 
sudo apt install xdrp -y    # remote desktop
echo xfce4-session > ~/.xsession
sudo service xrdp restart 

# 8. Install alternative booting process logo
# I had been followed instruction for debian in
# https://github.com/adi1090x/plymouth-themes
# you can apply any booting animation which prefer!
sudo apt install plymouth-themes
cd ~
git clone https://github.com/adi1090x/plymouth-themes
cd plymouth-themes/pack_4
sudo cp -r splash /usr/share/plymouth/themes/
cd ~
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/splash/splash.plymouth 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u


sudo apt install onboard -y # virtual keyboard
#sudo apt install blueman # bluetooth manager

# 9. Install pip and setup env
sudo apt install python3-pip
sudo apt isntall python-is-python3

# 8. Install PySide2 
sudo apt isntall libpyside2-dev python3-pyside2.*


