#!/bin/bash

mkdir -p /etc/nginx/ssl

if [ ! -f /etc/nginx/ssl/docker.ee.pem ];
then
  curl -s -d @/opt/docker.csr.json cfssl:8888/api/v1/cfssl/newcert | cfssljson docker.ee
  curl -s -d '{ "label": "default" }' cfssl:8888/api/v1/cfssl/info | jq -r .result.certificate > root.pem
  cat root.pem >> docker.ee.pem
  mv docker.ee* /etc/nginx/ssl
fi

nginx -g 'daemon off;'
