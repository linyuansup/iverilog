`include "./define.v"

module imem (
    input wire [7:0] ad,
    output reg [7:0] out
);

reg [7:0] data[0:9];

initial begin
    out = 0;
    data[0] = {`cu_lda, 5'b00001};
    data[1] = {`cu_long_begin, `cu_csl};
    data[2] = {`cu_long_begin, `cu_shr};
    data[3] = {`cu_add, 5'b00010};
    data[4] = {`cu_sta, 5'b00001};
    data[5] = {`cu_ban, 5'b00001};
    data[6] = {`cu_jmp, 5'b01000};
    data[7] = {`cu_long_begin, `cu_cla};
    data[8] = {`cu_long_begin, `cu_stop};
end

always @(ad) begin
    out = data[ad];
end

endmodule