module vendingmachine_tb;

reg clk;
reg reset;
reg coin_5;
reg coin_10;

wire dispense;
wire change_5;

// Instantiate vending machine
vendingmachine uut (
    .clk(clk),
    .reset(reset),
    .coin_5(coin_5),
    .coin_10(coin_10),
    .dispense(dispense),
    .change_5(change_5)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test cases
initial begin

    // Initial values
    reset = 1;
    coin_5 = 0;
    coin_10 = 0;

    #10;

    // Release reset
    reset = 0;

    // Test 1: Insert ?5
    coin_5 = 1;
    coin_10 = 0;
    #10;

    coin_5 = 0;
    #10;

    // Test 2: Insert another ?5
    // Total = ?10, dispense product
    coin_5 = 1;
    coin_10 = 0;
    #10;

    coin_5 = 0;
    #10;

    // Test 3: Insert ?10 directly
    coin_10 = 1;
    #10;

    coin_10 = 0;
    #10;

    // Test 4: Insert ?5 followed by ?10
    // Total = ?15, dispense + ?5 change
    coin_5 = 1;
    #10;

    coin_5 = 0;
    #10;

    coin_10 = 1;
    #10;

    coin_10 = 0;
    #10;

    // End simulation
    $finish;

end

endmodule