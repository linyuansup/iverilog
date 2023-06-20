module dmem (
    input clk,
    input wm,
    input [7:0] in,
    input [7:0] ad,
    output [7:0] out
);

reg [7:0] mem [0:31];

assign out = mem[ad];

initial begin
    mem[0] = 1;
    mem[1] = 5;
    mem[2] = 9;
end

always @(negedge clk) begin
    if (wm) begin
        mem[ad] = in;
    end
end

endmodule