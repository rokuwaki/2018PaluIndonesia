#!/bin/bash
G=map_slip.ps
R=116.020/0.124E+03/-.407E+01/0.356E+01
S=16c
gmtset FONT_ANNOT_PRIMARY  14
gmtset FONT_LABEL 14
gmtset PS_MEDIA A4
gmtset MAP_FRAME_TYPE plain
gmtset MAP_FRAME_PEN thinner
FFI_SD_v2 << EOF 
    -0.256    119.846     12.000
EOF
nearneighbor -R$R md.dat -S0.05 -I0.01  -: -Gmap_slip.grd 
#---
pscoast -JM$S -R$R -Df -W2 -K  -X2.5c -Y4.5c -P > $G 
grdimage -JM$S -R$R map_slip.grd -Ccolor.cpt -K -O  >> $G 
grdcontour -JM$S -R$R map_slip.grd -C0.850E+00 -L0.850E+00/200 -W1 -K -O >> $G
pscoast    -JM$S -R$R -Df -W -Ba1f0.5SWen -K -O >> $G 
#psxy  -JM$S -R$R mline.dat  -W1 -: -O -K >> $G 
psxy   -JM$S -R$R ~/data/trench.gmt -W,50  -O -K >> $G 
#psxy  -JM$S -R$R mv.dat -: -G50 -Sv0.04c/0.1c/0.1c  -O -K >> $G 
psxy   -JM$S -R$R  -: -G255/255/0 -Sa0.5c  -W1  -O -K <<EOF>> $G 
    -0.256    119.846
EOF
psscale -Ccolor.cpt -D14c/4c/5c/0.25c  -B+l'slip (m)' -O >> $G 
psconvert -Z -Tf -A $G
