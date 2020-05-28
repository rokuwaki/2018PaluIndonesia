#!/bin/bash
gmtset MAP_FRAME_TYPE plain
gmtset PS_PAGE_ORIENTATION portrait
gmtset MAP_FRAME_PEN 0
PS=plotTopoBathyGMT.ps
S=6

#R=112.9479/162.9479/10.199199999999998/55.1992
R=116.5/125.8/-6.1/3.5

CPT=topobathy.cpt

# all grey
makecpt -T-11000/0/500 -Cgray -Z | awk 'NR <= 22 {print $0}' > $CPT
makecpt -T0/4000/500 -Cgray -Z -I | awk '{print $0}' > tmp1
cat tmp1 >> $CPT

# http://soliton.vm.bytemark.co.uk/pub/cpt-city/tp/index.html
makecpt -T-11000/0/500 -Ctpsfhm.cpt -Z | awk 'NR <= 22 {print $0}' > $CPT
#makecpt -T0/7000/500 -Ctpglhwm.cpt -Z > tmp1
makecpt -T0/4000/500 -Cgray -Z -I | awk '{print $0}' > tmp1
cat tmp1 >> $CPT

# https://download.gebco.net
topodata=GEBCO_2020_22_May_2020_5a5fe6705dae/gebco_2020_n4.0_s-7.0_w116.0_e126.0.nc
grdcut $topodata -R$R -Gtopo.grd
grdsample topo.grd -Gtopo_downsampled.grd -R$R -I0.2m
grdgradient topo_downsampled.grd -Ggradient.grd -A45 -Nt
grdimage topo_downsampled.grd -JM$S -R$R -Igradient.grd -C$CPT -Q > $PS

#pscoast -JM$S -R$R -W0  -Df -O >> $PS
#pscoast -JM$S -R$R -W -Ba10SWen -Df -K > $PS
#psscale -C$CPT -D6.5/3/$S/0.2 -B2000 -O >> $PS
psconvert -Z -A -Tg -E600 $PS
