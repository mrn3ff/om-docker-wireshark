#!/bin/bash
set -e -x 
sudo docker build -t om-wireshark:latest .
sudo docker run -it --rm --name om-wireshark --network host --cap-add NET_ADMIN om-wireshark
