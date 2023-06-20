`include "./ir.v"

`timescale  1ns / 1ps

module tb_ir;

// ir Parameters
parameter PERIOD  = 10;


// ir Inputs
reg   [7:0]  in                            = 0 ;

// ir Outputs
wire  [7:0] op                          ;
wire  [7:0] ad                          ;

ir  u_ir (
    .in                      ( in           [7:0] ),

    .op                      ( op                ),
    .ad                      ( ad                )
);

initial begin
    in = {`cu_lda, 5'b00001};
    #PERIOD
    in = {`cu_long_begin, `cu_csl};
    #PERIOD
    in = {`cu_long_begin, `cu_shr};
    #PERIOD
    in = {`cu_add, 5'b00001};
    #PERIOD
    in = {`cu_sta, 5'b00001};
    #PERIOD
    in = {`cu_long_begin, `cu_com};
    #PERIOD
    in = {`cu_ban, 5'b00001};
    #PERIOD
    in = {`cu_jmp, 5'b01000};
    #PERIOD
    in = {`cu_long_begin, `cu_cla};
    #PERIOD
    in = {`cu_long_begin, `cu_stop};
    #PERIOD
    $finish;
end

initial begin
    $dumpfile("ir.vcd");
    $dumpvars(0, tb_ir);
end

endmodule