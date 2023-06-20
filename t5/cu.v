`include "./define.v"

module cu (
    input [7:0] op,
    input acc,
    output reg wmem,
    output reg wacc,
    output reg[3:0] alu_op,
    output reg[2:0] pc
);

always @(op) begin
    case (op)
        {`cu_add, 5'b00000}: begin
            wacc = 1;
            wmem = 0;
            pc = `pc_mode_normal;
            alu_op = `alu_add;
        end
        {`cu_sta, 5'b00000}: begin
            wacc = 1;
            wmem = 1;
            pc = `pc_mode_normal;
        end
        {`cu_lda, 5'b00000}: begin
            wacc = 1;
            wmem = 0;
            pc = `pc_mode_normal;
        end
        {`cu_jmp, 5'b00000}: begin
            wacc = 0;
            wmem = 0;
            pc = `pc_mode_jump;
        end
        {`cu_ban, 5'b00000}: begin
            wacc = 0;
            wmem = 0;
            if (acc) begin
                pc = `pc_mode_jump;
            end
            else begin
                pc = `pc_mode_normal;
            end
        end
        {`cu_long_begin, `cu_cla}: begin
            wacc = 1;
            wmem = 0;
            alu_op = `alu_cla;
            pc = `pc_mode_normal;
        end
        {`cu_long_begin, `cu_com}: begin
            wacc = 1;
            wmem = 0;
            pc = `pc_mode_normal;
            alu_op = `alu_com;
        end
        {`cu_long_begin, `cu_shr}: begin
            wacc = 1;
            wmem = 0;
            pc = `pc_mode_normal;
            alu_op = `alu_shr;
        end
        {`cu_long_begin, `cu_csl}: begin
            wacc = 1;
            wmem = 0;
            pc = `pc_mode_normal;
            alu_op = `alu_csl;
        end
        {`cu_long_begin, `cu_stop}: begin
            wacc = 0;
            wmem = 0;
            pc = `pc_mode_stop;
            alu_op = `alu_cla;
        end
    endcase
end

endmodule