`timescale 1ns / 1ps

module basicFSM(
reset, stop, clk,
em_button, pd_button,
nLight, eLight, sLight, wLight, color,
n_counter, e_counter, s_counter, w_counter,
counter, state, TGn, TGe, TGs, TGw, TO
    );
   
input reset, stop, clk, em_button, pd_button;
input [7:0]TGn, TGs, TGe, TGw, TO;
wire [7:0] tCycle;
assign tCycle= TGn+TGe+TGs+TGw + 4*(TO);

    output reg [2:0] nLight, eLight, sLight, wLight, color;
	output reg [7:0] n_counter, e_counter, s_counter, w_counter, counter;
	output reg [4:0] state;

    parameter [2:0]green = 3'b001;
    parameter [2:0]orange = 3'b010;
    parameter [2:0]red = 3'b100;
   
    parameter [3:0]allRed = 0;
    parameter [3:0]N_green = 1;
    parameter [3:0]N_orange = 2;
    parameter [3:0]E_green = 3;
    parameter [3:0]E_orange = 4;
    parameter [3:0]S_green = 5;
    parameter [3:0]S_orange = 6;
    parameter [3:0]W_green = 7;
    parameter [3:0]W_orange = 8;
   
reg [3:0]flagState;
reg em;
reg ped;
reg [7:0]tRed = 10;

    always @(posedge clk) begin

if(em_button) em = 1;
if(pd_button) ped = 1;

    if(!reset) begin

nLight = red;
eLight = red;
sLight = red;
wLight = red;
color =  red;

n_counter = 0;
e_counter =  0;
s_counter = 0;
w_counter =  0;

counter = n_counter;

state = allRed;
flagState = allRed;

end else begin
if(counter == 0) begin

if(color == orange && (ped == 1 || em == 1)) begin
flagState = state;
state = allRed;

    end else begin
    if (flagState == W_orange || state == W_orange) state = N_green;
    else if(state == allRed) state = flagState + 1;
    else state = state + 1;
    end

case(state)
   
allRed: begin
nLight = red;
eLight = red;
sLight = red;
wLight = red;
color  = red;

n_counter = n_counter + tRed;
e_counter = e_counter + tRed;
s_counter = s_counter + tRed;
w_counter = w_counter + tRed;
counter = counter + tRed;
ped = 0;
end

N_green: begin
nLight = green;
wLight = red;
n_counter = TGn;
e_counter = TGn + TO;
s_counter = 2*(TO) +TGe +TGn;
w_counter = TGe +TGn + TGs + 3*(TO) ;
counter = n_counter;
color = nLight;
flagState = allRed;
end

N_orange: begin
nLight = orange;
n_counter = TO;
counter = n_counter;
color = nLight;
end

E_green: begin
eLight = green;
nLight = red;
n_counter = tCycle - (TGn+TO);
e_counter = TGe;
counter = e_counter;
color = eLight;
end

E_orange: begin
eLight = orange;
e_counter = TO;
counter = e_counter;
color = eLight;
end

S_green: begin
sLight = green;
eLight = red;
e_counter = tCycle -(TGe+ TO);
s_counter = TGs ;
counter = s_counter;
color = sLight;
end

S_orange: begin
sLight = orange;
s_counter = TO;
counter = s_counter;
color = sLight;
end

W_green: begin
wLight = green;
sLight = red;
s_counter = tCycle - (TGs+TO);
w_counter = TGw;
counter = w_counter;
color = wLight;
end

W_orange: begin
wLight = orange;
w_counter = TO;
counter = w_counter;
color = wLight;
end
   
    endcase
    end

counter = counter - 1;
n_counter = n_counter - 1;
e_counter = e_counter - 1;
s_counter = s_counter - 1;
w_counter = w_counter - 1;
    end
    end



endmodule