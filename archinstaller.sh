mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
pacman -Syy
pacman -S --noconfirm reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
mount /dev/sdb2 /mnt
pacstrap /mnt base linux linux-firmware vim nano
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
