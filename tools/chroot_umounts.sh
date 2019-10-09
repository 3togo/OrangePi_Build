DEST=$PWD/output/rootfs
echo "DEST=$DEST"
if [ ! -d $DEST ]; then
    echo "$DEST not found"
    exit
fi

xs="proc sys dev dev/pts"		#remove tmp 
for x in $xs proc; do
        sudo umount -l $DEST/$x || true
    done


xs="null zero"
for x in $xs; do
    sudo rm -f "/dev/$x" || true
    sudo mknod -m 0666 "/dev/$x" c 1 3 || true
done

