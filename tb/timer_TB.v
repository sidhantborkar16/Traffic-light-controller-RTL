`timescale 1ns/1ps
module timer_TB ; 
reg clk;
reg reset;
reg timer_clear;
reg [4:0]target_count;

wire timer_done;

timer dut(
    //INPUT
    .clk(clk),
    .reset(reset),
    .timer_clear(timer_clear),
    .target_count(target_count),
    
    //OUTPUT
    .timer_done(timer_done)
);

initial begin
    clk = 1'b0;
end 

always #5 clk = ~ clk;
    initial begin
        $dumpfile("wave/timer_wave.vcd");
        $dumpvars(0,timer_TB);
    end 

    initial begin
        // case 1
        @(posedge clk); 
        reset = 1'b1 ; timer_clear = 1'b0 ; target_count = 5'd30;
        @(posedge clk);
        reset = 1'b0;
        @(posedge clk);

        // case 2 
        reset = 1'b0 ; timer_clear = 1'b1 ; target_count = 5'd30;
        @(posedge clk);
        timer_clear = 1'b0;
        @(posedge clk);

        // case 3 
        reset = 1'b0 ; timer_clear = 1'b0 ; target_count = 5'd30;
        repeat(30) @(posedge clk);
        timer_clear = 1'b1;
        @(posedge clk);
        timer_clear = 1'b0;
        @(posedge clk);

        // case 4 
        reset = 1'b0 ; timer_clear = 1'b0 ; target_count = 5'd10;
        repeat(10) @(posedge clk);
        timer_clear = 1'b1;
        @(posedge clk);
        timer_clear = 1'b0;
        @(posedge clk);

        // case 5 
        reset = 1'b0; timer_clear = 1'b0; target_count = 5'd5; 
        repeat(10) @(posedge clk); // hold timer_done = 1 for next 5 positive clk edges
        timer_clear = 1'b1;
        @(posedge clk);
        timer_clear = 1'b0;
        @(posedge clk);

        $finish;
    end 
endmodule
