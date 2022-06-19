server {
	listen 80;
	listen [::]:80;

	server_name *.acc.rlp.gweggemans.nl;

	return 301 https://$host$request_uri;
}


server {
	listen 443 ssl;
	server_name *.acc.rlp.gweggemans.nl;

	ssl_certificate /etc/letsencrypt/live/acc.rlp.gweggemans.nl/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/acc.rlp.gweggemans.nl/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/acc.rlp.gweggemans.nl/chain.pem;

	location / {
		proxy_pass http://10.0.3.1:80;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "Upgrade";
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header Host $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
	}
}