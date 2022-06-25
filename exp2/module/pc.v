module pc(clk, rst, pc);
    input wire clk, rst;
    output reg [7:0] pc;
    
    always@(posedge clk) begin
        pc = (rst==1)? 8'h0: pc+1;
    end
endmodule