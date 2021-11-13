module msb_lsb_7seg(A, msb, lsb
    );
    input [7:0] A;
    output wire [6:0] msb, lsb;

    to_7seg S1(A[7:4], msb);
    to_7seg S2(A[3:0], lsb);    
endmodule