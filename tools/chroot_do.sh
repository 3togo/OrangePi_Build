#! /bin/bash

ARGS=($@)
DEST=$1
CMD=${ARGS[@]:1}
if [ ! -d $DEST ]; then
    echo "$DEST not found"
    exit
fi

sudo mount -t proc /proc $DEST/proc || true
sudo mount -o bind /sys $DEST/sys || true
sudo mount -o bind /dev $DEST/dev || true
sudo mount -o bind /dev/pts $DEST/dev/pts || true
sudo chroot $DEST $CMD
sudo umount -l $DEST/dev/pts || true
sudo umount -l $DEST/dev || true
sudo umount -l $DEST/proc || true
sudo umount -l $DEST/sys || true



