`define pc_mode_stop   3'b000
`define pc_mode_normal 3'b001
`define pc_mode_jump   3'b010
`define pc_mode_add    3'b011

`define cu_add 3'b000
`define cu_sta 3'b001
`define cu_lda 3'b010
`define cu_jmp 3'b011
`define cu_ban 3'b100

`define cu_long_begin 3'b101

`define cu_cla  5'b00000
`define cu_com  5'b00001
`define cu_shr  5'b00010
`define cu_csl  5'b00011
`define cu_stop 5'b00100

`define alu_cla 4'b0000
`define alu_com 4'b0001
`define alu_shr 4'b0010
`define alu_csl 4'b0011
`define alu_add 4'b0100
`define alu_sta 4'b0110
`define alu_lda 4'b0111
