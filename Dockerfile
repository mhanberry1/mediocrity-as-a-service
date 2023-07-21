from nginx:alpine

arg CREATE_CERT
arg EMAIL
arg DOMAINS

run apk add --no-cache certbot-nginx

entrypoint if [ $CREATE_CERT ]; then \
	nginx && \
	certbot \
	--non-interactive \
	--agree-tos \
	-m $EMAIL \
	--domains $DOMAINS \
	--nginx; \
else \
	nginx -g 'daemon off;'; \
fi
