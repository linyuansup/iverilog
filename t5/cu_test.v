`include "./cu.v"

`timescale  1ns / 1ps

module tb_cu;

// cu Parameters
parameter PERIOD  = 10;


// cu Inputs
reg   [7:0]  op                            = 0 ;
reg   acc                                  = 0 ;

// cu Outputs
wire  wmem                                 ;
wire  wacc                                 ;
wire  [3:0] alu_op                         ;
wire  [2:0] pc                             ;

cu  u_cu (
    .op                      ( op               [7:0] ),
    .acc                     ( acc                    ),

    .wmem                    ( wmem                   ),
    .wacc                    ( wacc                   ),
    .alu_op                  ( alu_op                 ),
    .pc                      ( pc                     )
);

initial begin
    op = {`cu_add, 5'b00000};
    #PERIOD;
    op = {`cu_sta, 5'b00000};
    #PERIOD;
    op = {`cu_lda, 5'b00000};
    #PERIOD;
    op = {`cu_jmp, 5'b00000};
    #PERIOD;
    op = {`cu_ban, 5'b00000};
    acc = 1;
    #PERIOD;
    op = {`cu_long_begin, `cu_cla};
    #PERIOD;
    op = {`cu_long_begin, `cu_com};
    #PERIOD;
    op = {`cu_long_begin, `cu_shr};
    #PERIOD;
    op = {`cu_long_begin, `cu_csl};
    #PERIOD;
    op = {`cu_long_begin, `cu_stop};
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("cu.vcd");
    $dumpvars(0, tb_cu);
end

endmodule