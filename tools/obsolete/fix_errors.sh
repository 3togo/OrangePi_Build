pkgs="libssl-dev qemu-utils qemu-efi-aarch64 qemu-system-arm"
for mpkg in $pkgs; do
	if ! dpkg -s $mpkg >/dev/null 2>&1; then
		echo $mpkg
		sudo apt-get install $mpkg
	fi
done
mconf="/usr/lib/binfmt.d/qemu-aarch64-static.conf"
if [ ! -f "$mconf" ]; then
	mstr=":qemu-aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-aarch64-static:F"
	echo $mstr|sudo tee -a "$mconf"
	sudo service systemd-binfmt restart
fi

ROOTFS="output/rootfs"
if [ -d "$ROOTFS" ]; then
	mnts="proc sys"
	for mmnt in $mnts; do
		mdir=$ROOTFS/$mmnt
		sudo fusermount -uz $mdir >/dev/null 2>&1 
		sudo rm -Rf $ROOTFS >/dev/null 2>&1
	done
fi
