`include "./imem.v"

`timescale  1ns / 1ps

module tb_imem;

// imem Parameters
parameter PERIOD  = 10;


// imem Inputs
reg   [7:0]  ad                            = 0 ;

// imem Outputs
wire  [7:0]  out                           ;

reg   [7:0]  i                             ;

imem  u_imem (
    .ad                      ( ad   [7:0] ),

    .out                     ( out  [7:0] )
);

initial begin
    for (i = 0; i < 9; i = i + 1) begin
        ad = i;
        #PERIOD;
    end
    $finish;
end

initial begin
    $dumpfile("imem.vcd");
    $dumpvars(0, tb_imem);
end

endmodule