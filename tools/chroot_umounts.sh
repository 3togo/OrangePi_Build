DEST=$PWD/output/rootfs
echo "DEST=$DEST"
if [ ! -d $DEST ]; then
    echo "$DEST not found"
    exit
fi
<<<<<<< HEAD
for x in dev/pts dev proc sys; do
	sudo umount -l $DEST/$x
done
=======

xs="proc tmp sys dev dev/pts"
for x in $xs proc; do
        sudo umount -l $DEST/$x || true
    done


xs="null zero"
for x in $xs; do
    sudo rm -f "/dev/$x" || true
    sudo mknod -m 0666 "/dev/$x" c 1 3 || true
done

>>>>>>> 48ad9ae97a5a34b151c182b3de8ba0d8c67cb0eb
