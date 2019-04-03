#!/bin/bash

box_path=$HOME/box/jolo_projects/promise/data
data_file=$(ls $box_path | grep ecg.*.rda |  sort -r -t_ | head -n1)
echo $data_file

cp -v $box_path/$data_file $TRAVIS_BUILD_DIR/data/ecg.rda
