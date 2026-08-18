`timescale 1ns/1ps 

module state_register(
    input clk,
    input reset,
    input [4:0]next_state,

    //output 
    output reg [4:0]current_state 
);

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
 

always @(posedge clk) begin
    if(reset) begin
        current_state <= S0;
    end
    else begin
        current_state <= next_state;
    end
end 
endmodule
