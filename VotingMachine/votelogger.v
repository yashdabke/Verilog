`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: votelogger

module votelogger(
    input clock,
    input reset,
    input mode,
    input cand1_vote_valid,
    input cand2_vote_valid,
    input cand3_vote_valid,
    input cand4_vote_valid,
    output reg [7:0] cand1_vote_recvd,
    output reg [7:0] cand2_vote_recvd,
    output reg [7:0] cand3_vote_recvd,
    output reg [7:0] cand4_vote_recvd
);

// Register to store received votes for each candidate
always @(posedge clock)
begin
    if (reset)
    begin
        cand1_vote_recvd <= 8'b00000000;
        cand2_vote_recvd <= 8'b00000000;
        cand3_vote_recvd <= 8'b00000000;
        cand4_vote_recvd <= 8'b00000000;
    end
    else
    begin
        // Increment received votes for each candidate if the vote is valid and the system is in voting mode
        if (cand1_vote_valid & (mode == 0))
            cand1_vote_recvd <= cand1_vote_recvd + 1;
        else if (cand2_vote_valid & (mode == 0))
            cand2_vote_recvd <= cand2_vote_recvd + 1;
        else if (cand3_vote_valid & (mode == 0))
            cand3_vote_recvd <= cand3_vote_recvd + 1;
        else if (cand4_vote_valid & (mode == 0))
            cand4_vote_recvd <= cand4_vote_recvd + 1;
    end
end

endmodule
