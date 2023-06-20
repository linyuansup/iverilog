`include "./define.v"

module alu (
    input [3:0] op,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] result
);

    initial begin
        result = 0;
    end

    always @(op) begin
        case (op)
            `alu_cla: begin
                result = 8'b00000000;
            end
            `alu_com: begin
                result = ~a;
            end
            `alu_shr: begin
                result = {a[7], a[7:1]};
            end
            `alu_csl: begin
                result = {a[6:0], a[7]};
            end
            `alu_add: begin
                result = a + b;
            end
            `alu_sta: begin
                result = b;
            end
            `alu_lda: begin
                result = b;
            end
        endcase
    end

endmodule //alu