.TRAN 1.000000E-08 2.000000E-05 START=0.0

.meas tran Iavg AVG I(vVcc) FROM=0 TO=2.000000E-05
.meas tran Vavg AVG V(Vcc) FROM=0 TO=2.000000E-05
.meas tran Etot PARAM='Iavg*Vavg*2.000000E-05'

vvground vground 0 DC=Vss
vvsupply vsupply 0 DC=Vcc
vc0 c0 0 DC=Vcc
vb0 b0 0 pulse Vcc 0 0 0 0 5.000000E-06 1.000000E-05
va0 a0 0 DC=Vss
vb1 b1 0 pulse Vcc 0 0 0 0 2.500000E-06 5.000000E-06
va1 a1 0 DC=Vcc
vb2 b2 0 pulse Vcc 0 0 0 0 1.250000E-06 2.500000E-06
va2 a2 0 DC=Vss
vb3 b3 0 pulse Vcc 0 0 0 0 6.250000E-07 1.250000E-06
va3 a3 0 DC=Vcc
vb4 b4 0 pulse Vcc 0 0 0 0 3.125000E-07 6.250000E-07
va4 a4 0 DC=Vss
vb5 b5 0 pulse Vcc 0 0 0 0 1.562500E-07 3.125000E-07
va5 a5 0 DC=Vcc
vb6 b6 0 pulse Vcc 0 0 0 0 7.812500E-08 1.562500E-07
va6 a6 0 DC=Vss
vb7 b7 0 pulse Vcc 0 0 0 0 3.906250E-08 7.812500E-08
va7 a7 0 DC=Vcc
