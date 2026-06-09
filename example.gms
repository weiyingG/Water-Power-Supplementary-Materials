
*Set defination
sets
g             $\mathcal{G}$ set of generating units          /g1*g3/
a             transmission lines               /a1*a9/
s             $\mathcal{S}$ set of energy-storage units             /s1,s2/
m             $\mathcal{M}$ set of electricity-system buses                            /m1*m9/
t             $\mathcal{T}$ ordered set of hours within optimization horizon                     /t1*t3/
g2b(g,b)      $\mathcal{G}(m)$ set of generating units that are connected to bus $m$     /g1.m1,g2.m2,g3.m3/
s2b(s,b)      $\mathcal{S}(m)$ set of energy-storage units that are connected to bus $m$  /s1.b2,s2.b3/



*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Water~~~~~~~~~~~~~~~~~~
i             $i,j,z$ water-system-node indices                  /n1*n11/
r             reservioir set        /r1*r2/
k             $k$ water-tank index        /k1/
j             junction  set            /j1*j7/
p             $p$ water-pump index             /p1,p2,p3/
v             $v$ water-valve index            /v1,v2/
l             $l$ water-pipe index             /l1*l5/
k2i           $\mathcal{I}^{K+}(k)$ node that is the inlet of tank $k$                    /k1.i10/
r2n(r,n)      $\mathcal{I}^R$ set of reservoir nodes                 /r1.n8,r2.n9/
j2n(j,n)      $\mathcal{I}^J$ set of water-system junction nodes   /j1.n1,j2.n2,j3.n3,j4.n4,j5.n5,j6.n6,j7.n7/
l2i(l,n)      $\mathcal{I}^{L+}(l)$ node that is the inlet of pipe $l$      /l1.n2,l2.n3,l3.n11,l4.n7,l5.n1/
l2n           $\mathcal{I}^{L-}(l)$ node that is the outlet of pipe $l$     /l1.n3,l2.n4,l3.n7,l4.n6,l5.n10/
v2i           $\mathcal{I}^{V+}(v)$ node that is the inlet of valve $v$   /v1.n2,v2.n3/
v2n(v,n)      $\mathcal{I}^{V-}(v)$ node that is the outlet of valve $v$  /v1.n1,v2.n6/
p2i           $\mathcal{I}^{P+}(p)$ node that is the inlet of pump $p$                      /p1.n8,p2.n9,p3.n4/
p2n           $\mathcal{I}^{P-}(p)$ node that is the outlet of pump $p$                      /p1.n1,p2.n2,p3.n5/
i2n           $\mathcal{I}^{+}(i)$ set of nodes that flow water directly to node $i$                      /n8.n1,n9.n2,n4.n5,n2.n1,n2.n3,n3.n4,n1.n10,n3.n6,n11.n7,n7.n6/
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
x             $\omega$ index of tightening iteration number in the convexification method                       /x1*x80/   

*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Connection~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
b2p(b,p)      $\mathcal{P}(m)$ set of water pumps that are connected to bus $m$   /b5.p1,b7.p2,b9.p3/
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
y             $\mathcal{X}$ & set of water flow breakpoints (breakpoints number = segments number + 1) in the linearization method  /y1*y9/
u             $\mathcal{Y}$ & set of water-pump speed breakpoints (breakpoints number = segments number + 1) in the linearization method    /u1*u9/     
;



table phdata(g,*)   thermal generator data
        pmax     rd        ru       cost       pt0       
g1      50.0     5         5         5          20        
g2      50.0     10        10        10         40         
g3      50.0     25        25        25         25         ;
 
 
*generator data
*rd:    $G^{ramp,-}_{g}$ ramp-down limit of generating unit $g$
*rp:    $G^{ramp,+}_{g}$ ramp-up limit of generating unit $g$
*pmax:  $\bar{G}_{g}$ capacity of generating unit $g$
*cost:  $C_{g, t}^G$ hour-$t$ operating cost of generating unit $g$
*pt0：   $G_{g, 0}$ hour-0 output of generating unit $g$$


table psdata(s,*)   energy storage data
       pmax   emax       de      pt0   
s1      50     10       0.90       0  
s2      60     12       0.90       0  ;


*energy storage data
*pmax: $\bar{S}_s$ maximum state of energy (SOE) of energy storage unit $s$
*emax: $\bar{S}_s^{+}$/$\bar{S}_s^{-}$ charging and discharging capacity of energy-storage unit $s$
*de:   $S_s^\eta$ round-trip energy-retention rate of energy-storage unit $s$
*pt0:  $S_{s, 0}$ hour-0 SOE of energy-storage unit $s$ 


table pddata(b,t,*)  load data
           dd         cs
b5.t1      15        200.0
b5.t2      1         200.0
b5.t3      20        200.0
b7.t1      17        200.0
b7.t2      1         200.0
b7.t3      18        200.0
b9.t1      20        200.0
b9.t2      1         200.0
b9.t3      18        200.0
;
*dd: $\bar{D}_{m, t}^E$ bus-$m$/hour-$t$ electricity demand
*cs: $C_{m, t}^E$ bus-$m$/hour-$t$ value of lost electric load

table pldata(a,*) line data(susceptance capacity sending_node receving_node)
          sus    limit    ls    lr
a1        13      45      1     4
a2        13      45      4     5
a3        13      45      5     6
a4        13      45      3     6    
a5        13      45      6     7
a6        13      45      7     8
a7        13      47.3    8     2
a8        13      45      8     9
a9        13      45      9     4;
;
*sus: $U_{m, n}$ & susceptance of the transmission line between buses $m$ and $n$
*limit: $\bar{F}_{m, n}$ capacity of the transmission line between buses $m$ and $n$

table kdata(n,*)   tank data
            v_max           h_ini                A

n10         10000           35                  200       ;
*v_max: $\bar{K}_{k}$ capacity of tank $k$.
*h_ini: $H_{i, 0}$ hour-0 water level of tank outlet on node $i$.
*A:     $K^A_{k}$ cross-sectional area of tank $k$.


table pdata(i,n,*)   pump data
        w_max         A            B         C          eta      
n8.n1    1.5    -0.00010941    0.051516    223.32       0.8      
n9.n2    1.5    -0.00010941    0.051516    223.32       0.8       
n4.n5    1.5    -0.00010941    0.051516    223.32       0.8     ;
*w_max: $\bar{P}^{\sigma}_p$ maximum speed of pump $p$ between node $i$ and $n$ 
*A: $P^Q_{p}$ water-flow coefficient in the equation defining head gain on pump $p$ between node $i$ and $n$
*B: $P^{Q, \sigma}_{p}$ bilinear coefficient in the equation defining head gain on pump $p$ between node $i$ and $n$
*C: $P^\sigma_{p}$ pump-speed coefficient in the equation defining head gain on pump $p$ between node $i$ and $n$
*eta: $P_{p}^\eta$ efficiency of pump $p$ between node $i$ and $n$



Parameters
node(i)   node data elevation n1-n7
/
n1     0
n2     0
n3     0
n4     0
n5     1
n6     0
n7     0
n8     0
n9     0
n10    0
n11    0/;
*$\bar{H}_i$ elevation of node $i$

table ddata(n,t,*)  water demand data
         dd
*
n1.t1    2
n1.t2    2
n1.t3    2
n2.t1    2
n2.t2    2
n2.t3    2
n3.t1    2
n3.t2    2
n3.t3    2
n4.t1    2
n4.t2    2
n4.t3    2
n5.t1    2
n5.t2    2
n5.t3    2
n6.t1    2
n6.t2    2
n6.t3    2
n7.t1    2
n7.t2    2
n7.t3    2
;
*dd: $\bar{D}_{i, t}^W$ node-$i$/hour-$t$ water demand

table ldata(i,n,*)   pipe data (F parameter)  
            F         
*
n2.n3       2                 
n3.n4       2                
n1.n10      2                  
n11.n7      2                 
n7.n6       2              
;

*F: $4\cdot{\pi}^2\cdot(L_{l}^{\rho})^5 /(L_{l}^{\Delta}\cdot L_{l}^{L})$ the calculated friction factor value of pump $p$ between node $i$ and $n$


table jdata(n,*)     junction data
       h_j   shed
*
n1      0     4000
n2      0     4000
n3      0     4000
n4      0     4000
n5      0     4000
n6      0     4000
n7      0     4000;
*h_j: $H_i^{-}$ & minimum pressure head of node $i$
*shed: $C_{i, t}^W$ node-$i$/hour-$t$ value of lost water load


scalar gravity  /9.8/;
*$\gamma$ gravitational constant
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
Qy(y,i,n,t)=Q_1(i,n,t) + Q_2*(ord(y)-1)/8;
Wu(u,i,n,t)=P1(i,n,t) + pdata(i,n,w_max)*(ord(u)-1)/8;
