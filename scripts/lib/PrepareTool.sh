#!/bin/sh

set -e

if ! hash apt-get 2>/dev/null; then
    whiptail --title "Orangepi Build System" --msgbox "This scripts requires a Debian based distrbution. If you not use Debian/Ubunut, pls install:[ bsdtar mtools u-boot-tools pv bc sunxi-tools gcc automake make curl qemu dosfstools ]"
    exit 1
fi

pkgs="bsdtar mtools u-boot-tools pv bc \
    gcc automake make curl\
    lib32z1 lib32z1-dev qemu-user-static \
    dosfstools figlet device-tree-compiler debootstrap"

for mpkg in $pkgs; do 
	if ! dpkg -s $mpkg >/dev/null 2>&1; then
		echo "$mpkg is installed."
		sudo apt-get -y --no-install-recommends --fix-missing install $mpkg
	else
		echo "$mpkg has already installed."
	fi
done
