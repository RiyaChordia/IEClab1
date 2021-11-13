module adaptation_tb;
// Inputs
reg reset;
reg clk;
reg [3:0] p_s;
reg [7:0] N_n;
reg [7:0] N_e;
reg [7:0] N_s;
reg [7:0] N_w;
// Outputs
wire [7:0] TGn;
wire [7:0] TGe;
wire [7:0] TGs;
wire [7:0] TGw;
// Instantiate the Unit Under Test (UUT)
adaptation uut (
.reset(reset),
.clk(clk),
.p_s(p_s),
.N_n(N_n),
.N_e(N_e),
.N_s(N_s),
.N_w(N_w),
.TGn(TGn),
.TGe(TGe),
.TGs(TGs),
.TGw(TGw)
);
always #5 clk= ~clk;
initial begin
// Initialize Inputs
reset = 0;
clk = 0;
p_s = 3'b000; #50
N_n = 43;
N_e = 22;
N_s = 20;
N_w = 15;
TGin = 54;
TGie = 54;
TGis = 54;
TGiw = 54; #10;
p_s=3'b010;
// Wait 100 ns for global reset to finish
#100;
// Add stimulus here
end
endmodule