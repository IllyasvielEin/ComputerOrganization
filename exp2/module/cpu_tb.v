module cpu_tb;
    reg clk, rst;
    always #1 clk = ~clk;

    initial begin
        clk = 1;
        rst = 1;

        #1 rst = 0;

        #10 $stop;
    end

    cpu uut(
        .clk(clk),
        .rst(rst)
    );
endmodule
