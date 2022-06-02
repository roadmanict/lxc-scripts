#/bin/sh
sudo ln -s ${PWD}/dashy.service /etc/systemd/system/dashy.service
sudo systemctl daemon-reload
sudo systemctl enable dashy
sudo systemctl start dashy