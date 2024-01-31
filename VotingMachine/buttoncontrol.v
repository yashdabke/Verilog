`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: buttoncontrol

module buttoncontrol(
    input clock,
    input reset,
    input button,
    output reg valid_vote
);

// Counter to keep track of time
reg [30:0] counter;

// Counter incrementation logic
always @(posedge clock)
begin
    if (reset)
        counter <= 0;
    else
    begin
        // Increment counter if button is pressed and counter is less than 100,000,001
        if (button & (counter < 100000001))
            counter <= counter + 1;
        // Reset counter if button is not pressed
        else if (!button)
            counter <= 0;
    end
end

// Valid vote logic
always @(posedge clock)
begin
    if (reset)
        valid_vote <= 1'b0;
    else
    begin
        // Set valid_vote to 1 when counter reaches 100,000,000
        if (counter == 100000000)
            valid_vote <= 1'b1;
        // Reset valid_vote to 0 otherwise
        else
            valid_vote <= 1'b0;
    end
end

endmodule
