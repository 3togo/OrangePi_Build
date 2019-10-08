DEST=output/rootfs
if [ ! -d $DEST ]; then
    echo "$DEST not found"
    exit
fi
sudo umount -l $DEST/dev/pts || true
sudo umount -l $DEST/dev || true
sudo umount -l $DEST/proc || true
sudo umount -l $DEST/sys || true
