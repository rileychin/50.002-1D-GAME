/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_27 (
    input x,
    input y,
    input cin,
    output reg s,
    output reg cout
  );
  
  
  
  reg i;
  reg j;
  reg k;
  
  always @* begin
    s = x ^ y ^ cin;
    i = x & y;
    j = y & cin;
    k = x & cin;
    cout = i | j | k;
  end
endmodule
