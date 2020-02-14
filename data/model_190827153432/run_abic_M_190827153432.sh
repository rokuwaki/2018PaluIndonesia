#!/bin/bash
str=358.
dip=69.0
rake=0.
Rslip=45.
depth=12.0
XX=5.0
YY=5.0
MN=48
NN=6
M0=38
N0=4
ICMN=5
ns=2
vr=6.0
TR=0.5
JTN=29
st_max=40.
r_s_t=3.8
tl=200.
dt=$TR
dtg=0.1
dump=0.5
title=`pwd`
for vr in 6.0 #5.0 7.0
do
    id=`date +%y%m%d%H%M%S`
    echo $str $dip $rake $Rslip $depth $vr $XX $YY $MN $NN $M0 $N0 $ICMN $TR $JTN $ns $dt $dtg $tl $dump $st_max $r_s_t $title $id > $id.log.txt
    echo $str $dip $rake $Rslip $depth $vr $XX $YY $MN $NN $M0 $N0 $ICMN $TR $JTN $ns $dt $dtg $tl $dump $st_max $r_s_t $title $id
    FFI_abic_N2.csh $str $dip $rake $Rslip $depth $vr $XX $YY $MN $NN $M0 $N0 $ICMN $TR $JTN $ns $dt $dtg $tl $dump $st_max $r_s_t $title
    cp slip.ps slip_$id.ps
    cp map_slip.ps map_slip_$id.ps
    cp cwave_f.pdf cwave_f_$id.pdf
    cp st.dat st_$id.dat
    cp fort.40 fort.40_$id
    cp run_abic_M.sh run_abic_M_$id.sh
    cp plot_cwave_f.csh plot_cwave_f_$id.csh
    cp plot_map_slip.sh plot_map_slip_$id.sh
    cp Plot.csh Plot_$id.csh
    cp abic_min abic_min_$id.txt
    cp station.list station_$id.list
    cp fault.dat fault_$id.dat
    cp rigid.dat rigid_$id.dat
    cp epicenter epicenter_$id.dat
    nodeloc
    cp knot_value.dat knot_value_$id.dat
    cp knot_value.dat_rim knot_value_$id.dat_rim
done
