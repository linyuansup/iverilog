//~ `New testbench
`include "./mux4to1.v"
`timescale  1ns / 1ps

module tb_mux4to1;

// mux4to1 Parameters
parameter PERIOD  = 10;


// mux4to1 Inputs
reg   [3:0]  a                             = 0 ;
reg   [3:0]  b                             = 0 ;
reg   [3:0]  c                             = 0 ;
reg   [3:0]  d                             = 0 ;
reg   [1:0]  sel                           = 0 ;

// mux4to1 Outputs
wire  [3:0]  y                             ;

mux4to1  u_mux4to1 (
    .a                       ( a    [3:0] ),
    .b                       ( b    [3:0] ),
    .c                       ( c    [3:0] ),
    .d                       ( d    [3:0] ),
    .sel                     ( sel  [1:0] ),

    .y                       ( y    [3:0] )
);

initial begin
    sel <= 0;
    a <= 5;
    b <= 1;
    c <= 5;
    d <= 9;
    #PERIOD;
    sel <= 1;
    #PERIOD;
    sel <= 2;
    #PERIOD;
    sel <= 3;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("mux4to1.vcd");
    $dumpvars(0, tb_mux4to1);
end

endmodule