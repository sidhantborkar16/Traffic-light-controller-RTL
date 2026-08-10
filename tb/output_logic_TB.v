`timescale 1ns/1ps 

module output_logic_tb ;

reg [3:0] current_state;
wire NS_Green;
wire NS_yellow;
wire NS_red;
wire EW_Green;
wire EW_yellow;
wire EW_red;
wire walk_NS;
wire dont_walk_NS;
wire walk_EW;
wire dont_walk_EW; 

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

output_logic dut( 
    .current_state(current_state),
 
    .NS_Green(NS_Green),
    .NS_yellow(NS_yellow),
    .NS_red(NS_red),
    .EW_Green(EW_Green),
    .EW_yellow(EW_yellow),
    .EW_red(EW_red),
    .walk_NS(walk_NS),
    .dont_walk_NS(dont_walk_NS),
    .walk_EW(walk_EW),
    .dont_walk_EW(dont_walk_EW)
);

initial begin
    $dumpfile("wave/output_logic.vcd");
    $dumpvars( 0 , output_logic_tb);
    //Case 1 
    current_state = S0 ;
    #10;

    if (NS_Green == 1'b1 && NS_yellow == 1'b0 && NS_red == 1'b0 && EW_Green == 1'b0 && EW_yellow == 1'b0 && EW_red == 1'b1 && walk_NS == 1'b0 && dont_walk_NS == 1'b1 && walk_EW == 1'b0 && dont_walk_EW == 1'b1)
        $display ("case 1 :  Pass");
    else
        $display("Case 1 : failed"); 

    //case 2 
    current_state = S1;
    #10;

    if (NS_Green == 1'b0 &&
        NS_yellow == 1'b1 &&
        NS_red == 1'b0 &&
        EW_Green == 1'b0 &&
        EW_yellow == 1'b0 &&
        EW_red == 1'b1 &&
        walk_NS == 1'b0 && 
        dont_walk_NS == 1'b1 &&
        walk_EW == 1'b0  &&
        dont_walk_EW == 1'b1) begin
            $display ("case 2 :  Pass");
    end 
    else
        $display("Case 2 : failed");
     
     //case 3
     current_state = S2;
     #10;

    if(NS_Green == 1'b0 &&
        NS_yellow == 1'b0 &&
        NS_red == 1'b1 &&
        EW_Green == 1'b0 &&
        EW_yellow == 1'b0 &&
        EW_red == 1'b1 &&
        walk_NS == 1'b0 &&
        dont_walk_NS == 1'b1 &&
        walk_EW == 1'b0 &&
        dont_walk_EW == 1'b1)
            $display ("case 3 :  Pass");
    else
        $display("Case 3 : failed");
    
    //case 4 
    current_state = S3;
    #10;
    if(NS_Green == 1'b0 &&
        NS_yellow == 1'b0 &&
        NS_red == 1'b1 &&
        EW_Green == 1'b0 &&
        EW_yellow == 1'b0 &&
        EW_red == 1'b1 &&
        walk_NS == 1'b1 &&
        dont_walk_NS == 1'b0 &&
        walk_EW == 1'b0 &&
        dont_walk_EW == 1'b1)
            $display ("case 4 :  Pass");
    else
        $display("Case 4 : failed");
    
    //case 5
    current_state = S4 ;
    #10;

    if (NS_Green == 1'b1 && NS_yellow == 1'b0 && NS_red == 1'b0 && EW_Green == 1'b0 && EW_yellow == 1'b0 && EW_red == 1'b1 && walk_NS == 1'b0 && dont_walk_NS == 1'b1 && walk_EW == 1'b0 && dont_walk_EW == 1'b1)
        $display ("case 5 :  Pass");
    else
        $display("Case 5 : failed");
    
    //case 6 
    current_state = S5;
    #10;
    if(NS_Green == 1'b0 &&
        NS_yellow == 1'b0 &&
        NS_red == 1'b1 &&
        EW_Green == 1'b1 &&
        EW_yellow == 1'b0 &&
        EW_red == 1'b0 &&
        walk_NS == 1'b0 &&
        dont_walk_NS == 1'b1 &&
        walk_EW == 1'b0 &&
        dont_walk_EW == 1'b1)
            $display ("case 6 :  Pass");
    else
        $display("Case 6 : failed");

    //case 7 
    current_state = S6;
    #10;
    if(NS_Green == 1'b0 &&
        NS_yellow == 1'b0 &&
        NS_red == 1'b1 &&
        EW_Green == 1'b0 &&
        EW_yellow == 1'b1 &&
        EW_red == 1'b0 &&
        walk_NS == 1'b0 &&
        dont_walk_NS == 1'b1 &&
        walk_EW == 1'b0 &&
        dont_walk_EW == 1'b1)
            $display ("case 7 :  Pass");
    else
        $display("Case 7 : failed");
    
    //case 8
     current_state = S7;
     #10;

    if(NS_Green == 1'b0 &&
        NS_yellow == 1'b0 &&
        NS_red == 1'b1 &&
        EW_Green == 1'b0 &&
        EW_yellow == 1'b0 &&
        EW_red == 1'b1 &&
        walk_NS == 1'b0 &&
        dont_walk_NS == 1'b1 &&
        walk_EW == 1'b0 &&
        dont_walk_EW == 1'b1)
            $display ("case 8 :  Pass");
    else
        $display("Case 8 : failed");
    
    //case 9
     current_state = S8;
     #10;

    if (NS_Green == 1'b0 &&
        NS_yellow == 1'b0 &&
        NS_red == 1'b1 &&
        EW_Green == 1'b0 &&
        EW_yellow == 1'b0 &&
        EW_red == 1'b1 &&
        walk_NS == 1'b0 &&
        dont_walk_NS == 1'b1 &&
        walk_EW == 1'b1 &&
        dont_walk_EW == 1'b0)
            $display ("case 9 :  Pass");
    else
        $display("Case 9 : failed");

    //case 10
    current_state = S9;
    #10;
    if(NS_Green == 1'b0 &&
        NS_yellow == 1'b0 &&
        NS_red == 1'b1 &&
        EW_Green == 1'b1 &&
        EW_yellow == 1'b0 &&
        EW_red == 1'b0 &&
        walk_NS == 1'b0 &&
        dont_walk_NS == 1'b1 &&
        walk_EW == 1'b0 &&
        dont_walk_EW == 1'b1)
            $display ("case 10 :  Pass");
    else
        $display("Case 10 : failed");
        
end 
endmodule