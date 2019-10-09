DEST=$PWD/output/rootfs
if [ ! -d $DEST ]; then
    echo "$DEST not found"
    exit
fi
#chroot "$DEST" mount -t proc /proc proc || true
#chroot "$DEST" mount -t sysfs sys /sys || true
xs="proc sys dev dev/pts"		#remove tmp 
for x in $xs proc; do
        sudo umount -l $DEST/$x || true
    done

#sudo mount -t proc /proc $DEST/proc || true
#sudo mount -o bind /sys $DEST/sys || true
#sudo mount -o bind /dev $DEST/dev || true
#sudo mount -o bind /dev/pts $DEST/dev/pts || true
sudo chroot $DEST
