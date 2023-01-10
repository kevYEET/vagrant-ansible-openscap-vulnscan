#!/bin/bash

#Run apt update and apt upgrade commands
sudo apt update && sudo apt upgrade -y >> /var/log/apt_update.log