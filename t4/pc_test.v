`include "./pc.v"

`timescale  1ns / 1ps

module tb_pc;

// pc Parameters
parameter PERIOD  = 10;


// pc Inputs
reg   clk                                  = 0 ;
reg   reset                                = 0 ;
reg   enable                               = 0 ;
reg   [7:0]  increment                     = 0 ;

// pc Outputs
wire  [7:0]  pc_out                        ;


initial begin
    forever #(PERIOD/2)  clk=~clk;
end

pc  u_pc (
    .clk                     ( clk              ),
    .reset                   ( reset            ),
    .enable                  ( enable           ),
    .increment               ( increment  [7:0] ),

    .pc_out                  ( pc_out     [7:0] )
);

initial begin
    reset = 1;
    enable = 0;
    increment = 0;
    #PERIOD;
    reset = 0;
    enable = 1;
    increment = 5;
    #PERIOD;
    reset = 0;
    enable = 1;
    increment = 1;
    #PERIOD;
    reset = 0;
    enable = 0;
    increment = 5;
    #PERIOD;
    reset = 1;
    enable = 0;
    increment = 9;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("pc.vcd");
    $dumpvars(0, tb_pc);
end

endmodule