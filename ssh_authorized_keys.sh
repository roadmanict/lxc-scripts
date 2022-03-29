mkdir /home/lxc/.ssh || echo "Directory exists"
rm -f /home/lxc/.ssh/authorized_keys
touch /home/lxc/.ssh/authorized_keys

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUiy7L19SOYzjvapxIPjORif1Fa3/tjpVqGRVf5D4k4HpVgVaQS/Rdm8XJaC4cmxR7ulvxOR47Ozlt+PmMiZ9vd0ZJFXRr3xGpVP9mzK9hbDDXRqFIzgg2b5CsbbHA3TPOx3v3diZL6THRWMkV+BzIIQKh9/UFsGI92iUzFckWGaA5O7Ez61UAiwAdLF4J99nMRKuAcOljx3onXsGNJtw68fElfODBLaAu4zeAVpvH6pUvP7oT8NET95vC18m5ipetaGiRcWQYrnJO5ki6ZLNtldGPsZ9z4gXJBhNyCdkyzF+MLyMsRbSMQS21PHxcVM24yb38wcT4P6FrTymnpcqX geert@oc3413724060.ibm.com" >> /home/lxc/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC89LjWBnEiUQB4pb5mHTwfWiAEJWwdThl8n/h/BvB4yjoJb+rGkMxX2eUZfx++P4FS+wFTXjC02akzkqItDwSCirbPImjElaVIw/VYmRb5gCB8z9AZh9QqCF2IhfKR/cM1Q8qtLEBWgAvhmr/HsRkc9r8DL+p92ONky6c2nf5zIfU1vKy7NO7O2WS21T9Zf67fR0qllyU+XVHvl3tMro2L9j12/w3N2NCxyJ/UUCdu4t2b++nsDCkiCouRzrVINCdKdV88zZ3Fhg+lxSKLN6tMd2rK3fSBv3ACsodUIQ2ZSM9yR4iIz6UFRkJ7mUIppPLWUW272bt4PpLp4y1rsZ6x" >> /home/lxc/.ssh/authorized_keys

chmod 700 /home/lxc/.ssh
chmod 600 /home/lxc/.ssh/authorized_keys

chown -R lxc:lxc /home/lxc/.ssh
