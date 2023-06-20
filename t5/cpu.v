`include "./acc.v"
`include "./alu.v"
`include "./cu.v"
`include "./dmem.v"
`include "./imem.v"
`include "./ir.v"
`include "./pc.v"

module cpu (
    input clk,
    input reset,
    output [2:0] pc_mode,
    output [7:0] pc_imem,
    output [7:0] ir_imem,
    output [7:0] ir_cu,
    output [7:0] ir_pc_dmem,
    output [3:0] cu_alu,
    output [7:0] result,
    output [7:0] alu_acc,
    output [7:0] dmem_alu,
    output wm,
    output wacc
);

pc pc(.clk(clk),
.reset(reset),
.mode(pc_mode),
.offset(ir_pc_dmem),
.pc_out(pc_imem));

imem imem(.ad(pc_imem),
.out(ir_imem));

ir ir(.in(ir_imem),
.op(ir_cu),
.ad(ir_pc_dmem));

cu cu(.op(ir_cu),
.acc(alu_acc[7]),
.wmem(wm),
.wacc(wacc),
.alu_op(cu_alu),
.pc(pc_mode));

alu alu(.op(cu_alu),
.a(alu_acc),
.b(dmem_alu),
.result(result));

acc acc(.clk(clk),
.wacc(wacc),
.in_data(result),
.out_data(alu_acc));

dmem dmem(.ad(ir_pc_dmem),
.wm(wm),
.clk(clk),
.in(result),
.out(dmem_alu));

endmodule