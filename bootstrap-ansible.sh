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

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtoFCjgifvG4D2aT7XE4efIay4iVuMkINrYmVxNxlHeqZAuYaXjccyA3rPiYzI2woNxGDrmXG4ind9FHI0QxOntCm+9PGe3fFCR323pRggwsDtVfM8zG9vKi6WlyddWE8AaqWZFEdFJrIhe5a4XyUn+JQ+u8eW/FYC90cmH0pDr/MHI71QRLwar38akztezrzIK+lTOHHPQpWXfBWRdcazmYacak8i3kbHDzwfifN81mJpLOTeWUHul8PKe43JsevNgizqQzG7SeSaWvAKI9C9N8gKzxFZ41BHCPZZ0fWp/FXJKARKqERB3Wa35G7dkViGQrzWYzeW1RPMb/ydll5ASxrWNQ+Vf1R0R6o63DTfRjn1ts5uJtkm40HEFZLRC/EUch7UQgo9bhJq7+y2+THCP+PcDn6sIpM6bt29hhkoTJ8sei0OBqiM7NWFqRLUuEZeQZYrvQR0MPM5TLLTImZVrWsmRkd2FwFjREJXsoqg60vwxKnBrHFUkB/EjDefScU= geertweggemans@Geerts-MacBook-Pro-2.local" >> /home/ansible/.ssh/authorized_keys

chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys

chown -R ansible:ansible /home/lxc/.ssh
