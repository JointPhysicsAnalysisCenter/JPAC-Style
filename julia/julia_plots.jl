using Plots
using LaTeXStrings
using DelimitedFiles

path_to_data = joinpath("gnuplot","data")
path_to_save_plots = joinpath("julia","plots")

# get data
bessel_pols = [readdlm(joinpath(path_to_data,"data_bessel_$i.dat")) for i in 0:9]

# color palette
jpac_palette_rdb = (
    jpac_blue = (0.12,0.47,0.71),
    jpac_orange = (1,0.5,0.05),
    jpac_green = (0.17,0.63,0.17),
    jpac_red = (0.84,0.15,0.15),
    jpac_purple = (0.58,0.40,0.71),
    jpac_brown = (0.54,0.34,0.29),
    jpac_pink = (0.89,0.47,0.76),
    jpac_grey = (0.5,0.5,0.5),
    jpac_gold = (0.74,0.74,0.13),
    jpac_aqua = (0.09,0.75,0.81),
    jpac_white = (1,1,1))
#
using Plots.Colors
jpac_palette = [RGBA{Float64}(c...) for c in jpac_palette_rdb]

# plots
function make_jacobi_plot()
    plot(xlab=L"W\,\,(\mathrm{GeV})",
         ylab=L"\mathrm{d}\sigma/\mathrm{d}t\,\,(\mu B/\mathrm{GeV}^2)",
         grid=false, frame=:box,
         color_palette = jpac_palette)
    for (i,dt) in enumerate(bessel_pols)
        plot!(dt[:,1], dt[:,2], lab=LaTeXString("\$\\alpha=$(i)\$"))
        annotate!([(12,0.9,text(L"J^{P\!\mathcal{A}C}", 20))])
    end
    plot!(xlim=(0,20), size=(500,350), leg=:topright)
end

function make_gaus_plot()
    f(x,y) = exp(-x^2-y^2)
    xv = range(-1,1,length=100)
    yv = range(-1,1,length=100)
    calv = f.(transpose(xv), yv)
    #
    plot(xlab=L"x",
         ylab=L"y",
         grid=false, frame=:box,
         color_palette = jpac_palette)
    heatmap!(xv,yv, calv, c=cgrad(jpac_palette[[1,11,4]]))
    annotate!([(0.95,0.9,text(L"J^{P\!\mathcal{A}C}", 12,:right))])
    #
    plot!(size=(400,350), xlim=(-1,1), ylim=(-1,1))
end

#    _|_|_|  _|  _|_|
#  _|    _|  _|_|
#  _|    _|  _|
#    _|_|_|  _|
#        _|
#    _|_|

gr() # gr backend
#
make_jacobi_plot()
savefig(joinpath(path_to_save_plots,"jacobi_gr.pdf"))
#
make_gaus_plot()
savefig(joinpath(path_to_save_plots,"gaus_gr.pdf"))

#                                _|              _|
#  _|_|_|    _|    _|  _|_|_|    _|    _|_|    _|_|_|_|
#  _|    _|  _|    _|  _|    _|  _|  _|    _|    _|
#  _|    _|  _|    _|  _|    _|  _|  _|    _|    _|
#  _|_|_|      _|_|_|  _|_|_|    _|    _|_|        _|_|
#  _|              _|  _|
#  _|          _|_|    _|

# setup
using PyCall
import PyPlot: matplotlib
PyCall.PyDict(matplotlib["rcParams"])["font.family"] = "serif"
PyCall.PyDict(matplotlib["rcParams"])["font.serif"] = "Helvetica" #"STIX"
PyCall.PyDict(matplotlib["rcParams"])["mathtext.fontset"] = "dejavusans"#"Helvetica"
PyCall.PyDict(matplotlib["rcParams"])["text.usetex"] = true
PyCall.PyDict(matplotlib["rcParams"])["text.latex.unicode"] = true

# plot
pyplot()
make_jacobi_plot()
savefig(joinpath(path_to_save_plots,"jacobi_pyplot.pdf"))
#
make_gaus_plot()
savefig(joinpath(path_to_save_plots,"gaus_pyplot.pdf"))

#                          _|_|
#  _|_|_|      _|_|_|    _|
#  _|    _|  _|    _|  _|_|_|_|
#  _|    _|  _|    _|    _|
#  _|_|_|      _|_|_|    _|
#  _|              _|
#  _|          _|_|

pgfplots()
make_jacobi_plot()
savefig(joinpath(path_to_save_plots,"jacobi_pgf.pdf"))
#
make_gaus_plot()
savefig(joinpath(path_to_save_plots,"gaus_pgf.pdf"))
