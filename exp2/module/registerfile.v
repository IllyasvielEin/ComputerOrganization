module registerfile(
    input wire clk, rg_wr,
    input wire [2:0] read_reg1, read_reg2, write_reg,
    input wire [15:0] write_data,
    output wire [15:0] data_out1, data_out2
);
  
    integer i;
    reg [15:0] regfile[7:0];
    initial begin
        for(i = 0; i < 8; i = i + 1) begin
            regfile[i] = i;
        end
    end

    always@(negedge clk) begin
        if(rg_wr == 1)
            regfile[write_reg] = write_data;
    end
    
    assign data_out1 = regfile[read_reg1];
    assign data_out2 = regfile[read_reg2];
endmodule