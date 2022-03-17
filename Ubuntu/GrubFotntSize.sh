# To increase grub font size
# If command below does not work verify paths - they can vary dependong on distro and version
sudo grub-mkfont --output=/boot/grub/fonts/DejaVuSansMono36.pf2 --size=36 /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf
# Edit grub settings using nano
sudo nano /etc/default/grub
# Add additopnal line
GRUB_FONT=/boot/grub/fonts/DejaVuSansMono36.pf2
# Update grub config
sudo update-grub
# Reboot and test
