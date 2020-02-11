###########################################################################
set term epslatex size 3.2,2.5 standalone color colortext 8 header \
"\\usepackage[multidot]{grffile}"
###########################################################################

####################
# load jpac palette
####################
load 'jpac.pal'

####################
# set output
####################
set output 'fig_jpac_2dplot.tex'

####################
# set key parameters
####################
set key at screen .85,.85
set key samplen 3 spacing 1.75 font ",5" width 12
set key vertical maxrows 5 reverse Left

####################
# set x attributes
####################
set xrange [0:20]
set xtics (0,5,10,15,20)
set xlabel "$W$ (GeV)"

####################
# set y attributes
####################
set yrange[-0.7:1.2]
set ytics (-0.5,0.0,0.5,1.0)
set format y "%1.1f"
set ylabel "$d\\sigma/dt$ ($\\mu B / $ GeV$^2$)"

####################
# JPAC label
####################
set label "\\boldmath $J^{P\\!\\mathcal{A}C}$" at screen .65,.89

####################
# plot
####################
p "data/data_bessel_0.dat" u 1:2 w l ls 1 lw 4 t "$\\alpha = 1$" ,\
  "data/data_bessel_1.dat" u 1:2 w l ls 2 lw 4 t "$\\alpha = 2$" ,\
  "data/data_bessel_2.dat" u 1:2 w l ls 3 lw 4 t "$\\alpha = 3$" ,\
  "data/data_bessel_3.dat" u 1:2 w l ls 4 lw 4 t "$\\alpha = 4$" ,\
  "data/data_bessel_4.dat" u 1:2 w l ls 5 lw 4 t "$\\alpha = 5$" ,\
  "data/data_bessel_5.dat" u 1:2 w l ls 6 lw 4 t "$\\alpha = 6$" ,\
  "data/data_bessel_6.dat" u 1:2 w l ls 7 lw 4 t "$\\alpha = 7$" ,\
  "data/data_bessel_7.dat" u 1:2 w l ls 8 lw 4 t "$\\alpha = 8$" ,\
  "data/data_bessel_8.dat" u 1:2 w l ls 9 lw 4 t "$\\alpha = 9$" ,\
  "data/data_bessel_9.dat" u 1:2 w l ls 10 lw 4 t "$\\alpha = 10$"