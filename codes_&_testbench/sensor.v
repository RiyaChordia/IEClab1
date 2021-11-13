module north_sensor (
input reset,
input state, 
input [7:0] new_data, 
output reg [7:0] mov_avg,
output reg [7:0] n_0,
output reg [7:0] n_1,
output reg [7:0] n_2,
output reg [7:0] n_3,
output reg [15:0] sum
 );
parameter size=2;
parameter l=2**size;
reg [7:0] north_vehicle [3:0];
reg [7:0] i;
always@ (state or reset) begin
sum='d0;
if(reset) 
begin
north_vehicle [0] =5;
north_vehicle [1] =10;
north_vehicle[2]=20;
north_vehicle [3] =15;
end
else 
begin
for (i=l-1; i>0; i=i-1)
north_vehicle[i]=north_vehicle[i-1];
north_vehicle [0] =new_data;
end
for (i=0; i<l; i=i+1) 
begin
sum= sum + north_vehicle[i];
end
mov_avg=sum >> size;
n_0=north_vehicle [0];
n_1=north_vehicle [1];
n_2=north_vehicle [2];
n_3=north_vehicle [3];
end
endmodule
