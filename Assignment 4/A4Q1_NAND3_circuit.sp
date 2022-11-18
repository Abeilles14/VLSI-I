* SPICE NETLIST
***************************************

.SUBCKT pmos_pcell_CDNS_668711705481 1 2 4 8
** N=8 EP=4 IP=0 FDC=1
M0 2 4 1 8 pfet L=2e-08 W=1.28e-07 nfin=4 adej=1.216e-15 asej=1.216e-15 pdej=3.36e-07 psej=3.36e-07 $X=-10 $Y=-64 $D=1
.ENDS
***************************************
.SUBCKT nmos_pcell_CDNS_668711705480 1 2 4 6
** N=6 EP=4 IP=0 FDC=1
M0 2 4 1 6 nfet L=2e-08 W=2.88e-07 nfin=8 adej=2.432e-15 asej=2.432e-15 pdej=6.72e-07 psej=6.72e-07 $X=-10 $Y=-144 $D=0
.ENDS
***************************************
.SUBCKT A4Q1_NAND3_circuit GND A B VDD C Y
** N=19 EP=6 IP=42 FDC=6
X0 VDD Y A 19 pmos_pcell_CDNS_668711705481 $T=1225 -1153 0 0 $X=1145 $Y=-1293
X1 Y VDD B 19 pmos_pcell_CDNS_668711705481 $T=1353 -1153 0 0 $X=1273 $Y=-1293
X2 VDD Y C 19 pmos_pcell_CDNS_668711705481 $T=1481 -1153 0 0 $X=1401 $Y=-1293
X3 GND 7 A 17 nmos_pcell_CDNS_668711705480 $T=1225 -1554 0 0 $X=1147 $Y=-1774
X4 7 8 B 17 nmos_pcell_CDNS_668711705480 $T=1353 -1554 0 0 $X=1275 $Y=-1774
X5 8 Y C 17 nmos_pcell_CDNS_668711705480 $T=1481 -1554 0 0 $X=1403 $Y=-1774
.ENDS
***************************************
