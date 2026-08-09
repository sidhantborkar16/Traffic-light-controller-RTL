`timescale 1ns/1ps

module next_state_tb;

reg [3:0]current_state;
reg timer_done;
reg emergency_req_NS;
reg emergency_req_EW;
reg ped_req_NS;
reg ped_req_EW;

wire [3:0]next_state;

next_state dut(
    .current_state(current_state),
    .timer_done(timer_done),
    .emergency_req_NS(emergency_req_NS),
    .emergency_req_EW(emergency_req_EW),
    .ped_req_NS(ped_req_NS),
    .ped_req_EW(ped_req_EW),

    .next_state(next_state)
);

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

initial begin
    $dumpfile("wave/next_state.vcd");
    $dumpvars( 0 , next_state_tb);

    //case 1 emergency request at S0 
    current_state = S0;
    timer_done = 1'b0;
    emergency_req_EW = 1'b1;
    emergency_req_NS = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
    #10;
    //case check 
    if(next_state == S9)
        $display("case 1 : pass");
    else 
        $display("case 1 : failed");

    //case 2 emergency request at S0 
    current_state = S0;
    timer_done = 1'b0;
    emergency_req_EW = 1'b0;
    emergency_req_NS = 1'b1;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
    #10;
    //case check 
    if(next_state ==  S4)
        $display("case 2 : pass");
    else 
        $display("case 2 : failed");

    //case 3 timer_done = 1 then next state , current state is S1 then next state is S2 
    current_state = S1;
    timer_done = 1'b1;
    emergency_req_EW = 1'b0;
    emergency_req_NS = 1'b0;
    ped_req_NS = 1'b1;
    ped_req_EW = 1'b0;
    #10;
    //case check 
    if(next_state == S2)
        $display("case 3 : pass");
    else 
        $display("case 3 : failed");

    //case 4 ped_req_NS = 1 then next state will be S3 
    current_state = S2;
    timer_done = 1'b1;
    emergency_req_EW = 1'b0;
    emergency_req_NS = 1'b0;
    ped_req_NS = 1'b1;
    ped_req_EW = 1'b0;
    #10;

    //case check 
    if(next_state == S3)
        $display("case 4 : pass");
    else 
        $display("case 4 : failed");

    //case 5 ped_req_EW = 0 then next state will be S0 
    current_state = S7;
    timer_done = 1'b1;
    emergency_req_EW = 1'b0;
    emergency_req_NS = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
    #10;

    //case check 
    if(next_state == S0)
        $display("case 5 : pass");
    else 
        $display("case 5 : failed");

    //case 6 : check emergency state  
    current_state = S4;
    timer_done = 1'b1;
    emergency_req_EW = 1'b0;
    emergency_req_NS = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
    #10;
    //case check 
    if(next_state == S0)
        $display("case 6 : pass");
    else 
        $display("case 6 : failed");

    //case 7 : current state is S6 and timer_done is 0 so the next state will be S6  
    current_state = S6;
    timer_done = 1'b0;
    emergency_req_EW = 1'b0;
    emergency_req_NS = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
    #10;
    //case check 
    if(next_state == S6)
        $display("case 7 : pass");
    else 
        $display("case 7 : failed");
    
    //case 8 : current state is S9 emergency state emergency_req_EW is 0 and timer_done is also 0  then the next state will be S9  
    current_state = S9;
    timer_done = 1'b0;
    emergency_req_EW = 1'b0;
    emergency_req_NS = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
    #10;
    //case check 
    if(next_state == S9)
        $display("case 8 : pass");
    else 
        $display("case 8 : failed");

    $finish; 
end 
endmodule