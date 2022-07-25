#!/bin/sh

sudo apt update

sudo apt install --yes iptables-persistent

echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf

CAT <<'END'
Edit /etc/iptables/rules.v4

Example with portforwarding:

    *nat
    -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 10.0.3.2:80
    -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to 10.0.3.2:443
    -A POSTROUTING -o eth0 -j MASQUERADE
    COMMIT

    *filter
    -A INPUT -i lo -j ACCEPT
    # allow ssh, so that we do not lock ourselves
    -A INPUT -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
    # allow incoming traffic to the outgoing connections,
    # et al for clients from the private network
    -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    # prohibit everything else incoming 
    -A INPUT -i eth0 -j DROP
    COMMIT

    *filter
    -A FORWARD -p tcp -d 10.0.3.2 --dport 80 -j ACCEPT
    -A FORWARD -p tcp -d 10.0.3.2 --dport 443 -j ACCEPT

    COMMIT

After run:

sudo iptables-restore < /etc/iptables/rules.v4 

END