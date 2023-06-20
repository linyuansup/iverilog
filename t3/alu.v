module alu (
    input [15:0] A,
    input [15:0] B,
    input [2:0] op,
    output reg [15:0] out
);

    always @(*) begin
        case(op)
            3'b000: out = A & B;
            3'b001: out = A | B;
            3'b010: out = A + B;
            3'b011: out = A - B;
            3'b100: out = {A[14:0], 1'b0};
            3'b101: out = {1'b0, A[15:1]};
            3'b110: out = {A[15], A[15:1]};
            default: out = 16'h0000;
        endcase
    end

endmodule