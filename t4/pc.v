module pc(
    input clk,
    input reset,
    input enable,
    input [7:0] increment,
    output reg [7:0] pc_out
);

always @(posedge clk, posedge reset) begin
    if (reset) begin
        pc_out <= 8'h00;
    end else if (enable) begin
        pc_out <= pc_out + increment;
    end
end

endmodule