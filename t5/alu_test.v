`include "./alu.v"

`timescale  1ns / 1ps

module tb_alu;

// alu Parameters
parameter PERIOD  = 10;


// alu Inputs
reg   [3:0]  op                            = 0 ;
reg   [7:0]  a                             = 0 ;
reg   [7:0]  b                             = 0 ;

// alu Outputs
wire  [7:0]  result                        ;

alu  u_alu (
    .op                      ( op      [3:0] ),
    .a                       ( a       [7:0] ),
    .b                       ( b       [7:0] ),

    .result                  ( result  [7:0] )
);

initial begin
    op = `alu_cla;
    a = 20;
    b = 21;
    #PERIOD;
    op = `alu_com;
    a = 21;
    b = 51;
    #PERIOD;
    op = `alu_shr;
    a = 59;
    b = 20;
    #PERIOD;
    op = `alu_csl;
    a = 21;
    b = 21;
    #PERIOD;
    op = `alu_add;
    a = 51;
    b = 59;
    #PERIOD;
    op = `alu_sta;
    a = 20;
    b = 21;
    #PERIOD;
    op = `alu_lda;
    a = 51;
    b = 59;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);
end

endmodule