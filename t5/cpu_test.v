`include "./cpu.v"

`timescale  1ns / 1ps

module tb_cpu;

// cpu Parameters
parameter PERIOD  = 10;


// cpu Inputs
reg   clk                                  = 0 ;
reg   reset                                = 0 ;

// cpu Outputs
wire  [2:0]  pc_mode                       ;
wire  [7:0]  pc_imem                       ;
wire  [7:0]  ir_imem                       ;
wire  [7:0]  ir_cu                         ;
wire  [7:0]  ir_pc_dmem                    ;
wire  [3:0]  cu_alu                        ;
wire  [7:0]  result                        ;
wire  [7:0]  alu_acc                       ;
wire  [7:0]  dmem_alu                      ;
wire  wm                                   ;
wire  wacc                                 ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

cpu  u_cpu (
    .clk                     ( clk               ),
    .reset                   ( reset             ),

    .pc_mode                 ( pc_mode     [2:0] ),
    .pc_imem                 ( pc_imem     [7:0] ),
    .ir_imem                 ( ir_imem     [7:0] ),
    .ir_cu                   ( ir_cu       [7:0] ),
    .ir_pc_dmem              ( ir_pc_dmem  [7:0] ),
    .cu_alu                  ( cu_alu      [3:0] ),
    .result                  ( result      [7:0] ),
    .alu_acc                 ( alu_acc     [7:0] ),
    .dmem_alu                ( dmem_alu    [7:0] ),
    .wm                      ( wm                ),
    .wacc                    ( wacc              )
);

initial begin
    reset = 1;
    #PERIOD;
    reset = 0;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    #PERIOD;
    $finish;
end

initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, tb_cpu);
end

endmodule