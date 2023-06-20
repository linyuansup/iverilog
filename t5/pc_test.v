`include "pc.v"
`include "define.v"

`timescale  1ns / 1ps

module tb_pc;

// pc Parameters
parameter PERIOD  = 10;


// pc Inputs
reg   clk                                  = 0 ;
reg   reset                                = 0 ;
reg   [2:0]  mode                          = 0 ;
reg   [7:0]  offset                        = 0 ;

// pc Outputs
wire  [7:0]  pc_out                        ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

pc  u_pc (
    .clk                     ( clk           ),
    .reset                   ( reset         ),
    .mode                    ( mode    [2:0] ),
    .offset                  ( offset  [7:0] ),

    .pc_out                  ( pc_out  [7:0] )
);

initial begin
    reset = 1;
    mode = `pc_mode_add;
    offset = 5;
    #PERIOD
    reset = 0;
    mode = `pc_mode_normal;
    offset = 1;
    #PERIOD
    reset = 0;
    mode = `pc_mode_add;
    offset = 5;
    #PERIOD
    reset = 0;
    mode = `pc_mode_jump;
    offset = 9;
    #PERIOD
    reset = 0;
    mode = `pc_mode_stop;
    offset = 0;
    #PERIOD
    reset = 1;
    #PERIOD
    $finish;
end

initial begin
    $dumpfile("pc.vcd");
    $dumpvars(0, tb_pc);
end

endmodule