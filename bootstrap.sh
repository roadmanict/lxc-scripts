#/bin/bash
set -e
apt update
apt full-upgrade --yes

apt install git sudo unattended-upgrades apt-listchanges --yes

# Configure unattended updates
echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades

# Create new user
useradd -m -s /bin/bash lxc || echo "User already exists"

usermod -a -G sudo lxc

wget -q -O - https://raw.githubusercontent.com/roadmanict/lxc-scripts/main/ssh_authorized_keys.sh | bash

# Clone this repository as new user
su - lxc <<SHT
    git clone https://github.com/roadmanict/pve ./pve || echo "Repository exists"
SHT

echo ""
echo "-------------------"
echo "Run passwd lxc"
echo "-------------------"
