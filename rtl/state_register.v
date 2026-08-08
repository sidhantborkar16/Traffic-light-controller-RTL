`timescale 1ns/1ps 

module state_register(
    input clk,
    input reset,
    input [3:0]next_state,

    //output 
    output reg [3:0]current_state 
);

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

always @(posedge clk) begin
    if(reset) begin
        current_state <= S0;
    end
    else begin
        current_state <= next_state;
    end
end 
endmodule
