`timescale 1ns/1ps 

module timer(
    //INPUT
    input clk,
    input reset,
    input timer_clear,
    input [4:0]target_count,
    
    //OUTPUT
    output timer_done
);
reg [4:0]count; 

always @(posedge clk) begin
    if (reset) begin
        count <= 5'd0;
    end 
    else if (timer_clear) begin
        count <= 5'd0;
    end 
    else if (count < target_count) begin
        count <= count + 5'd1; 
    end 
    //else begin
    //    count = target_count;
    //end 
end 
assign timer_done = (count >= target_count);
endmodule 