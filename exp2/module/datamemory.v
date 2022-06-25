module datamemory (
    input wire clk, dataMem_wr,
    input wire [5:0] addr,
    input wire [15:0] data_in,
    output reg [15:0] data_out
);
    integer i;
    reg [15:0] dataMem[6'b111111:0];
    initial begin
        for (i = 1; i < 6'b111111; i = i+1) begin
            dataMem[i] = 0;
        end
    end
    
    always@(*) begin
        if(dataMem_wr == 1)
            dataMem[addr] = data_in;
        else
            data_out = dataMem[addr];
    end

endmodule