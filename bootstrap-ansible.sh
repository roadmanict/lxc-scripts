#/bin/bash
set -e
apt update
apt full-upgrade --yes

apt install sudo --yes

# Create new user
useradd -m -s /bin/bash ansible || echo "User already exists"

usermod -a -G sudo ansible

mkdir /home/ansible/.ssh || echo "Directory exists"
rm -f /home/ansible/.ssh/authorized_keys
touch /home/ansible/.ssh/authorized_keys

echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhjvmvRyaBojmOPhVS2EfmQLBllYVL8bhMRihxGOYqp lxc@debian" >> /home/ansible/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJYOk8j2fsAzz+TgYKJOvZtE+ncsj3U/XtQ4d37ql7r0 j.moes01@gmail.com" >> /home/ansible/.ssh/authorized_keys

chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys

chown -R ansible:ansible /home/ansible/.ssh

echo "ansible ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ansible

visudo -c
