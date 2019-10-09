DEST=output/rootfs
if [ ! -d $DEST ]; then
    echo "$DEST not found"
    exit
fi
for x in dev/pts dev proc sys; do
	sudo umount -l $DEST/$x
done
