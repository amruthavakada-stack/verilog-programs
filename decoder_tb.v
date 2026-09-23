module decoder_tb;

reg [2:0] d;
reg en;
wire [7:0] y;

// Instantiate decoder
decoder uut (
    .d(d),
    .en(en),
    .y(y)
);

initial begin

    // Disable decoder
    en = 0;
    d = 3'b000;
    #10;

    // Enable decoder
    en = 1;

    d = 3'b000;
    #10;

    d = 3'b001;
    #10;

    d = 3'b010;
    #10;

    d = 3'b011;
    #10;

    d = 3'b100;
    #10;

    d = 3'b101;
    #10;

    d = 3'b110;
    #10;

    d = 3'b111;
    #10;

    // Disable decoder
    en = 0;
    d = 3'b101;
    #10;

    $finish;
end

endmodule