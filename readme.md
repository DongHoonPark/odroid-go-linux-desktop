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




