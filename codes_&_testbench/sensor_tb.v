module north_tb;
// Inputs
reg reset;
reg state;
reg [7:0] new_data;
// Outputs
wire [7:0] mov_avg;
wire [7:0] n_0;
wire [7:0] n_1;
wire [7:0] n_2;
wire [7:0] n_3;
wire [15:0] sum;
// Instantiate the Unit Under Test (UUT)
sensor uut (
.reset(reset), 
.state(state), 
.new_data(new_data), 
.mov_avg(mov_avg), 
.n_0(n_0), 
.n_1(n_1), 
.n_2(n_2), 
.n_3(n_3), 
.sum(sum)
);
initial begin
// Initialize Inputs
state = 0;
reset = 1; #10
reset = 0; 
new_data = 12; #50
new_data= 7; #50
new_data = 10; #50
new_data = 5;
end
always#50 state=~state;
endmodule
