###########################################################################
set term epslatex size 2.8,2.8 standalone color colortext 8 header \
"\\usepackage[multidot]{grffile}"
###########################################################################

####################
# load jpac palette
####################
load 'jpac.pal'

####################
# set output name
####################
set output 'fig_jpac_3dplot.tex'

####################
# set key parameters
####################
set key at screen .85,.85
set key samplen 3 spacing 1.75 font ",5" width 12
set key vertical maxrows 5 reverse Left

####################
# define 3d function
####################
f(x,y) = exp( -(x*x + y*y) )

####################
# set x attributes
####################
set xrange [-1.0:1.0]
set xtics (-1.0,-0.5,0.0,0.5,1.0)
set format x "%1.1f"
set xlabel "$x$"

####################
# set y attributes
####################
set yrange[-1.0:1.0]
set ytics (-1.0,-0.5,0.0,0.5,1.0)
set format y "%1.1f"
set ylabel "$y$"

####################
# JPAC label
####################
set label "\\boldmath $J^{P\\!\\mathcal{A}C}$" at screen .72,.82 front

####################
# plot attributes
####################
set pm3d map
set isosamples 75,75
set palette defined (0 "#1F77B4", 0.5 "white", 1 "#D61D28")

####################
# plot
####################
splot f(x,y) notitle
