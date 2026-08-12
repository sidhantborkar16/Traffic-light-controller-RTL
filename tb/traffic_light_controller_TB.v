`timescale 1ns/1ps

module traffic_light_controller_tb ;

reg clk;
reg reset;
reg emergency_req_NS;
reg emergency_req_EW;
reg ped_req_NS;
reg ped_req_EW;

wire NS_green;
wire NS_yellow;
wire NS_red;

wire EW_green;
wire EW_yellow;
wire EW_red;

wire walk_NS;
wire dont_walk_NS;

wire walk_EW;
wire dont_walk_EW;

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

traffic_light_controller dut(
    .clk(clk),
    .reset(reset),
    .emergency_req_NS(emergency_req_NS),
    .emergency_req_EW(emergency_req_EW),
    .ped_req_NS(ped_req_NS),
    .ped_req_EW(ped_req_EW),

    .NS_green(NS_green),
    .NS_yellow(NS_yellow),
    .NS_red(NS_red),

    .EW_green(EW_green),
    .EW_yellow(EW_yellow),
    .EW_red(EW_red),

    .walk_NS(walk_NS),
    .dont_walk_NS(dont_walk_NS),

    .walk_EW(walk_EW),
    .dont_walk_EW(dont_walk_EW)
);

initial begin 
    clk = 1'b0;
end

always #5 clk = ~ clk;

initial begin 
    $dumpfile("wave/traffic_light_controller.vcd");
    $dumpvars(0, traffic_light_controller_tb);
end 

initial begin
    @(posedge clk);

    //case 1 : when reset = 1  
    reset = 1'b1;
    emergency_req_NS = 1'b0;
    emergency_req_EW = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
    @(posedge clk);
    
    @(negedge clk);
    reset = 1'b0;
    #1;

    //case 2 checking normal condition of the signal
    reset = 1'b0;
    emergency_req_NS = 1'b0;
    emergency_req_EW = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
    repeat(74) @(posedge clk);


   // case 3 : checking pedestrian request

    reset = 1'b0;
    emergency_req_NS = 1'b0;
    emergency_req_EW = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;

    while(dut.current_state != S2) begin
        @(posedge clk);
        #1;
    end
    while(dut.timer_done != 1)begin
        @(posedge clk);
        #1;
    end

    @(negedge clk);
    ped_req_NS = 1'b1;
    #1;
    @(posedge clk);
    #1;
    while(dut.current_state != S7) begin
        @(posedge clk);
        #1;
    end
    while(dut.timer_done != 1) begin
        @(posedge clk);
        #1;
    end

    @(negedge clk);
    ped_req_EW = 1'b1;
    #1;
    @(posedge clk);
    #1;
    if(dut.current_state == S8)
        $display(" case 3 PASS");
    else
        $display(" case 3 FAIL");

    //case 4 : ped_req_EW comes when system is in S1 state it should change state after S7 only

    reset = 1'b0;
    emergency_req_NS = 1'b0;
    emergency_req_EW = 1'b0;
    ped_req_NS = 1'b0;
    ped_req_EW = 1'b0;
 
    while(dut.current_state != S1) begin
        @(posedge clk);
        #1;
    end
    while(dut.timer_done != 1) begin
        @(posedge clk);
        #1;
    end
    @(negedge clk);
    ped_req_EW =1'b1;
    #1;
    @(posedge clk);
    #1;

    if(dut.current_state == S2)
        $display("all good");
    else
        $display("problem after S1");

    while(dut.current_state != S0)begin
        @(posedge clk)
        #1;
    end
    while(dut.timer_done != 1) begin
        @(posedge clk);
        #1;
    end;
    @(negedge clk);
    ped_req_EW = 1'b0;
    #1;
    if(dut.current_state == S0)
        $display("case 4 PASS");
    else
        $display("case 4 FAIL");

    //case 5 : current state is S5 and emergency_req_NS = 1

    while(dut.current_state != S5) begin
        @(posedge clk);
        #1;
    end 
    while(dut.timer_done != 1) begin
        @(posedge clk);
        #1;
    end
    @(negedge clk);
    emergency_req_NS = 1'b1;
    #1;
    while(dut.current_state != S4) begin
        @(posedge clk);
        #1;
    end 
    @(negedge clk);
    emergency_req_NS = 1'b0;
    #1;
    while(dut.current_state != S0) begin
        @(posedge clk);
        #1;
    end;
    while(dut.timer_done != 1) begin
        @(posedge clk);
        #1;
    end 
    if(dut.current_state == S0)
        $display("case 5 pass");
    else
        $display("case 5 failed");
    @(posedge clk);

    //case 6 : current state is S6 and emergency_req_EW = 1

    while(dut.current_state != S6) begin
        @(posedge clk);
        #1;
    end 
    while(dut.timer_done != 1) begin
        @(posedge clk);
        #1;
    end
    @(negedge clk);
    emergency_req_EW = 1'b1;
    #1;
    while(dut.current_state != S9) begin
        @(posedge clk);
        #1;
    end 
    @(negedge clk);
    emergency_req_EW = 1'b0;
    #1;
    while(dut.current_state != S0) begin
        @(posedge clk);
        #1;
    end;
    while(dut.timer_done != 1) begin
        @(posedge clk);
        #1;
    end 
    if(dut.current_state == S0)
        $display("case 6 pass");
    else
        $display("case 6 failed");

    $finish;
end 
endmodule