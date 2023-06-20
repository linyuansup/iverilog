module register_file(
  input clk,
  input [3:0] raddr1,
  input [3:0] raddr2,
  input [3:0] waddr,
  input [15:0] wdata,
  input wen,
  output reg [15:0] rdata1,
  output reg [15:0] rdata2
);

  reg [15:0] registers [0:7];

  always @(*) begin
    rdata1 = registers[raddr1];
    rdata2 = registers[raddr2];
  end

  always @(posedge clk) begin
    if (wen) begin
      registers[waddr] <= wdata;
    end
  end

endmodule