module mux2to1 (
    input wire [3:0]a,
    input wire [3:0]b,
    input wire sel,
    output reg [3:0]y
    );
    always @(sel or a or b) begin
        if (!sel) y=a;
        else y=b;
    end
endmodule