
//This splits the onboard 50 MHz clock down to a desired frequency

module ClockDivider(
    input CLOCK_50,
    input [31:0] blink_frequency, // Desired blinking frequency
    output [9:0] LEDR,
    output reg clk_out
);

reg [31:0] counter; // 32-bit register that counts the clock pulses
reg divider_enable;

always @(posedge CLOCK_50) begin
    if (counter == blink_frequency / 2 - 1) begin
        counter <= 0;
        divider_enable <= ~divider_enable; // Toggle the divider enable signal
    end else begin
        counter <= counter + 1;
    end
end

assign LEDR[0] = clk_out;

always @(posedge CLOCK_50) begin
    if (divider_enable) begin
        clk_out <= ~clk_out; // Toggle the clock signal when enabled
    end
end

endmodule




