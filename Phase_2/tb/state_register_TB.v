`timescale 1ns/1ps 

module state_register_tb;

reg reset;
reg clk;
reg [4:0]next_state;
wire [4:0]current_state;

localparam S0  = 5'b00000;
localparam S1  = 5'b00001;
localparam S2  = 5'b00010;
localparam S3  = 5'b00011;
localparam S4  = 5'b00100;
localparam S5  = 5'b00101;
localparam S6  = 5'b00110;
localparam S7  = 5'b00111;
localparam S8  = 5'b01000;
localparam S9  = 5'b01001;
localparam S10 = 5'b01010;
localparam S11 = 5'b01011;
localparam S12 = 5'b01100;
localparam S13 = 5'b01101;
localparam S14 = 5'b01110;
localparam S15 = 5'b01111;
localparam S16 = 5'b10000;
localparam S17 = 5'b10001;
localparam S18 = 5'b10010;
localparam S19 = 5'b10011;

state_register dut(
    .clk(clk),
    .reset(reset),
    .next_state(next_state),
    .current_state(current_state)
);

initial begin
    clk = 1'b0;
end 
always #5 clk = ~clk;
initial begin
    $dumpfile("phase_2/wave/state_register.vcd");
    $dumpvars( 0 , state_register_tb);
end 

initial begin 
    @(posedge clk);
    //case 1 
    reset = 1'b1;
    next_state = S10;
    @(posedge clk);
    if(current_state == S0)
        $display("case 1 pass ");
    else 
        $display("case 1 failed");
    @(negedge clk);
    reset = 1'b0;
    #1;
    
    //case 2 
    @(posedge clk);
    next_state = S6;
    //@(posedge clk);
    #1;
    if (current_state == S6)
        $display("case 2 pass");
    else 
        $display("case 2 failed");

    // case 3 : check for hold 
    @(posedge clk);
    next_state = S15;
    #3;
    if(current_state == S15)
        $display("3A pass");
    else 
        $display("3A failed");
    
    next_state = S5;
    @(posedge clk);
    #1;
    if(current_state == S5)
        $display("3 pass");
    else 
        $display("3 failed");
    
    //case 4 
    @(posedge clk);
    next_state = S16;
    //@(posedge clk);
    #1;
    if (current_state == S16)
        $display("case 4 pass");
    else 
        $display("case 4 failed");
    repeat(3) @(posedge clk);
    $finish;
end 
endmodule