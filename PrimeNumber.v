
//There are two main ways to solve this problem --> Circuit determines if input is a prime number
//Boolean equation for circuit is: p = (~cb)+(ca)

//a = SW[9]
//b = SW[8]
//c = SW[7]
//p = LEDG[7]

//1 : Using gate implementation
module PrimeNumber(
  input [9:0] SW, // toggle switches
  output [9:0] LEDR, // red LEDs
  output [7:0] LEDG  // green LEDs
);

  assign LEDR = SW;
  
  wire w1, w2, w3;
  not(w1, SW[7]);
  and(w2, w1, SW[8]);
  and(w3, SW[9], SW[7]); // Use SW[9] directly instead of assigning it to 'a'
  or(LEDG[7], w2, w3);
  
endmodule

//2 : Using boolean implementation
/*
module PrimeNumber(
  input [9:0] SW, // toggle switches
  output [9:0] LEDR, // red LEDs
  output [7:0] LEDG  // green LEDs
);

  assign LEDR = SW;
  
  assing LEDG[7] = (SW[7] & SW[9]) | (~SW[7] & SW[8]);
  
endmodule
*/
