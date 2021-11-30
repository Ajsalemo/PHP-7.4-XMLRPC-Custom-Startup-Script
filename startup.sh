#!/bin/bash

echo "Installing PHP extension XMLRPC.."

apt-get update -yy && \
    apt-get upgrade -yy && \
    apt-get install -y libxml2-dev && \
    docker-php-ext-install -j$(nproc) xmlrpc
