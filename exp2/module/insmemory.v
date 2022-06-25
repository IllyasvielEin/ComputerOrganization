module insmemory(Addr, Ins);
    input wire [7:0] Addr;
    output reg [15:0] Ins;
    integer i;
    integer j;
    reg [15:0] unit[255:0];
    initial begin
        for(i = 3; i < 256; i = i + 1) begin
            j = (i-3) % 6;  //0-5
            unit[i][2:0] = j + 2;   //r3 2-7
            unit[i][5:3] = j + 1;   //r2 1-6
            unit[i][8:6] = j;       //r1 0-5
            unit[i][15:9] = 7'b0000001;      //OpCode
        end

        unit[0] = 16'b0000000_000_000_000;
        unit[1] = 16'b0000011_001_111_000;  // [r1] = [r1] + [r7] = 8
        unit[2] = 16'b0000100_000_000011;   // [r0] = [r0] + 3 = 3
        // unit[3] [r2] = [r0] + [r1] = 11
    end
    always@* begin
        Ins = unit[Addr];
    end
endmodule