`timescale 1ns/1ps 

module output_logic(
    //Input 
    input [3:0]current_state,
    //Output 
    output reg NS_Green,
    output reg NS_yellow,
    output reg NS_red,
    output reg EW_Green,
    output reg EW_yellow,
    output reg EW_red,
    output reg walk_NS,
    output reg dont_walk_NS,
    output reg walk_EW,
    output reg dont_walk_EW

);

//state encoding 

localparam S0 = 4'b0000; // NS_Green
localparam S1 = 4'b0001; // NS_yellow 
localparam S2 = 4'b0010; // All_red_NS
localparam S3 = 4'b0011; // walk_NS
localparam S4 = 4'b0100; //Emergency_NS
localparam S5 = 4'b0101; //EW_Green
localparam S6 = 4'b0110; //EW_yellow
localparam S7 = 4'b0111; //All_red_EW
localparam S8 = 4'b1000; //walk_EW
localparam S9 = 4'b1001; //Emergency_EW

always @(*) begin
    NS_Green = 1'b0;
    NS_yellow = 1'b0;
    NS_red = 1'b0;
    EW_Green = 1'b0;
    EW_yellow = 1'b0;
    EW_red = 1'b0;
    walk_NS = 1'b0;
    dont_walk_NS = 1'b0;
    walk_EW = 1'b0;
    dont_walk_EW = 1'b0;

    case(current_state)
        S0 : begin
            NS_Green = 1'b1;
            NS_yellow = 1'b0;
            NS_red = 1'b0;
            EW_Green = 1'b0;
            EW_yellow = 1'b0;
            EW_red = 1'b1;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        S1 : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b1;
            NS_red = 1'b0;
            EW_Green = 1'b0;
            EW_yellow = 1'b0;
            EW_red = 1'b1;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        S2 : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b0;
            NS_red = 1'b1;
            EW_Green = 1'b0;
            EW_yellow = 1'b0;
            EW_red = 1'b1;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        S3 : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b0;
            NS_red = 1'b1;
            EW_Green = 1'b0;
            EW_yellow = 1'b0;
            EW_red = 1'b1;
            walk_NS = 1'b1;
            dont_walk_NS = 1'b0;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        S4 : begin
            NS_Green = 1'b1;
            NS_yellow = 1'b0;
            NS_red = 1'b0;
            EW_Green = 1'b0;
            EW_yellow = 1'b0;
            EW_red = 1'b1;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        S5 : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b0;
            NS_red = 1'b1;
            EW_Green = 1'b1;
            EW_yellow = 1'b0;
            EW_red = 1'b0;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        S6 : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b0;
            NS_red = 1'b1;
            EW_Green = 1'b0;
            EW_yellow = 1'b1;
            EW_red = 1'b0;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        S7 : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b0;
            NS_red = 1'b1;
            EW_Green = 1'b0;
            EW_yellow = 1'b0;
            EW_red = 1'b1;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        S8 : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b0;
            NS_red = 1'b1;
            EW_Green = 1'b0;
            EW_yellow = 1'b0;
            EW_red = 1'b1;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b1;
            dont_walk_EW = 1'b0;
        end

        S9 : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b0;
            NS_red = 1'b1;
            EW_Green = 1'b1;
            EW_yellow = 1'b0;
            EW_red = 1'b0;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b1;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b1;
        end

        default : begin
            NS_Green = 1'b0;
            NS_yellow = 1'b0;
            NS_red = 1'b0;
            EW_Green = 1'b0;
            EW_yellow = 1'b0;
            EW_red = 1'b0;
            walk_NS = 1'b0;
            dont_walk_NS = 1'b0;
            walk_EW = 1'b0;
            dont_walk_EW = 1'b0;
        end 
    endcase
end 
endmodule