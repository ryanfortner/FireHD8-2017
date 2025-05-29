# FireHD8-2017
***No Longer Maintained - Please See Credits and Direct Questions To XDA Thread***

Here is how I converted my Amazon bloatware tablet to a true Android tablet, without hardware modifications, and without using Amazon software.
## Prerequisites
- Fire HD 8 (2017 generation ONLY)
- a Linux system (preferably Ubuntu 22.04, as that is what I used)
- microUSB cable for interacting with your tablet
- fireOS version 5.6.4.0 or later. Check the version you're running from Settings > Device Options > System Update.
- fireOS version 5.7.0.0 is the version I was using.
- `python3`, `python3-serial`, `adb`, `fastboot`, and `dos2unix` installed using your system package manager. For Ubuntu, use the below commands.
```
sudo apt update
sudo add-apt-repository universe
sudo apt install python3 python3-serial adb fastboot dos2unix
```
## Unlocking Bootloader
Make sure ModemManager is disabled.
```
sudo systemctl stop ModemManager
sudo systemctl disable ModemManager
```

Download the scripts.
```
wget https://github.com/ryanfortner/FireHD8-2017/raw/master/amonet-douglas.zip
unzip amonet-douglas.zip
cd amonet
```

Connect the device to the computer now.

At this point, you will need to enter recovery mode. Simply hold down the Volume Up, Volume Down, and Power keys until the screen comes on. Once in the recovery menu, use the volume keys to navigate to the bootloader. Proceed to the next step.

Run `brick-9820.sh`. *NOTE: This will temporarily brick your device, meaning the screen won't come on at all. Don't worry, it is still recoverable if something goes wrong.*
```
sudo ./brick-9820.sh
```

After confirming the brick by typing YES you will need to disconnect the device and run bootrom-step-minimal.
```
sudo ./bootrom-step-minimal.sh
```
Then plug the device back in, it will boot into hacked fastboot.

Run the fastboot step.
```
sudo ./fastboot-step.sh
```

If all goes smoothly, you should be presented with the TWRP bootloader screen!
## Installing a ROM
Now that the device has been unlocked, it's time to install a new operating system. You have three to choose from at this time.
- LineageOS 12.1 (Android 5.1.1) [Download here](https://github.com/ryanfortner/FireHD8-2017/releases/download/roms/lineage-12.1-20200905-UNOFFICIAL-douglas.zip)
- LineageOS 14.1 (Android 7.1.2) [Download here](https://github.com/ryanfortner/FireHD8-2017/releases/download/roms/lineage-14.1-20210826-UNOFFICIAL-douglas.zip)
- LineageOS 15.1 (Android 8.1) [Download here](https://github.com/ryanfortner/FireHD8-2017/releases/download/roms/lineage-15.1-20211031-UNOFFICIAL-douglas.zip)

Download one of the ROM zips above and place it in a newly formatted SD card. We will need this for later so keep it handy.

(optional) If you would like Google Apps, download the respective package and place it in your SD card as well.
- [android 5.1 gapps](https://opengapps.org/?arch=arm64&api=5.1&variant=pico)
- [android 7.1 gapps](https://opengapps.org/?arch=arm64&api=7.1&variant=pico)
- [android 8.1 gapps](https://opengapps.org/?arch=arm64&api=8.1&variant=pico)

(optional) If you would like to have root, download the [latest magisk apk](https://github.com/topjohnwu/Magisk/releases/latest) and change the file ending to zip. Then place the file on your sd card as well.

Through TWRP, wipe system, cache, and user data.
- Insert your SD card with the files.
- Install your ROM package from the SD card package.
- (optional) Flash openGApps package.
- (optional) Flash root (Magisk/SuperSU).
- Wipe dalvik cache.
- Reboot

Enjoy your new, genuine Android experience!

## Credits
- [XDA Developers master thread](https://forum.xda-developers.com/t/master-thread-fire-hd-8-2017-7th-generation.3743024/)
- [Unlocking guide](https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-hd-8-2017-douglas.3962846/) from user k4y0z on XDA forums
- [Lineage 12.1](https://forum.xda-developers.com/t/rom-unlocked-douglas-lineage-12-1-5-sep-2020.3967537/) rom from Rortiz2 on XDA forums
- [Lineage 14.1](https://forum.xda-developers.com/t/rom-unlocked-douglas-giza-otas-lineage-14-1-26-jul-2021.4195349/) rom from user Rortiz2 on XDA forums
- [Lineage 15.1](https://forum.xda-developers.com/t/rom-unofficial-8-1-lineageos-15-1-for-amazon-fire-hd8-7-6th-gen-douglas-giza.4328503/) rom from user Rortiz2 on ZDA forums ([GitHub](https://github.com/mt8163-dev/android_device_amazon_douglas))
