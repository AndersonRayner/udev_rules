#!/bin/bash

# Sript for installing udev rules
echo ""
echo "Installing udev rules"
echo ""

# Copy rules to udev folder
sudo cp *.rules /etc/udev/rules.d/

# Reload rules
sudo udevadm control --reload-rules
sudo udevadm trigger

# Print devices
sleep 3
ls /dev/
