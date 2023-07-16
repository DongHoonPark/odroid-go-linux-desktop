# This is instruction and bash script to setup odroid-go super
# target system is ubuntu 20.04 focal 

# 1. Remove default gui emulation station

sudo systemctl disable emulationstation
sudo systemctl disable go4.service #OGU
sudo systemctl enable getty@tty1
# sudo apt remove emulationstation-go2 emulators-64bit-go2 emulators-32bit-go2

# 2. Update package manager

sudo apt-get update
sudo apt-get upgrade

# 3. Reboot
sudo reboot

