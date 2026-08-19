`timescale 1ns/1ps

module next_state(
    //input
    input [4:0]current_state,
    input timer_done,
    input emergency_req_A,
    input emergency_req_B,
    input emergency_req_C,
    input emergency_req_D,
    input ped_req_A,
    input ped_req_B,
    input ped_req_C,
    input ped_req_D,
    //output
    output reg[4:0]next_state
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

always @(*) begin
    case(current_state)
        S0 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S1;
            end 
        end 

        S1 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S2;
            end 
        end

        S2 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else if(ped_req_A) begin
                next_state = S3;
            end 
            else begin
                next_state = S5;
            end 
        end

        S3 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S5;
            end 
        end

        S4 : begin
            if(emergency_req_A) begin
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
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S6;
            end 
        end

        S6 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S7;
            end 
        end

        S7 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else if(ped_req_B) begin
                next_state = S8;
            end 
            else begin
                next_state = S10;
            end 
        end

        S8 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S10;
            end 
        end

        S9 : begin
            if(emergency_req_B) begin
                next_state = current_state;
            end  
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S0;
            end 
        end

        S10 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S11;
            end 
        end 

        S11 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S12;
            end 
        end

        S12 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else if(ped_req_C) begin
                next_state = S13;
            end 
            else begin
                next_state = S15;
            end 
        end

        S13 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S15;
            end 
        end

        S14 : begin
            if(emergency_req_C) begin
                next_state = current_state;
            end  
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S0;
            end 
        end

        S15 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S16;
            end 
        end 

        S16 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S17;
            end 
        end

        S17 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else if(ped_req_D) begin
                next_state = S18;
            end 
            else begin
                next_state = S0;
            end 
        end

        S18 : begin
            if(emergency_req_A) begin
                next_state = S4;
            end 
            else if(emergency_req_B) begin
                next_state = S9;
            end 
            else if(emergency_req_C) begin
                next_state = S14;
            end 
            else if(emergency_req_D) begin
                next_state = S19;
            end 
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S0;
            end 
        end

        S14 : begin
            if(emergency_req_D) begin
                next_state = current_state;
            end  
            else if(timer_done == 1'b0) begin
                next_state = current_state;
            end 
            else begin
                next_state = S0;
            end 
        end
    endcase 
end 
endmodule