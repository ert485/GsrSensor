include <tools/flexBump.scad>;

buttonR=19.9/2;
vibR=9.8/2; //(tight)
mosfet=[10.15,9.3];
$fn=100;
VoltMR=3/2;
VoltMx=29.3;

difference(){
    translate([0,4]) square([45,60]);
    translate([19,10]) square(mosfet);
    translate([22,10]) bumpCut(width=2,depth=4,flex=0.6);
    translate([30,32]) circle(buttonR);
    translate([9.5,30]) circle(vibR);
    translate([36.5,55]) circle(VoltMR);
    translate([36.5-VoltMx,55]) circle(VoltMR);
}
translate([22,10]) bumpPoke(width=2,r=1,poke=0.6);



