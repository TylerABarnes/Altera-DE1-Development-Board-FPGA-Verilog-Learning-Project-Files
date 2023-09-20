
module FOURBITALU (
    input [9:0] SW, // Eight toggle switches for binary codes of 'a' and 'b'
    output reg [7:0] result,
    output [9:0] LEDR, // red LEDs
    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2,
    output [6:0] HEX3
);

assign LEDR = SW; // Use SW for LEDR output

wire [3:0] a = SW[7:4]; // Extract the lower 4 bits for 'a' from SW
wire [3:0] b = SW[3:0]; // Extract the upper 4 bits for 'b' from SW
wire [1:0] op = SW[9:8];

always @ (op, a, b)
    case (op)           //Choosing the operation
        0: result = a + b;
        1: result = a * b;
        2: result = a % b;
        3: result = a & b;
    endcase

// Lookup table for displaying decimal values on HEX displays
reg [6:0] decimal_hex[10:0];
initial begin
    decimal_hex[0] = 7'b0000001; // 0
    decimal_hex[1] = 7'b1111001; // 1
    decimal_hex[2] = 7'b0100100; // 2
    decimal_hex[3] = 7'b0110000; // 3
    decimal_hex[4] = 7'b0011001; // 4
    decimal_hex[5] = 7'b0010010; // 5
    decimal_hex[6] = 7'b0000010; // 6
    decimal_hex[7] = 7'b1111000; // 7
    decimal_hex[8] = 7'b0000000; // 8
    decimal_hex[9] = 7'b0010000; // 9
    decimal_hex[10] = 7'b1111111; // For any other value
end

assign {HEX0} = decimal_hex[result];
assign {HEX1, HEX2, HEX3} = 21'b111_1111_1111_1111_1111;

endmodule

