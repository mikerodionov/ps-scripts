# Ubuntu Basic Things

## Check disk space

```Bash
df -h --total
```

## List only directories for the current directory:

```Bash
ls -d */
```

## To resolve sound issues (e.g. Bluetooth headset connected but sound keep going through the speakers etc.)

```Bash
# Try using pavucontrol (a graphical frontend for pulseaudio)
sudo apt-get install pavucontrol
pavucontrol
# Try this
mv ~/.config/pulse/ ~/.config/pulse.old
pulseaudio --k && pulseaudio --start
```
