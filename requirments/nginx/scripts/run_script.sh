#!/bin/bash
service ssh start && service tor start && cp /var/lib/tor/my_website/hostname . && chmod +r hostname && nginx -g "daemon off;"
