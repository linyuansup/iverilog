`include "define.v"

module pc (
    input clk,
    input reset,
    input [2:0] mode,
    input [7:0] offset,
    output reg [7:0] pc_out
);

always @(posedge clk) begin
    if (reset)
        pc_out = 0;
    else if (mode == `pc_mode_add)
        pc_out = pc_out + offset;
    else if (mode == `pc_mode_jump)
        pc_out = offset;
    else if (mode == `pc_mode_normal)
        pc_out = pc_out + 1;
end

endmodule