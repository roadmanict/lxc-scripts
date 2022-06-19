#!/bin/sh
sudo apt update

sudo apt install --yes nginx certbot python3-pip

pip install certbot-dns-transip

echo "Create /etc/letsencrypt/transip.ini file with:"
echo "dns_transip_username=Geertuh"
echo "dns_transip_key_file=/etc/letsencrypt/transip-rsa.key"

echo ""
echo "Create /etc/letsencrypt/transip.key file with private key from site"

echo ""
echo "Convert key: "
echo "$ openssl rsa -in /etc/letsencrypt/transip.key -out /etc/letsencrypt/transip-rsa.key"
echo "$ chmod 600 /etc/letsencrypt/transip-rsa.key "

echo ""
echo "Example command for generating certificates"
echo "$ certbot certonly -n -d *.svc.gweggemans.nl -a dns-transip --dns-transip-credentials /etc/letsencrypt/transip.ini --dns-transip-propagation-seconds 240"
