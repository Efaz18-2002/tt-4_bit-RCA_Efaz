`default_nettype none


module full_adder ( input A , B , C_in , output S , C_out ) ;
    wire w1 , w2 , w3 ;

    assign w1 = A ^ B ;
    assign S  = w1 ^ C_in ;
    assign w2 = w1 & C_in ;
    assign w3 = A & B ;
    or ( C_out , w2 , w3 ) ;

endmodule


module Four_bit_RCA (
    input  [3:0] A ,
    input  [3:0] B ,
    input        Cin ,
    output [3:0] S ,
    output       Cout
) ;
    wire w0 , w1 , w2 ;

    full_adder FA0 ( A[0] , B[0] , Cin , S[0] , w0 ) ;
    full_adder FA1 ( A[1] , B[1] , w0  , S[1] , w1 ) ;
    full_adder FA2 ( A[2] , B[2] , w1  , S[2] , w2 ) ;
    full_adder FA3 ( A[3] , B[3] , w2  , S[3] , Cout ) ;

endmodule

// ── Tiny Tapeout wrapper — new, connects TT pins to your design-AI generated
module tt_um_efaz_afnan_feroz_4bit_rca (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);
    wire [3:0] S;
    wire       Cout;

    // Instantiate your original design — Cin hardwired 0
    // (no spare input pin on TT chip)
    Four_bit_RCA rca (
        .A    ( ui_in[3:0] ),
        .B    ( ui_in[7:4] ),
        .Cin  ( 1'b0       ),
        .S    ( S          ),
        .Cout ( Cout       )
    );

    assign uo_out  = { 3'b0 , Cout , S };
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
