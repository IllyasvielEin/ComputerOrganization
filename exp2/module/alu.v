module alu(
    input wire [15:0] in1, in2, imm,
    input wire [2:0] alu_op,
    input wire immCalc,
    output reg [15:0] Z
);
    wire [15:0] in2tmp;
    assign in2tmp = immCalc? imm: in2;

    initial begin
        Z = 16'hff;
    end
    always@* begin
        case(alu_op)
            3'b000: Z = in1 + in2tmp;
            3'b001: Z = in1 - in2tmp;
            3'b010: Z = in1 * in2tmp;
            3'b011: Z = in1 / in2tmp;
            3'b100: Z = in1 << in2tmp;
            3'b101: Z = in1 >> in2tmp;
            default: Z = 16'hff;
        endcase
    end
endmodule