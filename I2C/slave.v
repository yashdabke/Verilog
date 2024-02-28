module slave(
  output reg [7:0] out,
  input sda,
  input scl
);
  // Internal variables
  integer j = 0;
  reg [6:0] temp;
  reg [7:0] add;
  reg rw;
  reg [7:0] register_address;
  reg bitin;
  reg [7:0] storage[0:38];

  // Initialization
  initial
    storage[37] = 16;

  // I2C slave state machine
  always @(posedge scl) begin
    bitin = sda;

    // Shift in bits
    if (j < 8)
      temp = {temp, bitin};

    // Detect read/write bit
    if (j == 8)
      rw = (bitin == 0) ? 0 : 1;

    j = j + 1;

    // Process address bits during read
    if (temp == address && (j > 15 && j < 24) && rw == 1) begin
      add = {add, bitin};
    end

    // Process address bits during write
    if (temp == address && rw == 0 && j > 15 && j != 24 && j < 33) begin
      add = {add, bitin};
    end
    // Extract register address on falling edge of the last bit
    else if (j == 24)
      register_address = add;

    // Store data during write
    if (j == 33 && rw == 0)
      storage[register_address] = add;

    // Output data during read
    out = storage[add];
  end
endmodule
