`timescale 1ns/1ps 

module state_register_tb;

reg reset;
reg clk;
reg [3:0]next_state;
wire [3:0]current_state;

localparam S0 = 4'b0000;
localparam S1 = 4'b0001;
localparam S2 = 4'b0010;
localparam S3 = 4'b0011;
localparam S4 = 4'b0100;
localparam S5 = 4'b0101;
localparam S6 = 4'b0110;
localparam S7 = 4'b0111;
localparam S8 = 4'b1000;
localparam S9 = 4'b1001;

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
    $dumpfile("wave/state_register.vcd");
    $dumpvars( 0 , state_register_tb);
end 

initial begin 
    @(posedge clk);
    //case 1 
    reset = 1'b1 ; next_state = S7;
    @(posedge clk);
    if (current_state == S0)
        $display("case 1 Pass");
    else
        $display("case 1 fail");

    reset = 1'b0;
    @(posedge clk);

    //case 2
    next_state = S2;
    @(posedge clk);
    #1;
    if (current_state == S2)
        $display("case 2 Pass");
    else
        $display("case 2 fail");

    //case 3 
    next_state = S3;
    @(posedge clk);
    #1;
    if (current_state == S3)
        $display("case 3 Pass");
    else
        $display("case 3 fail");

    //case 4 state change between the +ve edge of clock 
    next_state = S6;
    #3;

    if (current_state == S3)
        $display("case 4A Pass");
    else
        $display("case 4A Fail");

    @(posedge clk);
    #1;
    if (current_state == S6)
        $display("case 4 Pass");
    else
        $display("case 4 Fail");

    $finish;

end 
endmodule