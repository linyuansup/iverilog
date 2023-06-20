`include "./mux2to1.v"

`timescale  1ns / 1ps

module tb_mux2to1;

// mux2to1 Parameters
parameter PERIOD  = 10;


// mux2to1 Inputs
reg   [3:0]  a                             = 0 ;
reg   [3:0]  b                             = 0 ;
reg   sel                                  = 0 ;

// mux2to1 Outputs
wire  [3:0]  y                             ;

mux2to1  u_mux2to1 (
    .a                       ( a    [3:0] ),
    .b                       ( b    [3:0] ),
    .sel                     ( sel        ),

    .y                       ( y    [3:0] )
);

initial begin
    sel <= 0;
    a <= 5;
    b <= 9;
    #PERIOD;
    sel <= 1;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("mux2to1.vcd");
    $dumpvars(0, tb_mux2to1);
end

endmodule