`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: modecontrol

module modecontrol(
    input clock,
    input reset,
    input mode,
    input valid_vote_casted,
    input [7:0] candidate1_vote,
    input [7:0] candidate2_vote,
    input [7:0] candidate3_vote,
    input [7:0] candidate4_vote,
    input candidate1_button_press,
    input candidate2_button_press,
    input candidate3_button_press,
    input candidate4_button_press,
    output reg [7:0] leds
);

// Counter to keep track of time
reg [30:0] counter;

// Counter incrementation and reset logic
always @(posedge clock)
begin
    if (reset)
        counter <= 0;   // Whenever reset is pressed, counter starts from 0
    else if (valid_vote_casted) // If a valid vote is casted, increment the counter
        counter <= counter + 1;
    else if (counter != 0 && counter < 100000000) // If counter is not 0, increment it till 100000000
        counter <= counter + 1;
    else // Once counter becomes 100000000, reset it to zero
        counter <= 0;
end

// LED control logic
always @(posedge clock)
begin
    if (reset)
        leds <= 8'b00000000;
    else
    begin
        if (mode == 0 && counter > 0) // Voting mode, turn on all LEDs
            leds <= 8'b11111111;
        else if (mode == 0) // Voting mode, turn off all LEDs
            leds <= 8'b00000000;
        else if (mode == 1) // Result mode
        begin
            // Display the votes based on the button pressed
            if (candidate1_button_press)
                leds <= candidate1_vote;
            else if (candidate2_button_press)
                leds <= candidate2_vote;
            else if (candidate3_button_press)
                leds <= candidate3_vote;
            else if (candidate4_button_press)
                leds <= candidate4_vote;
        end
    end
end

endmodule
