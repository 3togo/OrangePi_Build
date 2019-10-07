sudo -H tools/rk3399/create_sdk.sh
sudo -H tools/rk3399/apply_patches.sh
sudo chown $USER:$USER -Rf OrangePiRK3399
cd OrangePiRK3399
ln -sf scripts/build.sh .
