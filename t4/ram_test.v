`include "./ram.v"

`timescale  1ns / 1ps

module tb_ram;

// ram Parameters
parameter PERIOD  = 10;


// ram Inputs
reg   clk                                  = 0 ;
reg   [9:0]  address                       = 0 ;
reg   [15:0]  data_in                      = 0 ;
reg   rw                                   = 0 ;
reg   reset                                = 0 ;

// ram Outputs
wire  [15:0]  data_out                     ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

ram  u_ram (
    .clk                     ( clk              ),
    .address                 ( address   [9:0]  ),
    .data_in                 ( data_in   [15:0] ),
    .rw                      ( rw               ),
    .reset                   ( reset            ),

    .data_out                ( data_out  [15:0] )
);

initial begin
    reset = 1;
    address = 0;
    data_in = 0;
    rw = 0;
    #PERIOD;
    reset = 0;
    address = 0;
    data_in = 5;
    rw = 0;
    #PERIOD;
    reset = 0;
    address = 1;
    data_in = 9;
    rw = 0;
    #PERIOD;
    reset = 0;
    address = 0;
    data_in = 0;
    rw = 1;
    #PERIOD;
    reset = 0;
    address = 1;
    data_in = 0;
    rw = 1;
    #PERIOD;
    reset = 1;
    address = 0;
    data_in = 0;
    rw = 0;
    #PERIOD;
    reset = 0;
    address = 0;
    data_in = 0;
    rw = 1;
    #PERIOD;
    reset = 0;
    address = 1;
    data_in = 0;
    rw = 1;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0, tb_ram);
end

endmodule