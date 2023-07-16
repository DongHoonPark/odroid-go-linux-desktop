# Odroid Go Linux Desktop

This repository is setup guide for linux desktop of odroid go super/ ultra hardware.
Please be aware that the purpose of the script is to run QT gui application on linux desktop.

This script is not fully tested. If there is problem, please raise a issue.

And, even though antimicrox is embedded in script but configuration file is not made yet. You need to configure joystick to mouse mapping by yourself now. 

# Prerequisite
- Ubuntu 20.04 focal image
  - You can get it from hardkernel website [OGS image](https://wiki.odroid.com/odroid_go_advance/make_sd_card) / [OGU image](https://wiki.odroid.com/odroid_go_ultra/getting_started/installing_os_image)
- Install it to the device
- Connect wifi and login ssh
  - Default id/password is odroid

# Setup Procedure

:warning: This step will disable the game emulation launcher which is built-in gui interface of Odroid-Go. If you are not friendly with linux cli, Do not use the script below.

```
git clone https://github.com/DongHoonPark/odroid-go-linux-desktop
cd odroid-go-linux-desktop
sudo sh ./odroid-setup-1.sh
# There will be reboot after first script run, and then execute second script
sudo sh ./odroid-setup-2.sh
```

enjoy!



