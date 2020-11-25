/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_8 (
    input clk,
    input rst,
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  reg [15:0] actual_output;
  
  reg [15:0] temp_a;
  
  reg [15:0] temp_b;
  
  wire [16-1:0] M_alu_adder_s;
  wire [1-1:0] M_alu_adder_cout;
  wire [1-1:0] M_alu_adder_z;
  wire [1-1:0] M_alu_adder_n;
  wire [1-1:0] M_alu_adder_v;
  reg [16-1:0] M_alu_adder_x;
  reg [16-1:0] M_alu_adder_y;
  reg [1-1:0] M_alu_adder_cin;
  sixteen_bit_adder_22 alu_adder (
    .x(M_alu_adder_x),
    .y(M_alu_adder_y),
    .cin(M_alu_adder_cin),
    .s(M_alu_adder_s),
    .cout(M_alu_adder_cout),
    .z(M_alu_adder_z),
    .n(M_alu_adder_n),
    .v(M_alu_adder_v)
  );
  
  wire [16-1:0] M_alu_boole_out;
  reg [16-1:0] M_alu_boole_a;
  reg [16-1:0] M_alu_boole_b;
  reg [4-1:0] M_alu_boole_alufn;
  sixteen_bit_boolean_23 alu_boole (
    .a(M_alu_boole_a),
    .b(M_alu_boole_b),
    .alufn(M_alu_boole_alufn),
    .out(M_alu_boole_out)
  );
  
  wire [1-1:0] M_alu_cmp_out;
  reg [1-1:0] M_alu_cmp_z;
  reg [1-1:0] M_alu_cmp_n;
  reg [1-1:0] M_alu_cmp_v;
  reg [2-1:0] M_alu_cmp_alufn;
  comparator_24 alu_cmp (
    .z(M_alu_cmp_z),
    .n(M_alu_cmp_n),
    .v(M_alu_cmp_v),
    .alufn(M_alu_cmp_alufn),
    .out(M_alu_cmp_out)
  );
  
  wire [16-1:0] M_alu_shift_s;
  reg [6-1:0] M_alu_shift_alufn;
  reg [16-1:0] M_alu_shift_a;
  reg [16-1:0] M_alu_shift_b;
  shifter_25 alu_shift (
    .alufn(M_alu_shift_alufn),
    .a(M_alu_shift_a),
    .b(M_alu_shift_b),
    .s(M_alu_shift_s)
  );
  
  wire [16-1:0] M_alu_mul_out;
  reg [16-1:0] M_alu_mul_a;
  reg [16-1:0] M_alu_mul_b;
  multiplier_26 alu_mul (
    .a(M_alu_mul_a),
    .b(M_alu_mul_b),
    .out(M_alu_mul_out)
  );
  
  
  always @* begin
    M_alu_adder_x = 1'h0;
    M_alu_adder_y = 1'h0;
    M_alu_adder_cin = 1'h0;
    M_alu_boole_a = 1'h0;
    M_alu_boole_b = 1'h0;
    M_alu_boole_alufn = 1'h0;
    M_alu_cmp_v = 1'h0;
    M_alu_cmp_z = 1'h0;
    M_alu_cmp_n = 1'h0;
    M_alu_cmp_alufn = 1'h0;
    M_alu_shift_a = 1'h0;
    M_alu_shift_b = 1'h0;
    M_alu_shift_alufn = 1'h0;
    M_alu_mul_a = 1'h0;
    M_alu_mul_b = 1'h0;
    actual_output = 16'h0000;
    
    case (alufn[4+1-:2])
      2'h0: begin
        if (alufn[1+2-:3] == 3'h0) begin
          M_alu_adder_x = a;
          M_alu_adder_y = b;
          M_alu_adder_cin = alufn[0+0-:1];
          actual_output = M_alu_adder_s;
        end else begin
          if (alufn[0+3-:4] == 4'h2) begin
            M_alu_mul_a = a;
            M_alu_mul_b = b;
            actual_output = M_alu_mul_out;
          end else begin
            if (alufn[0+3-:4] == 4'h3) begin
              temp_a = a ^ b;
              temp_b = a & b;
              actual_output = temp_a <= temp_b;
            end
          end
        end
      end
      2'h1: begin
        if (alufn[0+3-:4] == 4'ha || alufn[0+3-:4] == 4'h6 || alufn[0+3-:4] == 4'he || alufn[0+3-:4] == 4'h8 || alufn[0+3-:4] == 4'h5 || alufn[0+3-:4] == 4'hc || alufn[0+3-:4] == 4'h3 || alufn[0+3-:4] == 4'h7 || alufn[0+3-:4] == 4'h1 || alufn[0+3-:4] == 4'h9) begin
          M_alu_boole_a = a;
          M_alu_boole_b = b;
          M_alu_boole_alufn = alufn[0+3-:4];
          actual_output = M_alu_boole_out;
        end
      end
      2'h2: begin
        if (alufn[2+1-:2] == 2'h0 && alufn[0+1-:2] != 2'h2) begin
          M_alu_shift_a = a;
          M_alu_shift_b = b;
          M_alu_shift_alufn = alufn;
          actual_output = M_alu_shift_s;
        end
      end
      2'h3: begin
        if (alufn[0+3-:4] == 4'h3 || alufn[0+3-:4] == 4'h5 || alufn[0+3-:4] == 4'h7) begin
          M_alu_adder_x = a;
          M_alu_adder_y = b;
          M_alu_adder_cin = alufn[0+0-:1];
          M_alu_cmp_z = M_alu_adder_z;
          M_alu_cmp_v = M_alu_adder_v;
          M_alu_cmp_n = M_alu_adder_n;
          M_alu_cmp_alufn = alufn[1+1-:2];
          actual_output = M_alu_cmp_out;
        end
      end
    endcase
    out = actual_output;
  end
endmodule
