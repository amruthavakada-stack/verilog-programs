`timescale 1ns/1ps

module binarycounter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the counter
    binarycounter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Generate clock
    always #5 clk = ~clk;

    // Test sequence
    initial
    begin
        clk = 0;
        reset = 1;

        #10;
        reset = 0;

        #100;
        $finish;
    end

    // Display values
    initial
    begin
        $monitor("Time = %0t | Reset = %b | Count = %b",
                 $time, reset, count);
    end

endmodule