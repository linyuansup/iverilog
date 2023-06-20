`include "./define.v"

module ir (
    input [7:0] in,
    output reg[7:0] op,
    output reg[7:0] ad
);

initial begin
    op = 0;
    ad = 0;
end

always @(in) begin
    case (in[7:5])
        `cu_add, `cu_sta, `cu_lda, `cu_jmp, `cu_ban: begin
            op = {in[7:5], 5'b00000};
            ad = {3'b000, in[4:0]};
        end
        `cu_long_begin: begin
            op = in;
            ad = 0;
        end
    endcase
end

endmodule