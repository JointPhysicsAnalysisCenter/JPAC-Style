#!/bin/bash

for i in `seq 0 10`
do
    ./bessel $i > data_bessel_$i.dat
done