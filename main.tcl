
#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     82                         ;# number of mobilenodes
set val(x)      1102                    ;# X dimension of topography
set val(y)      780                     ;# Y dimension of topography
set val(stop)   50.5                         ;# time of simulation end
set opt(energymodel)    EnergyModel                ;# Initial Energy
set opt(initialenergy)  100                        ;# Initial energy in Joules
#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open Trace.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open Nam.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#    node parameter setup
#===================================
$ns node-config -adhocRouting  DSDV \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
	   -initialEnergy $opt(initialenergy) \
	   -energyModel $opt(energymodel) 	\
	   -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#Create 82 nodes
for { set i 0 } { $i < $val(nn)} { incr i } {
set node($i) [$ns node]
$node($i) random-motion 0
$node($i) color black
$ns initial_node_pos $node($i) 30
}


for { set i 0 } { $i < $val(nn)} { incr i } {
$ns at 0.0 "$node($i) color black"
$ns at 0.0 "$node($i) label-color maroon"
}

$ns at 0.0 "$node(0) setdest 234.401 99.1955 500"
$ns at 0.0 "$node(1) setdest 177.756 144.087 500"
$ns at 0.0 "$node(2) setdest 175.735 25.5377 500"
$ns at 0.0 "$node(3) setdest 264.122 14.5226 500"
$ns at 0.0 "$node(4) setdest 371.586 14.8759 500"
$ns at 0.0 "$node(5) setdest 268.964 182.835 500"

$ns at 0.0 "$node(6) setdest 325.312 109.892 500"
$ns at 0.0 "$node(7) setdest 486.243 19.1559 500"
$ns at 0.0 "$node(8) setdest 408.71 100.93 500"
$ns at 0.0 "$node(9) setdest 374.434 193.251 500"
$ns at 0.0 "$node(10) setdest 498.729 94.1479 500"

$ns at 0.0 "$node(11) setdest 592.716 25.2623 500"
$ns at 0.0 "$node(12) setdest 496.315 174.277 500"
$ns at 0.0 "$node(13) setdest 576.103 114.057 500"
$ns at 0.0 "$node(14) setdest 684.818 104.517 500"
$ns at 0.0 "$node(15) setdest 632.487 170.257 500"

$ns at 0.0 "$node(16) setdest 809.107 92.099 500"
$ns at 0.0 "$node(17) setdest 735.429 20.7304 500"
$ns at 0.0 "$node(18) setdest 892.758 80.8298 500"
$ns at 0.0 "$node(19) setdest 860.849 19.2587 500"
$ns at 0.0 "$node(20) setdest 978.797 20.8978 500"

$ns at 0.0 "$node(21) setdest 982.617 99.9876 500"
$ns at 0.0 "$node(22) setdest 985.524 191.966 500"
$ns at 0.0 "$node(23) setdest 895.793 172.923 500"
$ns at 0.0 "$node(24) setdest 766.36 190.034 500"
$ns at 0.0 "$node(25) setdest 990.024 280.111 500"

$ns at 0.0 "$node(26) setdest 847.491 224.274 500"
$ns at 0.0 "$node(27) setdest 773.508 282.024 500"
$ns at 0.0 "$node(28) setdest 924.369 273.136 500"
$ns at 0.0 "$node(29) setdest 871.354 308.94 500"
$ns at 0.0 "$node(30) setdest 927.053 361.553 500"

$ns at 0.0 "$node(31) setdest 1007.22 355.395 500"
$ns at 0.0 "$node(32) setdest 1010.65 460.691 500"
$ns at 0.0 "$node(33) setdest 946.626 460.973 500"
$ns at 0.0 "$node(34) setdest 872.679 459.812 500"
$ns at 0.0 "$node(35) setdest 843.016 367.872 500"

$ns at 0.0 "$node(36) setdest 743.621 370.246 500"
$ns at 0.0 "$node(37) setdest 674.284 331.777 500"
$ns at 0.0 "$node(38) setdest 663.362 392.01 500"
$ns at 0.0 "$node(39) setdest 654.124 261.64 500"
$ns at 0.0 "$node(40) setdest 598.499 312.417 500"

$ns at 0.0 "$node(41) setdest 537.144 214.228 500"
$ns at 0.0 "$node(42) setdest 606.382 380.658 500"
$ns at 0.0 "$node(43) setdest 537.577 356.445 500"
$ns at 0.0 "$node(44) setdest 468.395 272.879 500"
$ns at 0.0 "$node(45) setdest 395.501 291.583 500"

$ns at 0.0 "$node(46) setdest 445.814 367.831 500"
$ns at 0.0 "$node(47) setdest 545.346 455.34 500"
$ns at 0.0 "$node(48) setdest 455.434 438.87 500"
$ns at 0.0 "$node(49) setdest 330.388 279.273 500"
$ns at 0.0 "$node(50) setdest 354.546 373.188 500"

$ns at 0.0 "$node(51) setdest 260.655 270.75 500"
$ns at 0.0 "$node(52) setdest 183.388 255.004 500"
$ns at 0.0 "$node(53) setdest 260.687 357.166 500"
$ns at 0.0 "$node(54) setdest 181.145 333.41 500"
$ns at 0.0 "$node(55) setdest 316.549 421.417 500"

$ns at 0.0 "$node(56) setdest 182.731 421.754 500"
$ns at 0.0 "$node(57) setdest 341.919 489.257 500"
$ns at 0.0 "$node(58) setdest 270.044 520.645 500"
$ns at 0.0 "$node(59) setdest 186.212 525.787 500"
$ns at 0.0 "$node(60) setdest 185.982 626.749 500"

$ns at 0.0 "$node(61) setdest 268.301 629.081 500"
$ns at 0.0 "$node(62) setdest 384.622 548.164 500"
$ns at 0.0 "$node(63) setdest 349.33 625.947 500"
$ns at 0.0 "$node(64) setdest 454.24 512.006 500"
$ns at 0.0 "$node(65) setdest 447.813 619.048 500"

$ns at 0.0 "$node(66) setdest 532.458 618.613 500"
$ns at 0.0 "$node(67) setdest 542.36 538.059 500"
$ns at 0.0 "$node(68) setdest 623.716 554.864 500"
$ns at 0.0 "$node(69) setdest 615.822 465.597 500"
$ns at 0.0 "$node(70) setdest 637.181 619.163 500"

$ns at 0.0 "$node(71) setdest 722.515 538.423 500"
$ns at 0.0 "$node(72) setdest 691.867 475.791 500"
$ns at 0.0 "$node(73) setdest 725.434 611.125 500"
$ns at 0.0 "$node(74) setdest 779.719 463.213 500"
$ns at 0.0 "$node(75) setdest 810.512 534.857 500"

$ns at 0.0 "$node(76) setdest 823.737 611.056 500"
$ns at 0.0 "$node(77) setdest 903.384 535.048 500"
$ns at 0.0 "$node(78) setdest 892.936 609.51 500"
$ns at 0.0 "$node(79) setdest 1001.32 538.57 500"
$ns at 0.0 "$node(80) setdest 1007.63 612.233 500"
$ns at 0.0 "$node(81) setdest 635.512 754.305 500"
$ns at 0.0 "$ns set-animation-rate 5.0ms"

for {set i 0} {$i<$val(nn)} {incr i} {
set sink($i) [new Agent/LossMonitor]
$ns attach-agent $node($i) $sink($i)
}


proc attach-CBR-traffic { node sink size itval} {
   #Get an instance of the simulator
   set ns [Simulator instance]
   set udp [new Agent/UDP]
   $ns attach-agent $node $udp
   #Create a CBR  agent and attach it to the node
   set cbr [new Application/Traffic/CBR]
   $cbr attach-agent $udp
   $cbr set packetSize_ $size	;#sub packet size
   $cbr set interval_ $itval
   #Attach CBR source to sink;
   $ns connect $udp $sink
   return $cbr
  }


set cbr001 [attach-CBR-traffic $node(0) $sink(1) 256 0.082]
$ns at 2.3 "$cbr001 start"
$ns at 2.4 "$cbr001 stop"


set nbr [open Neighbor w]
puts $nbr "\t\t\t\t\tNeighbor Detail"
puts $nbr "\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts $nbr "\tSource\tNeighbor\tSX-Pos\tSY-Pos\tH-Distance(d)"
puts $nbr "\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
close $nbr

set dst 81
#KNN 
proc distance { n1 n2 nd1 nd2} {
global c n bnd
set nbr [open Neighbor a]
set x1 [expr int([$n1 set X_])]
set y1 [expr int([$n1 set Y_])]
set x2 [expr int([$n2 set X_])]
set y2 [expr int([$n2 set Y_])]
set d [expr int(sqrt(pow(($x2-$x1),2)+pow(($y2-$y1),2)))]
if {$d<200} {
if {$nd2!=$nd1} {
puts $nbr "\t$nd1\t\t$nd2\t\t\t$x1\t\t$y1\t\t$d"
}
}
close $nbr
}


for {set i 0} {$i <$val(nn)} {incr i} {
for {set j 0} {$j <$val(nn)} {incr j} {
$ns at 1.5 "distance $node($i) $node($j) $i $j" 
}
}

set dst 79
#---------------Broadcast the information----------------------

set b [open "btemp" w]
puts $b "0 82 2.5 0.01"
close $b

$ns at 2.5 "exec awk -f Packet-forwarding.awk btemp Neighbor"
$ns at 2.5 "source broadcast.tcl"
#========exctracting energy information from trace file
$ns at 10.2 "exec awk -f Nodes-energy.awk Trace.tr"
$ns at 10.2 "source nodes-energy.tcl"
#-----------------------------
set md [open "Node-rss-values" w]
close $md
proc memo {} {
global ns
puts "\n\n"
for {set i 0} { $i < 82} {incr i} {
set val [expr int(rand()*250)]
set md [open "Node-rss-values" a] 
puts $md "$i Node have rss value is $val"
$ns at 18.4 "$ns trace-annotate \"$i Node have rss value is $val\""
close $md
} 

puts "\n\n"
}  
memo

#---------------------------------Gaussian distribution random variable--------------------------------
set mds [open "gaussian-variables" w]
close $md
proc memos {} {
global ns
puts "\n\n"
for {set i 0} { $i < 81} {incr i} {
set vals [expr int(rand()*5)]
set mds [open "gaussian-variables" a] 
puts $mds "$i Node have cost value is $vals"
$ns at 4.1 "$ns trace-annotate \"$i Node have gaussian variable is $vals\""
close $mds
} 

puts "\n\n"
}  
memos

#=======ch======
$ns at 18.6 "exec awk -f high-engy.awk Nodes-Initial-Energy Trace.tr Node-rss-values"
$ns at 18.7 "exec awk -f Cluster-heads.awk clusterhead Node-rss-values"
$ns at 18.7 "source cluster-heads.tcl"
$ns at 18.8 "exec awk -f cluster_node_distance.awk ntemp Neighbor Node-rss-values cluster-heads Nodes-Initial-Energy"
$ns at 18.8 "source cluster_node_distance.tcl"
$ns at 20.6 "exec awk -f high-cluster-engy.awk Trace.tr cluster_node_distance Node-rss-values"
$ns at 20.6 "source clusterhead1.tcl"
$ns at 22.8 "exec awk -f Cluster-heads1.awk clusterhead1 cluster_node_distance"
$ns at 22.8 "source cluster-heads1.tcl"
$ns at 22.9 "exec awk -f clusterhead-info.awk cluster-heads1 cluster-heads"
$ns at 22.9 "source comm.tcl"
#======DCH's
$ns at 27.1 "exec awk -f dch-cluster-engy.awk clusternodes1" 
$ns at 27.11 "exec awk -f dch-cluster-engy1.awk clusternodes2 clusternodes3 clusternodes4 clusternodes5 clusternodes6 clusternodes7 clusternodes8 clusternodes9"
$ns at 27.12 "exec awk -f dch-Cluster-heads1.awk Node-rss-values cluster_node_distance sclusternodes1 sclusternodes2 sclusternodes3 sclusternodes4 sclusternodes5 sclusternodes6 sclusternodes7 sclusternodes8 sclusternodes9"
$ns at 27.123 "exec awk -f dch-Cluster-heads2.awk Node-rss-values cluster_node_distance sclusternodes1 sclusternodes2 sclusternodes3 sclusternodes4 sclusternodes5 sclusternodes6 sclusternodes7 sclusternodes8 sclusternodes9"
$ns at 27.13 "exec awk -f next_clusterhead-info.awk leaders-DCH1 leaders-DCH2"
$ns at 27.13 "source next_comm.tcl"
#====Enhancement===

$ns at 27.2 "exec awk -f Bias-estimation.awk temperature-data gaussian-variables"
$ns at 27.2 "source bias-estimation.tcl"
$ns at 29.3 "exec awk -f Variance-estimation.awk temperature-data node-bias"
$ns at 29.3 "source variance-estimation.tcl"
$ns at 31.4 "exec awk -f Authentication.awk node-variance"
$ns at 31.5 "exec awk -f misbehavour.awk Replica"
$ns at 31.5 "source mcomm.tcl"
##=========data ============
$ns at 33.4 "exec awk -f head-members.awk leaders-CH"
$ns at 33.4 "source head-members.tcl"

$ns at 40.8 "exec awk -f Datacollection.awk leaders-CH leaders-DCH1"
$ns at 40.8 "source datacollection.tcl"
$ns at 41.0 "exec awk -f dataforwarding.awk leaders-DCH1"
$ns at 41.1 "exec awk -f datatosink.awk DCT-Tree"
$ns at 41.1 "source datatoBS.tcl"

#~~~~~~~~~~~~~~~~~~~~~~~For Graph~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set pr1 [open PDR.xg w]
puts $pr1 "Markers: true"
puts $pr1 "BoundBox: true"
puts $pr1 "Background: grey"
puts $pr1 "Ticks: true"
puts $pr1 "NoLines: false"
puts $pr1 "0 0"
set tp1 [open Throughput.xg w]
puts $tp1 "Markers: true"
puts $tp1 "BoundBox: true"
puts $tp1 "Background: grey"
puts $tp1 "Ticks: true"
puts $tp1 "NoLines: false"
puts $tp1 "0 0"
set dp1 [open Drop.xg w]
puts $dp1 "Markers: true"
puts $dp1 "BoundBox: true"
puts $dp1 "Background: grey"
puts $dp1 "Ticks: true"
puts $dp1 "NoLines: false"
puts $dp1 "0 0"


proc record {sink} {
global ns dp1 tp1 pr1 
set tm [$ns now]

set rec1 [$sink set npkts_]
set lst1 [$sink set nlost_]
set byt1 [$sink set bytes_]

if {$rec1!=0} {
set pdr1 [expr ($rec1+0.0)/($rec1+$lst1)]
puts $pr1 "$tm $pdr1"
}

set tput1 [expr ($byt1*8.0)/(5.0*1000)]
puts $tp1 "$tm $tput1"

puts $dp1 "$tm $lst1"

$ns at [expr $tm+2.0] "record $sink"

$sink set nlost_ 0
}


$ns at 5.0 "record $sink($dst)"
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile tp1 dp1 pr1
        close $tp1
	close $dp1
	close $pr1
    $ns flush-trace
    close $tracefile
    close $namfile
exec awk -f energy.awk Trace.tr
	
    exec nam Nam.nam &

	
	exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
   # $ns at $val(stop) "\$n$i reset"	
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
