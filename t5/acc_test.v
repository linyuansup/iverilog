`include "./acc.v"

`timescale  1ns / 1ps

module tb_acc;

// acc Parameters
parameter PERIOD  = 10;


// acc Inputs
reg   clk                                  = 0 ;
reg   wacc                                 = 0 ;
reg   [7:0]  in_data                       = 0 ;

// acc Outputs
wire  [7:0]  out_data                      ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

acc  u_acc (
    .clk                     ( clk             ),
    .wacc                    ( wacc            ),
    .in_data                 ( in_data   [7:0] ),

    .out_data                ( out_data  [7:0] )
);

initial begin
    wacc = 1;
    in_data = 159;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("acc.vcd");
    $dumpvars(0, tb_acc);
end

endmodule