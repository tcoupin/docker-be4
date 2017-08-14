#!/bin/bash
cd /rok4/config

be4.pl --conf=proprietes.txt --env=environnement.txt

bash scripts_be4/SCRIPT_1.sh &
bash scripts_be4/SCRIPT_2.sh &
bash scripts_be4/SCRIPT_3.sh &

wait

bash scripts_be4/SCRIPT_FINISHER.sh

create-layer.pl --pyr=pyramids/descriptors/SCAN1000_PYR-JPG_FXX_PM.pyr --tmsdir=./ --layerdir=pyramids/descriptors/
