`include "./reg.v"

`timescale  1ns / 1ps

module tb_reg;

// register_file Parameters
parameter PERIOD  = 10;


// register_file Inputs
reg   clk                                  = 0 ;
reg   [3:0]  raddr1                        = 0 ;
reg   [3:0]  raddr2                        = 0 ;
reg   [3:0]  waddr                         = 0 ;
reg   [15:0]  wdata                        = 0 ;
reg   wen                                  = 0 ;

// register_file Outputs
wire  [15:0]  rdata1                       ;
wire  [15:0]  rdata2                       ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

register_file  u_register_file (
    .clk                     ( clk            ),
    .raddr1                  ( raddr1  [3:0]  ),
    .raddr2                  ( raddr2  [3:0]  ),
    .waddr                   ( waddr   [3:0]  ),
    .wdata                   ( wdata   [15:0] ),
    .wen                     ( wen            ),

    .rdata1                  ( rdata1  [15:0] ),
    .rdata2                  ( rdata2  [15:0] )
);

initial begin
    waddr = 4;
    wdata = 16'h2021;
    wen = 1;
    #PERIOD;
    waddr = 5;
    wdata = 16'h5159;
    wen = 1;
    #PERIOD;
    wen = 0;
    raddr1 = 4;
    raddr2 = 5;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("reg.vcd");
    $dumpvars(0, tb_reg);
end

endmodule