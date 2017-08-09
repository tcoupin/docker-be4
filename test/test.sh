#!/bin/bash

curl -O http://www.rok4.org/data/Tuto_1_SCAN1000.zip
unzip Tuto_1_SCAN1000.zip

docker run -it -v $PWD/Tuto_1_SCAN1000:/rok4/config --name be4 -d be4 bash 

docker exec -it -u be4 be4 bash /DATA/generate.sh
