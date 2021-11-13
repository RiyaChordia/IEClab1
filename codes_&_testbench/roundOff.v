module rem_fun(
        x,
        y
    );
    input [31:0]x;
    output [31:0]y;
    wire [31:0]rem1;
    reg [31:0]y;
    assign rem1 = ( x % 10 );
    always @ (  rem1 or  x)
    begin
        if ( rem1 < 5 ) 
        begin
            y <= ( ( x / 10 ) * 10 );
        end
        else
        begin 
            if ( 1 ) 
            begin
                y <= ( ( ( x / 10 ) + 1 ) * 10 );
            end
        end
    end
endmodule 