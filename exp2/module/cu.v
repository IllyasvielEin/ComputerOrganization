module cu(
    input wire [6:0] ins_op,
    output reg rg_wr, dataMem_wr,
    output reg [2:0] alu_op,
    output reg RegOut,
    output reg [1:0] M2Reg,
    output reg immCalc
);

    initial begin
        {rg_wr, dataMem_wr, alu_op, RegOut, M2Reg, immCalc} = 9'b00000000;
    end

    always@* begin
        case (ins_op)
            7'b0000000: {rg_wr, dataMem_wr, alu_op, RegOut, M2Reg, immCalc} = 9'b0_0_000_0_00_0;
            7'b0000001: {rg_wr, dataMem_wr, alu_op, RegOut, M2Reg, immCalc} = 9'b1_0_000_0_00_0;   //add r1, r2, r3
            7'b0000010: {rg_wr, dataMem_wr, alu_op, RegOut, M2Reg, immCalc} = 9'b0_1_000_0_10_0;   //st r1, addr
            7'b0000011: {rg_wr, dataMem_wr, alu_op, RegOut, M2Reg, immCalc} = 9'b1_0_000_1_00_0;   //add r1, r2
            7'b0000100: {rg_wr, dataMem_wr, alu_op, RegOut, M2Reg, immCalc} = 9'b1_0_000_1_00_1;   //addi r1, imm
            7'b0000101: {rg_wr, dataMem_wr, alu_op, RegOut, M2Reg, immCalc} = 9'b1_0_000_1_01_0;   //ld r1, addr
            default: {rg_wr, dataMem_wr, alu_op, RegOut, M2Reg}    = 9'b0_0_000_0_00_0;
        endcase      
    end

endmodule