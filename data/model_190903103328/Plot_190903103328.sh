#!/bin/bash
GRAP=slip.ps
gmtset PROJ_LENGTH_UNIT cm
gmtset FONT_LABEL 14p
gmtset FONT_ANNOT_PRIMARY 12p
gmtset PS_MEDIA A4
CPT=color.cpt
RENG=-0.190E+03/0.550E+02/-0.200E+02/0.120E+02
RENG2=-0.4E+03/0.1E+03/-0.4E+02/0.2E+02
SIZE=.531E-01
RENGs=0/.500E+02/0/0.159E+02
SIZEs=6c/4.5c
#----
#_______MECA Plot__________________
psbasemap -R$RENG -Jx$SIZE -X3c -Y3c -Ba50:'Strike (km)':/a10:'Dip (km)':NWse -K -P > $GRAP
psxy -Jx -R -G255/255/0  -Sa1.  -W1 -O -K <<+>> $GRAP
0.0  0.0
+
psmeca -R$RENG -Jx -Sm0.8c -G0/155/55 -O -K MecaDis.dat -T0 -M -Z$CPT >> $GRAP
psscale -C$CPT -D15c/4c/6c/0.3c -B+l'slip (m)' -O -K >> $GRAP
psmeca -R-10/10/-10/10 -JX5c -Sm3.5c -T0 -M -G195/51/44 -K -O -Y13c <<+>>$GRAP
0.00 0.00 1.00  -0.047005  0.401607 -0.354603 -0.253463 -0.191565 -1.000360 26
+
psbasemap -R$RENGs -JX$SIZEs -Ba0.100E+02f5:'Time (s)':/a0.500E+01f0.250E+01:'(10@+18@+ Nm/s)':SW -X8c -Y0.5c -O -K >>$GRAP
awk '{print $1, $2}' st.dat | psxy -R -JX -W0 -N -O -K -G195/51/44 >>$GRAP
pstext -JX15c/3.7c -R0/20/0/6.2 -O -X-8c -Y5c -F+f16,Helvetica+jLM <<EOF>> $GRAP
0.5 5.2   /home/rokuwaki/2018Indonesia/SyntheticTest_RealObsReproduce                   
3.0 4 (Strike,Dip,Slip) = (358.0, 69.0,    0.0)
3.0 3 Moment = 0.3620E+21(Nm); Mw = 7.6
3.0 2 Variance =      0.02584
3.0 1 Depth =  12.00(km) ; Vrmax =   6.00(km/sec)
EOF
psconvert -Tf -Z -A $GRAP 
