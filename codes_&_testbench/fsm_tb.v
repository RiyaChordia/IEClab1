module displayTimer_tb();
    
    reg reset, stop, clk, emBtn, pedBtn;
	reg [7:0]TGn,TGe, TGs, TGw, TO, tCycle;

    wire [2:0]nLight, eLight, sLight, wLight, color;
    wire [7:0] northTimer, eastTimer, southTimer, westTimer, timer;
    wire [4:0] state;
    
	displayTimer dut(
        reset, stop, clk, 
        emBtn, pedBtn,
        nLight, eLight, sLight, wLight, color,
        northTimer,  eastTimer, southTimer, westTimer,
	    timer, state,
		TGn, TGs, TGe, TGw, TO
    );
			
    always #0.5 clk = ~ clk;
    
    initial begin
		TGn = 5;
		TGe=10;
		TGs=5;
		TGw=5;
		TO = 3;
		//tCycle = 32;
		
    	stop = 0;
    	clk = 0;
    	emBtn = 0;
    	pedBtn = 0;
    	reset = 0; #4;
    	
    	reset = 1; #52;
		//emBtn = 1; #20;
		// emBtn = 0; 
		 pedBtn = 1;#20;
		 #200;
		    	
    	$finish;
    end
endmodule