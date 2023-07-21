from nginx:alpine

arg TESTING
arg EMAIL
arg DOMAINS

run apk add --no-cache certbot-nginx

run if [ ! $TESTING ]; then \
	nginx && \
	certbot \
	--non-interactive \
	--agree-tos \
	-m $EMAIL \
	--domains $DOMAINS \
	--nginx; \
fi
