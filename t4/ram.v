module ram(
    input clk,
    input [9:0] address,
    input [15:0] data_in,
    input rw,
    input reset,
    output reg [15:0] data_out
);

reg [15:0] mem [0:1023];
reg [15:0] i;

always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < 1024; i = i + 1) begin
            mem[i] <= 16'h0000;
        end
    end else if (rw == 0) begin
        mem[address] <= data_in;
    end else begin
        data_out <= mem[address];
    end
end

endmodule