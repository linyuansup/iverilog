`include "./dmem.v"

`timescale  1ns / 1ps

module tb_dmem;

// dmem Parameters
parameter PERIOD  = 10;


// dmem Inputs
reg   clk                                  = 0 ;
reg   wm                                   = 0 ;
reg   [7:0]  in                            = 0 ;
reg   [7:0]  ad                            = 0 ;

// dmem Outputs
wire  [7:0]  out                           ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end


dmem  u_dmem (
    .clk                     ( clk        ),
    .wm                      ( wm         ),
    .in                      ( in   [7:0] ),
    .ad                      ( ad   [7:0] ),

    .out                     ( out  [7:0] )
);

initial begin
    wm = 0;
    ad = 0;
    #PERIOD;
    wm = 0;
    ad = 1;
    #PERIOD;
    wm = 0;
    ad = 2;
    #PERIOD;
    wm = 1;
    ad = 3;
    in = 3;
    #PERIOD;
    wm = 0;
    ad = 3;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("dmem.vcd");
    $dumpvars(0, tb_dmem);
end


endmodule