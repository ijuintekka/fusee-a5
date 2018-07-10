# fusee-a5
Instructions/files for building a custom LEDE image to turn cheap routers into a Nintendo Switch "modchip"/"dongle"

These instructions target the "A5-V11" devices, although you should be able to make this work on any router with USB host support.

These instructions do not cover the actual installation to the device, see https://openwrt.org/toh/unbranded/a5-v11

Forked from fusee-lede https://github.com/DavidBuchanan314/

# Usage

Once installed, just plug in your switch in RCM mode, and the payload will get launched automagically!

To set a custom payload, replace `/usr/share/fusee-nano/payload.bin`. (`fusee.bin` is bundled as a default payload, from https://github.com/ktemkin/Atmosphere/tree/poc_nvidia/fusee)

This release supports, by default, the mounting of USB storage with FAT16, FAT32, exFAT and EXT4 partitions.

Upon insertion of a USB storage device, the root of each partition will be probed for a new payload.bin, and if found will replace the current payload with the discovered file.

This release has, by default, ethernet activated and set to be configured by DHCP, as well as Wi-Fi enabled by default with the SSID "3GWIFI_XXXX" and the WPA2 passkey "12345678". The default IP address for the dongle, over Wi-fi, is 10.1.5.1.

These details can be changed at any time by editing /etc/config/network and /etc/config/wireless respectively.

# Compiling From Source

1. Clone or download the latest release of this repo.

```sh
git clone https://github.com/ijuintekka/fusee-a5/
```

2. Compile!

```
./imagemake.sh
```
If all goes well, you should find files ready to flash here:

```
firmware.bin (A copy of *sysupgrade.bin)
lede/bin/targets/ramips/rt305x/lede-ramips-rt305x-a5-v11-squashfs-factory.bin
lede/bin/targets/ramips/rt305x/lede-ramips-rt305x-a5-v11-squashfs-sysupgrade.bin
```
