sudo chroot output/rootfs mount -t proc proc /proc || true
sudo chroot output/rootfs mount -t sysfs sys /sys || true
