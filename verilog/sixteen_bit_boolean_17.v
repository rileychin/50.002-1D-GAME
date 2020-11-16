/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module sixteen_bit_boolean_17 (
    input [15:0] a,
    input [15:0] b,
    input [3:0] alufn,
    output reg [15:0] out
  );
  
  
  
  wire [(5'h10+0)-1:0] M_oneBitBool_out;
  reg [(5'h10+0)-1:0] M_oneBitBool_a;
  reg [(5'h10+0)-1:0] M_oneBitBool_b;
  reg [(5'h10+0)*4-1:0] M_oneBitBool_alufn;
  
  genvar GEN_oneBitBool0;
  generate
  for (GEN_oneBitBool0=0;GEN_oneBitBool0<5'h10;GEN_oneBitBool0=GEN_oneBitBool0+1) begin: oneBitBool_gen_0
    boolean_22 oneBitBool (
      .a(M_oneBitBool_a[GEN_oneBitBool0*(1)+(1)-1-:(1)]),
      .b(M_oneBitBool_b[GEN_oneBitBool0*(1)+(1)-1-:(1)]),
      .alufn(M_oneBitBool_alufn[GEN_oneBitBool0*(3'h4)+(3'h4)-1-:(3'h4)]),
      .out(M_oneBitBool_out[GEN_oneBitBool0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  always @* begin
    M_oneBitBool_a = a;
    M_oneBitBool_b = b;
    M_oneBitBool_alufn = {5'h10{{alufn}}};
    out = M_oneBitBool_out;
  end
endmodule
