server {
	listen 80;
	listen [::]:80;

	server_name *.svc.gweggemans.nl;

	return 301 https://$host$request_uri;
}

server {
	listen 443 ssl;
	server_name	pfsense.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;

	proxy_redirect off;

	location / {
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";

		proxy_pass	https://10.6.11.254:443;
		proxy_buffering off;
		client_max_body_size 0;
		proxy_connect_timeout 3600s;
		proxy_read_timeout 3600s;
		proxy_send_timeout 3600s;
		send_timeout 3600s;
	}
}

server {
	listen 443 ssl;
	server_name	unify.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;

	proxy_redirect off;

	location /wss/ {
		proxy_pass https://10.6.11.115:8443;
		proxy_http_version 1.1;
		proxy_buffering off;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "Upgrade";
		proxy_read_timeout 86400;
	}

	location / {
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";

		proxy_pass_header Authorization;
		proxy_pass https://10.6.11.115:8443;
		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-Host $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
	}
}

server {
	listen 443 ssl;
	server_name	dashy.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;
	
	location / {
		proxy_pass http://10.6.11.102:4000;
	}
}


server {
	listen 443 ssl;
	server_name	home-assistant.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;
	
	location / {
		proxy_pass http://10.6.11.103:8123;
		proxy_set_header Host $host;
        proxy_redirect http:// https://;
        proxy_http_version 1.1;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
	}
}

server {
	listen 443 ssl;
	server_name	slaapkamer.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;
	
	location / {
		proxy_pass http://192.168.2.15:80;
	}
}

server {
	listen 443 ssl;
	server_name	jellyfin.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;

	location / {
		proxy_pass http://10.6.11.103:8096;
	}
}

server {
	listen 443 ssl;
	server_name	pve.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;

	proxy_redirect off;

	location / {
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";

		proxy_pass	https://10.6.11.99:8006;
		proxy_buffering off;
		client_max_body_size 0;
		proxy_connect_timeout 3600s;
		proxy_read_timeout 3600s;
		proxy_send_timeout 3600s;
		send_timeout 3600s;
	}
}

server {
	listen 443 ssl;
	server_name	pihole.svc.gweggemans.nl;

        ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;

	location / {
		proxy_pass http://10.6.11.201:80;
	}
}

server {
	listen 443 ssl;
	server_name	adguardhome.svc.gweggemans.nl;

        ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;

	location / {
                proxy_pass http://10.6.11.205:80;
        }
}

server {
	listen 443 ssl;
	server_name *.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;

	location / {
		proxy_pass http://10.6.11.202:80;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "Upgrade";
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header Host $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	}
}