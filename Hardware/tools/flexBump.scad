//tool: flex bump
//for parts that press/snap into this sheet, to hold them in place tighter
t=0.005;
echo("using flex bump tool. call bumpHelp() for usage.");

module bumpCut(depth=2.5,length=7,width=1.2,flex=.3,keyHole=[2,0.5]){
    translate([0,-depth]) square([t,depth]);
    translate([0,-depth]) square([length,flex]);
    translate([width,-depth+flex+width]) square([length-width,t]);
    translate([width,-depth+flex+width]) square([t,depth-flex-width]);
    translate([width+1,-depth+flex+width]) square(keyHole);
}

module bumpPoke(width=1.2,poke=.3,r=.7){
    translate([width/2,0]) difference(){
        translate([0,-r+poke]) circle(r,$fn=r*50);
        translate([r,t]) rotate(180) square(r*2);        
    }
    square([width,t]);
}

module bumpTest(){
    difference(){
        union(){
            translate([-5,-8]) square([20,20]);
        }
        translate([-2,0]) square([10,5]);
        bumpCut();        
    }
    bumpPoke();
}

module bumpHelp(moduleName="none"){
    if(moduleName=="none"){
        echo("------------");
        echo("Flex bump modules: bumpCut,bumpPoke,bumpTest,bumpHelp");
        echo("bumpHelp('moduleName') for input variables");    
        echo("------------");
    }
    if(moduleName=="bumpCut") echo("bumpCut(depth=2.5,length=7,width=1.2,flex=.3,keyHole=[2,0.5])");
    if(moduleName=="bumpPoke") echo("bumpPoke(width=1.2,poke=.3,r=.7)");
    if(moduleName=="bumpTest") echo("bumpTest()");
    if(moduleName=="bumpHelp") echo("bumpHelp(moduleName='none')");
}
bumpHelp("bumpCut");
bumpTest();
