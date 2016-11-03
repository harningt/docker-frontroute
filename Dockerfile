FROM ubuntu
MAINTAINER Thomas Harning Jr. <harningt@gmail.com>
# Original Author: Christian Lück <christian@lueck.tv>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	nginx luajit && apt-get clean

RUN rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ADD apply-from-env.lua apply-from-env.lua
CMD luajit apply-from-env.lua && /usr/sbin/nginx -g "daemon off;"

EXPOSE 80

