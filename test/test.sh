#!/bin/bash

TEST_DIR=$(dirname $PWD/$0)

if [ ! -f $TEST_DIR/Tuto_1_SCAN1000.zip ]
then
	curl -o $TEST_DIR/Tuto_1_SCAN1000.zip http://www.rok4.org/data/Tuto_1_SCAN1000.zip
fi
if [ ! -d $TEST_DIR/Tuto_1_SCAN1000 ]
then
	unzip $TEST_DIR/Tuto_1_SCAN1000.zip -d $TEST_DIR
fi

rm -rf $TEST_DIR/Tuto_1_SCAN1000/pyramids/ || true
docker run --rm -it -v $TEST_DIR/Tuto_1_SCAN1000:/rok4/config -v $TEST_DIR:/DATA --name be4 -d be4 bash 

docker exec -it -u be4 be4 bash /DATA/generate.sh

docker kill be4