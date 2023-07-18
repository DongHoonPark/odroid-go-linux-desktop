# Odroid Go Linux Desktop

This repository is setup guide and image for linux desktop of odroid go super hardware.
Please be aware that the purpose of the script is to run QT gui application on linux desktop.

This script is not fully tested. If there is problem, please raise a issue.

If you just want to the complete setup, use [release image](). It will bring you to the end of step. 


# Prerequisite
- Ubuntu 18.04 bionic image
  - You can get it from hardkernel website : [OGS image](https://wiki.odroid.com/odroid_go_advance/make_sd_card)
- Install it to the device
- Connect wifi and login ssh
  - Emulation station &rarr; Configuration &rarr; Wifi &rarr; Plus button
  - Default id/password is odroid 

# Setup Procedure

:warning: This step will disable the game emulation launcher which is built-in gui interface of Odroid-Go. If you are not friendly with linux cli, Do not use the.

### 1. Remove default gui emulation station
```sh
sudo systemctl disable emulationstation
# sudo systemctl disable go4.service #OGU
sudo systemctl enable getty@tty1
# sudo apt remove emulationstation-go2 emulators-64bit-go2 emulators-32bit-go2
```

### 2. Update the pacakge manager
```sh
sudo apt update
sudo apt upgrade
```

### 3. Reboot
```sh
sudo reboot
```

### 4. Update ubuntu to 20.04 focal LTS
During installation, you need to give select on the windows below.
- Service restart
  - Allow restart during upgrade
- Samba server and utilities
  - keep the local version currently installed
- Remove obsolete package
  - yes  
- Restart
  - yes 

```sh
sudo apt install update-manager-core -y
sudo do-release-upgrade 
# Upgrade to 20.04 focal fosa
# You need to enter & y several times during upgrade. Please make sure your eyes on it.
```

### 5. Setup X11 xorg.conf and lightdm setting
:warning: IMPORTANT! : At the "Configure lightdm" screen, choose "lightdm", NOT "gdm3"
This prodcure install xfce desktop but you can use lxde or mate as alternative by your preference
```sh
sudo apt install lightdm xfce4 xfce4-power-manager git
cd ~
git clone https://github.com/DongHoonPark/odroid-go-linux-desktop
cd odroid-go-linux-desktop
sudo cp xorg.ogs.conf /etc/X11/xorg.conf
sudo cp lightdm.conf /etc/lightdm/lightdm.conf
sudo systemctl start lightdm
```

### 6. Install antimicrox, onboard to enable joystick input and virtual keyboard

You can use antimicro which is exist in apt repo but it is not maintained now so I compiled antimicrox as alternative which is descendent of antimicro. If there was a setting used in antimicro, It could be loaded in antimicrox as well. (maybe, not tested.)
```sh
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
cd ..
rm -rf odroid-go-linux-desktop
```

### 7. Install remote desktop
```sh
sudo apt install xrdp -y    # remote desktop
echo xfce4-session > ~/.xsession
sudo service xrdp restart 
```

### 8. Install alternative booting process logo
I had been followed instruction for debian in [HERE](https://github.com/adi1090x/plymouth-themes). You can apply any booting animation which prefer!

The script below is example for blockchain theme which in pack_1
```sh
sudo apt install plymouth-themes -y
cd ~
git clone https://github.com/adi1090x/plymouth-themes
cd plymouth-themes/pack_1
sudo cp -r blockchain /usr/share/plymouth/themes/
cd ~
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/blockchain/blockchain.plymouth 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u
```

