module adaptation( reset ,
p_s, 
 Nn,//average of north vehicles
 Ne,//average of east vehicles
 Ns,//average of south vehicles
 Nw,//average of west vehicles

 TGn,
 TGe,
 TGs,
 TGw
    );
input reset;
input [2:0] p_s;
reg [7:0] TGin, TGie, TGis, TGiw;
input[7:0] Nn, Ne, Ns ,Nw;

output reg [7:0] TGn, TGe, TGs, TGw;
reg[8:0] ntot;
reg[7:0] avg;

parameter b=1;



always@(p_s==3'b010 or reset) begin
if(reset) begin
 TGin <=54;
 TGis <=54;
 TGie <=54;
 TGiw <=54;
 TGn <=54;
 TGs <=54;
 TGe<=54;
 TGw<=54;
end

ntot= Nn+Ne+Ns+Nw;
avg= ntot >> 2;

case(p_s)
3'b000://north green
begin 
TGn=TGin + b*(Nn - avg);
TGin=TGn;
end

3'b010://east green
begin 
TGe=TGie + b*(Ne - avg);
TGie=TGe;
end

3'b100://south green
begin 
TGs=TGis + b*(Ns - avg);
TGis=TGs;
end

3'b110://west green
begin 
TGw=TGiw + b*(Nw - avg);
TGiw=TGw;
end
endcase
end
endmodule