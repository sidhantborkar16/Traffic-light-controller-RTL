`timescale 1ns/1ps

module traffic_light_controller(
    //input 
    input clk,
    input reset,
    input emergency_req_NS,
    input emergency_req_EW,
    input ped_req_NS,
    input ped_req_EW,

    //output
    output NS_green,
    output NS_yellow,
    output NS_red,

    output EW_green,
    output EW_yellow,
    output EW_red,

    output walk_NS,
    output dont_walk_NS,

    output walk_EW,
    output dont_walk_EW
);

//internal connections 

reg [4:0]target_count;

wire timer_clear;
wire timer_done;
wire [3:0]current_state;
wire [3:0]next_state;

//unit 1 

timer u1(
    
    .clk(clk),
    .reset(reset),
    .timer_clear(timer_clear),
    .target_count(target_count),
    
    .timer_done(timer_done)
);

// unit 2 state register 

state_register u2(
    .clk(clk),
    .reset(reset),
    .next_state(next_state),
    
    .current_state(current_state) 
);

//unit 3 next_state 

next_state u3(
    .current_state(current_state),
    .timer_done(timer_done),
    .emergency_req_NS(emergency_req_NS),
    .emergency_req_EW(emergency_req_EW),
    .ped_req_NS(ped_req_NS),
    .ped_req_EW(ped_req_EW),
    
    .next_state(next_state)
);

//unit 4 output logic

output_logic u4(

    .current_state(current_state),
 
    .NS_Green(NS_green),
    .NS_yellow(NS_yellow),
    .NS_red(NS_red),
    .EW_Green(EW_green),
    .EW_yellow(EW_yellow),
    .EW_red(EW_red),
    .walk_NS(walk_NS),
    .dont_walk_NS(dont_walk_NS),
    .walk_EW(walk_EW),
    .dont_walk_EW(dont_walk_EW)
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
    case(current_state)
        S0 : target_count = 5'd30;
        S1 : target_count = 5'd5;
        S2 : target_count = 5'd2;
        S3 : target_count = 5'd8;
        S4 : target_count = 5'd10;   
        S5 : target_count = 5'd30; 
        S6 : target_count = 5'd5;
        S7 : target_count = 5'd2;
        S8 : target_count = 5'd8;
        S9 : target_count = 5'd10;
        default : target_count = 5'd0;
    endcase
end 

assign timer_clear = (current_state != next_state);

endmodule
