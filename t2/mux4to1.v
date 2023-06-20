module mux4to1 (
    input wire [3:0]a,
    input wire [3:0]b,
    input wire [3:0]c,
    input wire [3:0]d,
    input wire [1:0]sel,
    output reg [3:0]y
    );
    always @(sel or a or b or c or d) begin
        if (sel==2'b00) y=a;
        else if (sel==2'b01) y=b;
        else if (sel==2'b10) y=c;
        else y=d;
    end
endmodule