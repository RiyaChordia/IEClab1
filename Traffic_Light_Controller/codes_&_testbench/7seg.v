module to_7seg(
        a,
        seg7
    );
    input [3:0]a;
    output [6:0]seg7;
    reg [6:0]seg7;
    always @ (  a)
    begin
        case ( a ) 
        4'b0000:
        begin
            seg7 <= 7'b0000001;
        end
        4'b0001:
        begin
            seg7 <= 7'b1001111;
        end
        4'b0010:
        begin
            seg7 <= 7'b0010010;
        end
        4'b0011:
        begin
            seg7 <= 7'b0000110;
        end
        4'b0100:
        begin
            seg7 <= 7'b1001100;
        end
        4'b0101:
        begin
            seg7 <= 7'b0100100;
        end
        4'b0110:
        begin
            seg7 <= 7'b0100000;
        end
        4'b0111:
        begin
            seg7 <= 7'b0001111;
        end
        4'b1000:
        begin
            seg7 <= 7'b0000000;
        end
        4'b1001:
        begin
            seg7 <= 7'b0000100;
        end
        4'b1010:
        begin
            seg7 <= 7'b0001000;
        end
        4'b1011:
        begin
            seg7 <= 7'b1100000;
        end
        4'b1100:
        begin
            seg7 <= 7'b0110001;
        end
        4'b1101:
        begin
            seg7 <= 7'b1000010;
        end
        4'b1110:
        begin
            seg7 <= 7'b0110000;
        end
        4'b1111:
        begin
            seg7 <= 7'b0111000;
        end
        default :
        begin
        end
        endcase
    end
endmodule 