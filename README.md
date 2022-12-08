# udev_rules
A whole set of useful udev rules for different devices I use

# Creating udev Rules
## Identifying the Device
In order to create the udev rules, we need to know how Linux can identify it.  To work out the properties of the USB device use
```
udevadm info -a -p /sys/class/tty/(PORT)
```
In our case, this will (PORT) will most likely be something like ttyACM0

Non-serial devices (such as cameras) use the video4linux driver
```
udevadm info -a -p /sys/class/video4linux/(VIDEO)
```
where (VIDEO) will most likely be something like video0

### Notes
* Have to use subsystem tty if you want to talk to it as a tty
* Can use product or vendor or something to identify the device
* Can check the existing permissions with << stat --format '%a' /dev/(PORT) >>

## Reload the udev rules
We can either get the new rules to apply by unplugging and replugging our device in, or simply by reloading the rules
```
sudo udevadm control --reload-rules
sudo udevadm trigger
```

You can then check it worked by
```
ls /dev/tty*
```

# Linking git udev rules to System udev Rules
Done through a symbolic link.  Run the following command from the git udev rules directory.
WARNING: Make sure nothing is in the udev rules folder before doing this...
```
sudo rm -r /etc/udev/rules.d/
sudo ln -s ~/Documents/udev_rules/ /etc/udev/rules.d
```


