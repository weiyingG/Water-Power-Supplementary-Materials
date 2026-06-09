
*Set defination
sets
g             $\mathcal{G}$ set of generating units          /g1*g12/
a             transmission lines               /a1*a34/
s             $\mathcal{S}$ set of energy-storage units /s1,s2/
b             $\mathcal{M}$ set of electricity-system buses   /b1*b24/
t             $\mathcal{T}$ ordered set of hours within optimization horizon /t1*t24/
g2b(g,b)      $\mathcal{G}(m)$ set of generating units that are connected to bus $m$  /g1.b1,g2.b2,g3.b7,g4.b13,g5.b15,
                                               g6.b15,g7.b16,g8.b18,g9.b21,g10.b22,
                                               g11.b23,g12.b23/
s2b(s,b)      $\mathcal{S}(m)$ set of energy-storage units that are connected to bus $m$  /s1.b2,s2.b3/

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Water~~~~~~~~~~~~~~~~~~
n             $i,j,z$ water-system-node indices  /n1*n17/
r             reservioir set            /r1/
k             $k$ water-tank index    /k1*k2/
j             junction              /j1*j12/
p             $p$ water-pump index  /p1,p2,p3/
l             $l$ water-pipe index  /l1*l11/
k2n           $\mathcal{I}^{K+}(k)$ node that is the inlet of tank $k$  /k1.n10,k2.n14/
r2n(r,n)      $\mathcal{I}^R$ set of reservoir nodes  /r1.n1/
j2n(j,n)      $\mathcal{I}^J$ set of water-system junction nodes    /j1.n2,j2.n3,j3.n4,j4.n5,j5.n6,j6.n7,j7.n8,j8.n9,j9.n12,j10.n13,j11.n16,j12.n17/
l2i(l,n)      $\mathcal{I}^{L+}(l)$ node that is the inlet of pipe $l$  /l1.n2,l2.n3,l3.n5,l4.n6,l5.n8,l6.n9,l7.n11,l8.n6,l9.n13,l10.n15,l11.n16/
l2n(l,n)      $\mathcal{I}^{L-}(l)$ node that is the outlet of pipe $l$  /l1.n3,l2.n4,l3.n6,l4.n7,l5.n9,l6.n10,l7.n12,l8.n13,l9.n14,l10.n16,l11.n17/
p2i           $\mathcal{I}^{P+}(p)$ node that is the inlet of pump $p$   /p1.n1,p2.n4,p3.n7/
p2n           $\mathcal{I}^{P-}(p)$ node that is the outlet of pump $p$    /p1.n2,p2.n5,p3.n8/
i2n           $\mathcal{I}^{+}(i)$ set of nodes that flow water directly to node $i$    /n1.n2,n2.n3,n3.n4,n4.n5,n5.n6,n6.n7,n7.n8,n8.n9,n9.n10,n11.n12,n6.n13,n13.n14,n15.n16,n16.n17/
    
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Connection~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
b2p(b,p)      $\mathcal{P}(m)$ set of water pumps that are connected to bus $m$    /b1.p1,b3.p2,b18.p3/  
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
x             $\omega$ index of tightening iteration number in the convexification method                       /x1*x80/   
y             $\mathcal{X}$ & set of water flow breakpoints in the linearization method  /y1*y25/
u             $\mathcal{Y}$ & set of water-pump speed breakpoints in the linearization method    /u1*u25/          
 ;




*Parameter and Data

table phdata(g,*)   thermal generator data
          pmax      rd        ru       cost       pt0        

g1         352      120       120      13.32       76       
g2         252      120       120      13.32       76      
g3         350      350       350      20.7        0        
g4         591      240       240      20.93       0         
g5         60       60        60       26.11       0          
g6         155      155       155      10.52       0          
g7         155      155       155      10.52       124        
g8         400      280       280      6.02        240       
g9         400      280       280      5.47        240       
g10        300      300       300      0           240       
g11        310      180       180      10.52       248       
g12        350      240       240      10.89       280
;
    
*generator data
*rd:    $G^{ramp,-}_{g}$ ramp-down limit of generating unit $g$
*rp:    $G^{ramp,+}_{g}$ ramp-up limit of generating unit $g$
*pmax:  $\bar{G}_{g}$ capacity of generating unit $g$
*cost:  $C_{g, t}^G$ hour-$t$ operating cost of generating unit $g$
*pt0：   $G_{g, 0}$ hour-0 output of generating unit $g$$


table psdata(s,*)   energy storage data
       pmax   emax     ce     de       pt0   

s1      50     10     0.95   0.95       0     
s2      60     12     0.95   0.95       0
;
*energy storage data
*pmax: $\bar{S}_s$ maximum state of energy (SOE) of energy storage unit $s$
*emax: $\bar{S}_s^{+}$/$\bar{S}_s^{-}$ charging and discharging capacity of energy-storage unit $s$
*de:   $S_s^\eta$ round-trip energy-retention rate of energy-storage unit $s$
*pt0:  $S_{s, 0}$ hour-0 SOE of energy-storage unit $s$ 

Parameters
pddatatime(t)
/
t1	1775.835
t2	1669.815
t3	1590.3
t4	1563.795
t5	1563.795
t6	1590.3
t7	1961.37
t8	2279.43
t9	2517.975
t10	2544.48
t11	2544.48
t12	2517.975
t13	2517.975
t14	2517.975
t15	2464.965
t16	2464.965
t17	2623.995
t18	2650.5
t19	2650.5
t20	2544.48
t21	2411.955
t22	2199.915
t23	1934.865
t24	1669.815
/
*total power demand in hour $t$.
pddatanode(b)
/
b1	0.038
b2	0.034
b3	0.063
b4	0.026
b5	0.025
b6	0.048
b7	0.044
b8	0.06
b9	0.061
b10	0.068
b13	0.093
b14	0.068
b15	0.111
b16	0.035
b18	0.117
b19	0.064
b20	0.045
/
;
* Demand percentage on each bus $m$
* $\bar{D}_{m, t}^E = pddatatime(t)*pddatanode(b)$ bus-$m$/hour-$t$ electricity demand

parameter pcsdata load shedding data/200/  
;
*$C_{m, t}^E$ bus-$m$/hour-$t$ value of lost electric load

table pldata(a,*) line data(susceptance capacity sending_node receving_node)
            sus         limit     m     n
*           (pu)         (pu)
a1        68.493         175      1     2
a2        4.4385         175      1     3
a3        11.02535       350      1     5
a4        7.37463112     175      2     4    
a5        4.878048       175      2     6
a6        7.8678         175      3     9
a7        11.90476       400      3     24
a8        9.009009       175      4     9
a9        10.63829       350      5     10               
a10       15.57632       175      6     10
a11       15.3374233     350      7     8
a12       5.675368       175      8     9
a13       5.675368       175      8     10
a14       11.904761      400      9     11
a15       11.904761      400      9     12
a16       11.904761      400      10    11
a17       11.904761      400      10    12
a18       20.49180       500      11    13
a19       23.47417       500      11    14
a20       20.49180       500      12    13
a21       10.15228       500      12    23
a22       11.31221       500      13    23
a23       16.83501       500      14    16
a24       58.13953       500      15    16
a25       40.16064      1000      15    21
a26       18.90359       500      15    24
a27       38.02281       500      16    17
a28       42.73504       500      16    19
a29       69.93006       500      17    18
a30       9.354536       500      17    22
a31       75.75757      1000      18    21
a32       49.26108      1000      19    20
a33       89.28571      1000      20    23
a34       14.45086       500      21    22
;

*sus: $U_{m, n}$ & susceptance of the transmission line between buses $m$ and $n$
*limit: $\bar{F}_{m, n}$ capacity of the transmission line between buses $m$ and $n$

table kdata(n,*)   tank data
            v_max          h_ini              A
n10         80000          20               1000
n14        200000          20               3000
;
*v_max: $\bar{K}_{k}$ capacity of tank $k$.
*h_ini: $H_{i, 0}$ hour-0 water level of tank outlet on node $i$.
*A:     $K^A_{k}$ cross-sectional area of tank $k$.


table pdata(i,n,*)   pump data
        w_max         A            B           C         eta      

n1.n2    3.0     -0.00010941    0.051516    223.32       0.75       
n4.n5    3.0     -0.00010941    0.051516    223.32       0.7         
n7.n8    3.0     -0.00010941    0.051516    223.32       0.8       ;
*w_max: $\bar{P}^{\sigma}_p$ maximum speed of pump $p$ between node $i$ and $n$ 
*A: $P^Q_{p}$ water-flow coefficient in the equation defining head gain on pump $p$ between node $i$ and $n$
*B: $P^{Q, \sigma}_{p}$ bilinear coefficient in the equation defining head gain on pump $p$ between node $i$ and $n$
*C: $P^\sigma_{p}$ pump-speed coefficient in the equation defining head gain on pump $p$ between node $i$ and $n$
*eta: $P_{p}^\eta$ efficiency of pump $p$ between node $i$ and $n$

Parameters
node(i)   node data elevation n1-n7
/
n1     10.6
n2     9.7
n3     0
n4     5
n5     55
n6     126
n7     121
n8     126
n9     157
n10    156
n11    156
n12    156.65
n13    128
n14    224.13
n15    224.13
n16    123
n17    106.42
/;
*$\bar{H}_i$ elevation of node $i$

table ddata(t,n)  water demand data
	n3	        n12	         n17
t1	0.55496006	0.55496006	0.55496006
t2	0.569564272	0.569564272	0.569564272
t3	0.832440091	0.832440091	0.832440091
t4	0.701002181	0.701002181	0.701002181
t5	1.460421211	1.460421211	1.460421211
t6	1.752505454	1.752505454	1.752505454
t7	2.132214969	2.132214969	2.132214969
t8	2.395090787	2.395090787	2.395090787
t9	2.00077706	2.00077706	2.00077706
t10	1.781713878	1.781713878	1.781713878
t11	1.737901242	1.737901242	1.737901242
t12	1.24135803	1.24135803	1.24135803
t13	1.24135803	1.24135803	1.24135803
t14	1.109920121	1.109920121	1.109920121
t15	1.168336969	1.168336969	1.168336969
t16	1.358191727	1.358191727	1.358191727
t17	1.460421211	1.460421211	1.460421211
t18	1.635671757	1.635671757	1.635671757
t19	1.971568635	1.971568635	1.971568635
t20	2.00077706	2.00077706	2.00077706
t21	1.577254908	1.577254908	1.577254908
t22	1.24135803	1.24135803	1.24135803
t23	0.701002181	0.701002181	0.701002181
t24	0.627981121	0.627981121	0.627981121
;
*dd: $\bar{D}_{i, t}^W$ node-$i$/hour-$t$ water demand

table ldata(i,n,t,*)   pipe data (F parameter)  
             F         d     l      

n2.n3       0.01      0.15  401   
n3.n4       0.01      0.30  18    
n5.n6       0.01      0.15  1002  
n6.n7       0.01      0.10  846   
n8.n9       0.01      0.25  18    
n9.n10      0.01      0.25  23    
n11.n12     0.01      0.10  16   
n6.n13      0.01      0.20  1003  
n13.n14     0.01      0.15  30   
n15.n16     0.01      0.23  6    
n16.n17     0.01      0.3   13   
;
*F: $L_{l}^{\Delta}$ & Darcy friction parameter of the pipe $l$ between node $i$ and $n$
*d: $L_{l}^{\rho}$ & inner radius of the pipe $l$ between node $i$ and $n$
*l: $L_{l}^{L}$& length of the pipe $l$ between node $i$ and $n$


table jdata(n,*)     junction data
       h_j     shed
*
n1       0     4000
n2      20     4000
n3      20     4000
n4      20     4000
n5      20     4000
n6      20     4000
n7      20     4000
n8      20     4000
n9      20     4000
n10     20     4000
n11     20     4000
n12     20     4000
n13     20     4000
n14     20     4000
n15     20     4000
n16     20     4000
n17     20     4000;

*h_j: $H_i^{-}$ & minimum pressure head of node $i$
*shed: $C_{i, t}^W$ node-$i$/hour-$t$ value of lost water load


scalar gravity  /9.8/;
*gravity: $\gamma$ gravitational constant

parameter Q1(i,n,t),Q2(i,n,t),P1(i,n,t),P2(i,n,t);
Q1(i,n,t)=0;
*Q1(i,n,t): ${Q}^{-}_{i, j, t, 1}$ the lower bound for water flow between nodes $i$ and $j$ at hour $t$, during iteration $1$ of the relaxation methods
Q2(i,n,t)=10;
*Q2(i,n,t): ${Q}^{+}_{i, j, t, 1}$ the upper bound for water flow between nodes $i$ and $j$ at hour $t$, during iteration $1$ of the relaxation methods
P1(i,n,t)=0;
*P1(i,n,t): ${P}^{-}_{p, t, 1}$ the lower bound for the speed of pump $p$ at hour $t$, on iteration $1$ of the relaxation methods
P2(i,n,t)=pdata(i,n,w_max);
*P2(i,n,t): ${P}^{+}_{p, t, 1}$ the upper bound for the speed of pump $p$ between nodes $i$ and $j$ at hour $t$, on iteration $1$ of the relaxation methods 
parameter tight(i,n,t,x),tolerance;
tight(i,n,t,x)=0.9;
tolerance=0.00001;
*tight(i,n,t,x): $\epsilon_{\omega}=0.9$ the bounds tightening value at iteration $\omega$ in the relaxation methods
*tolerance: $\phi=0.00001$ the convergence tolerance parameter for the relaxation methods

parameter Qy(y,i,n,t), Pu(u,i,n,t);
* Qy(y,i,n,t): $Q^B_{i, j, t,x}$ the water flow at breakpoint $x$ between nodes $i$ and $j$ at hour $t$ in the linearization method $\left(\mathrm{m}^3 / \mathrm{s}\right)$\\
* Pu(u,i,n,t): $P^B_{p, t, y}$ the pump speed at breakpoint $y$ for pump $p$ between nodes $i$ and $j$ at hour $t$ in the linearization method (p.u.)
Qy(y,i,n,t)=Q_1(i,n,t) + Q_2*(ord(y)-1)/24;
Wu(u,i,n,t)=P1(i,n,t) + pdata(i,n,w_max)*(ord(u)-1)/24;