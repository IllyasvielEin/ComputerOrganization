module cpu(
    input wire clk, rst
);
    wire [6:0] op; 
    wire [2:0] rs, rt, rd;
    wire [5:0] data_addr;
    wire rg_wr, dataMem_wr, RegOut, immCalc;
    wire [1:0] M2Reg;
    wire [2:0] alu_op, regWrite;
    wire [7:0] addr;
    wire [15:0] z;
    wire [15:0] ins, r1, r2, dataOut, dataWrite, imm;

    pc pc(
        .clk(clk), .rst(rst), .pc(addr)
    );
    
    insmemory insmemory(
        .Addr(addr), .Ins(ins)
    );
    assign op = ins[15:9];
    assign rs = ins[8:6];
    assign rt = ins[5:3];
    assign rd = ins[2:0];
    assign data_addr = ins[5:0];
    assign imm = {10'b0000000000, ins[5:0]};
    
    registerfile registerfile(
        .clk(clk), .rg_wr(rg_wr), 
        .read_reg1(rs), .read_reg2(rt), 
        .write_reg(regWrite), .write_data(dataWrite), 
        .data_out1(r1), .data_out2(r2)
    );

    cu cu(
        .ins_op(op),
        .alu_op(alu_op),
        .rg_wr(rg_wr), .dataMem_wr(dataMem_wr), 
        .RegOut(RegOut), .M2Reg(M2Reg), .immCalc(immCalc)
    );

    datamemory datamemory(
        .clk(clk), .dataMem_wr(dataMem_wr),
        .addr(data_addr),
        .data_in(dataWrite), .data_out(dataOut)
    );

    alu alu(
        .in1(r1), .in2(r2), .imm(imm),
        .immCalc(immCalc),
        .alu_op(alu_op),
        .Z(z)
    );

    Multiplexer3 mul3(
        .control(RegOut), 
        .in0(rd), .in1(rs),  
        .out(regWrite)
    );
    
    Multiplexer16 mul16(
        .control(M2Reg), 
        .in0(z), .in1(dataOut), .in2(r1),  
        .out(dataWrite)
    );
endmodule