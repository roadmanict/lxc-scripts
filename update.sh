#/bin/bash
set -e
apt update
apt full-upgrade --yes

# Clone this repository as new user
su - lxc <<SHT
    (cd pve && git pull --rebase) || echo ""
SHT
