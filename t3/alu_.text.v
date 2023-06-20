`include "./alu.v"
module tb_alu;

// alu Parameters
parameter PERIOD  = 10;


// alu Inputs
reg   [15:0]  A                            = 0 ;
reg   [15:0]  B                            = 0 ;
reg   [2:0]  op                            = 0 ;

// alu Outputs
wire  [15:0]  out                          ;

alu  u_alu (
    .A                       ( A    [15:0] ),
    .B                       ( B    [15:0] ),
    .op                      ( op   [2:0]  ),

    .out                     ( out  [15:0] )
);

initial begin
    A = 20;
    B = 21;
    op = 3'b000;
    #PERIOD;
    A = 21;
    B = 51;
    op = 3'b001;
    #PERIOD;
    A = 59;
    B = 20;
    op = 3'b010;
    #PERIOD;
    A = 21;
    B = 21;
    op = 3'b011;
    #PERIOD;
    A = 51;
    B = 59;
    op = 3'b100;
    #PERIOD;
    A = 20;
    B = 21;
    op = 3'b101;
    #PERIOD;
    A = 51;
    B = 59;
    op = 3'b110;
    #PERIOD;
    $finish;
end


initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);
end

endmodule