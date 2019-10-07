mnts="dev/pts dev proc sys"
for mmnt in $mnts; do 
    cmd="sudo umount -l output/rootfs/$mmnt"
    echo $cmd
    $cmd
done 
