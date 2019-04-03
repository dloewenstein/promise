#!/bin/sh

cp -v ./data/promiseData.rda $HOME/box/jolo_projects/promise/data/$(grep -i DataVersion DESCRIPTION | cut -d: -f2 | tr -d '[:space:]' | sed 's/\(.*\)/promiseData_v\1\.rda/')
