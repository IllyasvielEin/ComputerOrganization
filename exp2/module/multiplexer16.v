module Multiplexer16(control, in0, in1, in2, out);
    input [1:0] control;
    input [15:0] in0, in1, in2;
    output reg [15:0] out;

    initial begin
        out = 16'hff;
    end

    always@* begin
        case(control)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = 16'hff;
        endcase
    end
endmodule