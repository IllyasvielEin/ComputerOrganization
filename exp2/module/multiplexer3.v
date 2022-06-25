module Multiplexer3(control,in1,in0,out);
    input control;
    input[2:0] in1, in0;
    output[2:0] out;
    
    assign out = control? in1 : in0;
endmodule