module acc (
    input clk,
    input wacc,
    input [7:0] in_data,
    output [7:0] out_data
);

reg [7:0] acc;
assign out_data = acc;

always @(negedge clk) begin
    if (wacc)
        acc = in_data;
end

endmodule