`timescale 1ns/1ps

module next_state_tb;

reg [4:0]current_state;
reg timer_done;
reg emergency_req_A;
reg emergency_req_B;
reg emergency_req_C;
reg emergency_req_D;
reg ped_req_A;
reg ped_req_B;
reg ped_req_C;
reg ped_req_D;

wire [4:0]next_state;

next_state dut(
    .current_state(current_state),
    .timer_done(timer_done),
    .emergency_req_A(emergency_req_A),
    .emergency_req_B(emergency_req_B),
    .emergency_req_C(emergency_req_C),
    .emergency_req_D(emergency_req_D),
    .ped_req_A(ped_req_A),
    .ped_req_B(ped_req_B),
    .ped_req_C(ped_req_C),
    .ped_req_D(ped_req_D),

    .next_state(next_state)
);

//state encoding 

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

initial begin
    $dumpfile("phase_2/wave/next_state.vcd");
    $dumpvars( 0 , next_state_tb);
end

initial begin

    //case 1 emergency request at S5 
    current_state = S5;
    timer_done = 1'b0;
    emergency_req_A = 1'b1;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;

    //case check 
    if(next_state == S4)
        $display("case 1 : pass");
    else 
        $display("case 1 : failed");

    //case 2 emergency request at S1 
    current_state = S1;
    timer_done = 1'b0;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b1;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;

    //case check 
    if(next_state == S9)
        $display("case 2 : pass");
    else 
        $display("case 2 : failed");

    //case 3 emergency request at S16 
    current_state = S16;
    timer_done = 1'b0;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b1;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;

    //case check 
    if(next_state == S14)
        $display("case 3 : pass");
    else 
        $display("case 3 : failed");

    //case 4 timer_done = 1 then next state , current state is S1 then next state is S2 
    current_state = S6;
    timer_done = 1'b1;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b1;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;

    //case check 
    if(next_state == S7)
        $display("case 4 : pass");
    else 
        $display("case 4 : failed");


    //case 5 ped_req_C = 1 then next state will be S13 
    current_state = S12;
    timer_done = 1'b1;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b1;
    ped_req_B = 1'b0;
    ped_req_C = 1'b1;
    ped_req_D = 1'b0;
    #10;

    //case check 
    if(next_state == S13)
        $display("case 5 : pass");
    else 
        $display("case 5 : failed");

    //case 6 ped_req_D = 1 then next state will be S13 
    current_state = S17;
    timer_done = 1'b1;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b1;
    ped_req_B = 1'b0;
    ped_req_C = 1'b1;
    ped_req_D = 1'b1;
    #10;

    //case check 
    if(next_state == S18)
        $display("case 6 : pass");
    else 
        $display("case 6 : failed");

    //case 7 ped_req_D = 0 then next state will be S0 
    current_state = S18;
    timer_done = 1'b1;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;

    //case check 
    if(next_state == S0)
        $display("case 7 : pass");
    else 
        $display("case 7 : failed");

    //case 8 ped_req_B = 0 then next state will be S10
    current_state = S8;
    timer_done = 1'b1;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;

    //case check 
    if(next_state == S10)
        $display("case 8 : pass");
    else 
        $display("case 8 : failed");

    //case 9 : check emergency state  
    current_state = S9;
    timer_done = 1'b1;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;
    //case check 
    if(next_state == S0)
        $display("case 9 : pass");
    else 
        $display("case 9 : failed");

    //case 10 : check emergency state  
    current_state = S19;
    timer_done = 1'b1;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;
    //case check 
    if(next_state == S0)
        $display("case 10 : pass");
    else 
        $display("case 10 : failed");

    //-----------------------------------

    //case 11 : current state is S6 and timer_done is 0 so the next state will be S6  
    current_state = S6;
    timer_done = 1'b0;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;
    //case check 
    if(next_state == S6)
        $display("case 11 : pass");
    else 
        $display("case 11 : failed");
    
    //case 12 : current state is S4 emergency state emergency_req_A is 0 and timer_done is also 0  then the next state will be S4  
    current_state = S4;
    timer_done = 1'b0;
    emergency_req_A = 1'b0;
    emergency_req_B = 1'b0;
    emergency_req_C = 1'b0;
    emergency_req_D = 1'b0;
    ped_req_A = 1'b0;
    ped_req_B = 1'b0;
    ped_req_C = 1'b0;
    ped_req_D = 1'b0;
    #10;
    //case check 
    if(next_state == S4)
        $display("case 11 : pass");
    else 
        $display("case 11 : failed");

    $finish; 
end 
endmodule