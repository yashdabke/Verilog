`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Description: SPI Controller Module for FPGA Implementation


module spiControl(
    input  clock, // On-board Zynq clock (100 MHz)
    input  reset,
    input [7:0] data_in,
    input  load_data, // Signal indicates new data for transmission
    output reg done_send, // Signal indicates data has been sent over SPI interface
    output     spi_clock, // 10MHz max
    output reg spi_data
);

    // Internal registers for state and counting
    reg [2:0] counter=0;
    reg [2:0] dataCount;
    reg [7:0] shiftReg;
    reg [1:0] state;
    reg clock_10;
    reg CE;

    // Generate SPI clock based on chip enable (CE)
    assign spi_clock = (CE == 1) ? clock_10 : 1'b1;

    // Counter for clock division
    always @(posedge clock)
    begin
        if(counter != 4)
            counter <= counter + 1;
        else
            counter <= 0;
    end

    // Generate clock_10 with half the frequency of the input clock
    initial
        clock_10 <= 0;

    always @(posedge clock)
    begin
        if(counter == 4)
            clock_10 <= ~clock_10;
    end

    // State definitions for the FSM
    localparam IDLE = 'd0,
               SEND = 'd1,
               DONE = 'd2;

    // FSM for SPI control
    always @(negedge clock_10)
    begin
        if(reset)
        begin
            // Reset the state machine and other variables
            state <= IDLE;
            dataCount <= 0;
            done_send <= 1'b0;
            CE <= 0;
            spi_data <= 1'b1;
        end
        else
        begin
            case(state)
                IDLE:begin
                    // Load data into shift register if load_data signal is asserted
                    if(load_data)
                    begin
                        shiftReg <= data_in;
                        state <= SEND;
                        dataCount <= 0;
                    end
                end
                SEND:begin
                    // Transmit data serially
                    spi_data <= shiftReg[7];
                    shiftReg <= {shiftReg[6:0],1'b0};
                    CE <= 1;
                    if(dataCount != 7)
                        dataCount <= dataCount + 1;
                    else
                    begin
                        state <= DONE;
                    end
                end
                DONE:begin
                    // End of transmission, de-assert CE and reset if load_data is not asserted
                    CE <= 0;
                    done_send <= 1'b1;
                    if(!load_data)
                    begin
                        done_send <= 1'b0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

endmodule
