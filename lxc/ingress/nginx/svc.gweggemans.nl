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

	location / {
		proxy_pass https://10.6.11.115:8443;
		proxy_ssl_verify off;
		proxy_ssl_session_reuse on;
		proxy_buffering off;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
		## Specific to Unifi Controller
		proxy_hide_header Authorization;
		proxy_set_header Referer '';
		proxy_set_header Origin '';
	}

	location /inform {
		proxy_pass https://10.6.11.115:8080;
		proxy_ssl_verify off;
		proxy_ssl_session_reuse on;
		proxy_buffering off;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
		## Specific to Unifi Controller
		proxy_hide_header Authorization;
		proxy_set_header Referer '';
		proxy_set_header Origin '';
	}

	location /wss {
		proxy_pass https://10.6.11.115:8443;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
		## Specific to Unifi Controller
		proxy_set_header Origin '';
		proxy_buffering off;
		proxy_hide_header Authorization;
		proxy_set_header Referer '';
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
		proxy_set_header Connection "upgrade";
	}

	location /api/websocket {
		proxy_pass http://10.6.11.103:8123/api/websocket;
		proxy_set_header Host $host;

		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
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
	server_name	nas.svc.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/svc.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/svc.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/svc.gweggemans.nl/chain.pem;

	location / {
		proxy_pass http://10.100.100.111:80;
		proxy_http_version 1.1;
		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme
		proxy_set_header X-Forwarded-Host $host;
		proxy_set_header X-Forwarded-Server $host;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection $http_connection;
	}
}
