#/bin/bash
apt update
apt full-upgrade --yes

useradd lxc -d /opt/lxc -M -r -s "$(which bash)"

apt install git

git clone https://github.com/roadmanict/lxc-scripts.git /opt/lxc-scripts