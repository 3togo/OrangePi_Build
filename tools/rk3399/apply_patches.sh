cd OrangePiRK3399
echo "PWD=$PWD"
for mpatch in ../patches/*; do 
#sudo -H git apply --ignore-whitespace ../patches/*.patch
    echo $mpatch
    sudo patch -p1 < "$mpatch"
done

