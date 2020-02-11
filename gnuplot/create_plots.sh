#!/bin/bash

##################
# figs directory
##################
mkdir -p figs

##################
# run gnuplot
##################
gnuplot jpac_2dplot.plt
gnuplot jpac_3dplot.plt

##################
# loop over output
##################
for name in fig_jpac_2dplot fig_jpac_3dplot
do
    ########################
    # convert output to pdf
    ########################
    latex $name.tex
    dvips -o $name.eps $name.dvi
    ps2pdf $name.eps $name.pdf
    rm $name.eps

    ########################
    # remove unneeded files
    ########################
    rm $name.tex
    rm $name.dvi
    rm $name-inc.eps
    rm $name.aux
    rm $name.log
    rm texput.log

    ########################
    # move output to figs
    ########################
    mv $name.pdf figs/
done

