FROM nginx:latest

RUN apt update
RUN apt install curl jq -y

COPY nginx.sh /opt
COPY docker.csr.json /opt
COPY cfssljson /usr/bin/

RUN chmod +x /opt/nginx.sh && chmod +x /usr/bin/cfssljson

COPY ./default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["/opt/nginx.sh"]
