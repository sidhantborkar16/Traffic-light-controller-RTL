`timescale 1ns/1ps

module next_state(
    //input
    input [3:0]current_state,
    input timer_done,
    input emergency_req_NS,
    input emergency_req_EW,
    input ped_req_NS,
    input ped_req_EW,
    //output
    output reg[3:0]next_state
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
        S0 : begin
            if(emergency_req_NS) begin
                next_state = S4;
            end 
            else if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state =  S1;
            end
        end

        S1 : begin
            if(emergency_req_NS) begin
                next_state = S4;
            end 
            else if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state =  S2;
            end
        end 

        S2 : begin
            if(emergency_req_NS) begin
                next_state = S4;
            end 
            else if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else if(ped_req_NS) begin
                next_state =  S3;
            end
            else begin
                next_state = S5;
            end 
        end

        S3 : begin
            if(emergency_req_NS) begin
                next_state = S4;
            end 
            else if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state =  S5;
            end
        end

        S4 : begin
            if(emergency_req_NS) begin
                next_state = current_state;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S0;
            end 
        end 

        S5 : begin
            if(emergency_req_NS) begin
                next_state = S4;
            end 
            else if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state =  S6;
            end
        end

        S6 : begin
            if(emergency_req_NS) begin
                next_state = S4;
            end 
            else if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state =  S7;
            end
        end

        S7 : begin
            if(emergency_req_NS) begin
                next_state = S4;
            end 
            else if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else if(ped_req_EW) begin
                next_state =  S8;
            end
            else begin
                next_state = S0;
            end 
        end 

        S8 : begin
            if(emergency_req_NS) begin
                next_state = S4;
            end 
            else if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end
            else begin
                next_state = S0;
            end 
        end

        S9 : begin
            if(emergency_req_EW) begin
                next_state = S9;
            end
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S0;
            end 
        end 

        default : begin
            next_state = S0;
        end 
    endcase 
end 
endmodule