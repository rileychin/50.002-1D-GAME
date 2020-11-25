/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module control_unit_9 (
    input clk,
    input rst,
    input red_btn_input,
    input green_btn_input,
    input blue_btn_input,
    input [9:0] rb_data,
    input [9:0] ra_data,
    input slow_clock_in,
    input score_simulate,
    input [9:0] pointer_value,
    output reg [1:0] rand_output,
    output reg [9:0] user_output,
    output reg [5:0] current_state,
    output reg [5:0] alufn,
    output reg [2:0] asel,
    output reg [2:0] bsel,
    output reg [2:0] regfile_write_address,
    output reg [2:0] regfile_read_address_a,
    output reg [2:0] regfile_read_address_b,
    output reg we_regfile,
    output reg wdsel,
    output reg dec_rst,
    output reg dec_score
  );
  
  
  
  localparam IDLE_game_fsm = 6'd0;
  localparam CHECK_RED_game_fsm = 6'd1;
  localparam CHECK_GREEN_game_fsm = 6'd2;
  localparam CHECK_BLUE_game_fsm = 6'd3;
  localparam BRANCH_RED_game_fsm = 6'd4;
  localparam BRANCH_GREEN_game_fsm = 6'd5;
  localparam BRANCH_BLUE_game_fsm = 6'd6;
  localparam CHECK_WHITE_RED_game_fsm = 6'd7;
  localparam CHECK_WHITE_GREEN_game_fsm = 6'd8;
  localparam CHECK_WHITE_BLUE_game_fsm = 6'd9;
  localparam BRANCH_WHITE_RED_game_fsm = 6'd10;
  localparam BRANCH_WHITE_GREEN_game_fsm = 6'd11;
  localparam BRANCH_WHITE_BLUE_game_fsm = 6'd12;
  localparam REMOVE_R0_DATA_game_fsm = 6'd13;
  localparam REMOVE_R1_DATA_game_fsm = 6'd14;
  localparam REMOVE_R2_DATA_game_fsm = 6'd15;
  localparam REMOVE_ALL_R0_DATA_game_fsm = 6'd16;
  localparam REMOVE_ALL_R1_DATA_game_fsm = 6'd17;
  localparam REMOVE_ALL_R2_DATA_game_fsm = 6'd18;
  localparam SUB_POINTER_game_fsm = 6'd19;
  localparam ADD_SCORE_game_fsm = 6'd20;
  localparam BRANCH_CHECK_SCORE_60_game_fsm = 6'd21;
  localparam BRANCH_CHECK_SCORE_30_game_fsm = 6'd22;
  localparam BRANCH_CHECK_SCORE_10_game_fsm = 6'd23;
  localparam BRANCH_CHECK_SCORE_0_game_fsm = 6'd24;
  localparam BRANCH_DIFF_1_game_fsm = 6'd25;
  localparam SET_DIFF_3_game_fsm = 6'd26;
  localparam SET_DIFF_2_game_fsm = 6'd27;
  localparam SET_DIFF_1_game_fsm = 6'd28;
  localparam SET_DIFF_0_game_fsm = 6'd29;
  localparam SHIFT_R0_ONE_game_fsm = 6'd30;
  localparam SHIFT_R1_ONE_game_fsm = 6'd31;
  localparam SHIFT_R2_ONE_game_fsm = 6'd32;
  localparam GENERATE_RAND_game_fsm = 6'd33;
  localparam BRANCH_CHECK_RAND_0_game_fsm = 6'd34;
  localparam BRANCH_CHECK_RAND_1_game_fsm = 6'd35;
  localparam BRANCH_CHECK_RAND_2_game_fsm = 6'd36;
  localparam BRANCH_CHECK_RAND_3_game_fsm = 6'd37;
  localparam ADD_ONE_RED_game_fsm = 6'd38;
  localparam ADD_ONE_GREEN_game_fsm = 6'd39;
  localparam ADD_ONE_BLUE_game_fsm = 6'd40;
  localparam ADD_ONE_ALL_RED_game_fsm = 6'd41;
  localparam ADD_ONE_ALL_GREEN_game_fsm = 6'd42;
  localparam ADD_ONE_ALL_BLUE_game_fsm = 6'd43;
  localparam ADD_POINTER_game_fsm = 6'd44;
  localparam CHECK_POINTER_game_fsm = 6'd45;
  localparam BRANCH_CHECK_POINTER_game_fsm = 6'd46;
  localparam RESET_REGISTERS_R0_game_fsm = 6'd47;
  localparam RESET_REGISTERS_R1_game_fsm = 6'd48;
  localparam RESET_REGISTERS_R2_game_fsm = 6'd49;
  localparam RESET_REGISTERS_R3_game_fsm = 6'd50;
  localparam RESET_REGISTERS_R4_game_fsm = 6'd51;
  localparam RESET_REGISTERS_R5_game_fsm = 6'd52;
  localparam RESET_REGISTERS_R6_game_fsm = 6'd53;
  localparam RESET_REGISTERS_R7_game_fsm = 6'd54;
  localparam GAMEOVER_game_fsm = 6'd55;
  
  reg [5:0] M_game_fsm_d, M_game_fsm_q = IDLE_game_fsm;
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    
    dec_rst = 1'h0;
    dec_score = 1'h0;
    alufn = 2'h3;
    asel = 1'h1;
    bsel = 1'h0;
    we_regfile = 1'h0;
    regfile_write_address = 7'h6f;
    regfile_read_address_a = 1'h0;
    regfile_read_address_b = 1'h0;
    rand_output = 1'h0;
    user_output = 1'h0;
    wdsel = 1'h1;
    current_state = 1'h0;
    if (rst) begin
      M_game_fsm_d = IDLE_game_fsm;
      dec_rst = 1'h1;
    end else begin
      
      case (M_game_fsm_q)
        IDLE_game_fsm: begin
          we_regfile = 1'h0;
          current_state = 6'h01;
          if (red_btn_input) begin
            M_game_fsm_d = CHECK_RED_game_fsm;
          end else begin
            if (green_btn_input) begin
              M_game_fsm_d = CHECK_GREEN_game_fsm;
            end else begin
              if (blue_btn_input) begin
                M_game_fsm_d = CHECK_BLUE_game_fsm;
              end else begin
                if (slow_clock_in) begin
                  M_game_fsm_d = SHIFT_R0_ONE_game_fsm;
                end else begin
                  if (score_simulate) begin
                    M_game_fsm_d = BRANCH_CHECK_SCORE_60_game_fsm;
                  end else begin
                    M_game_fsm_d = IDLE_game_fsm;
                  end
                end
              end
            end
          end
        end
        CHECK_RED_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_b = 3'h0;
          regfile_write_address = 3'h7;
          asel = 3'h1;
          bsel = 3'h0;
          alufn = 6'h03;
          wdsel = 1'h1;
          current_state = 6'h02;
          M_game_fsm_d = BRANCH_RED_game_fsm;
        end
        CHECK_GREEN_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_b = 3'h1;
          regfile_write_address = 3'h7;
          asel = 3'h1;
          bsel = 3'h0;
          alufn = 6'h03;
          wdsel = 1'h1;
          current_state = 6'h03;
          M_game_fsm_d = BRANCH_GREEN_game_fsm;
        end
        CHECK_BLUE_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_b = 3'h2;
          regfile_write_address = 3'h7;
          asel = 3'h1;
          bsel = 3'h0;
          alufn = 6'h03;
          wdsel = 1'h1;
          current_state = 6'h04;
          M_game_fsm_d = BRANCH_BLUE_game_fsm;
        end
        BRANCH_RED_game_fsm: begin
          we_regfile = 1'h0;
          regfile_read_address_b = 3'h7;
          current_state = 6'h05;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = CHECK_WHITE_GREEN_game_fsm;
          end else begin
            M_game_fsm_d = SHIFT_R0_ONE_game_fsm;
          end
        end
        BRANCH_GREEN_game_fsm: begin
          we_regfile = 1'h0;
          regfile_read_address_b = 3'h7;
          current_state = 6'h06;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = CHECK_WHITE_BLUE_game_fsm;
          end else begin
            M_game_fsm_d = SHIFT_R0_ONE_game_fsm;
          end
        end
        BRANCH_BLUE_game_fsm: begin
          we_regfile = 1'h0;
          regfile_read_address_b = 3'h7;
          current_state = 6'h07;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = CHECK_WHITE_RED_game_fsm;
          end else begin
            M_game_fsm_d = SHIFT_R0_ONE_game_fsm;
          end
        end
        CHECK_WHITE_BLUE_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_b = 3'h2;
          regfile_write_address = 3'h7;
          asel = 3'h1;
          bsel = 3'h0;
          alufn = 6'h03;
          wdsel = 1'h1;
          current_state = 6'h03;
          M_game_fsm_d = BRANCH_WHITE_BLUE_game_fsm;
        end
        CHECK_WHITE_GREEN_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_b = 3'h1;
          regfile_write_address = 3'h7;
          asel = 3'h1;
          bsel = 3'h0;
          alufn = 6'h03;
          wdsel = 1'h1;
          current_state = 6'h03;
          M_game_fsm_d = BRANCH_WHITE_GREEN_game_fsm;
        end
        CHECK_WHITE_RED_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_b = 3'h0;
          regfile_write_address = 3'h7;
          asel = 3'h1;
          bsel = 3'h0;
          alufn = 6'h03;
          wdsel = 1'h1;
          current_state = 6'h02;
          M_game_fsm_d = BRANCH_WHITE_RED_game_fsm;
        end
        BRANCH_WHITE_RED_game_fsm: begin
          we_regfile = 1'h0;
          regfile_read_address_b = 3'h7;
          current_state = 6'h05;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = REMOVE_ALL_R0_DATA_game_fsm;
          end else begin
            M_game_fsm_d = REMOVE_R2_DATA_game_fsm;
          end
        end
        BRANCH_WHITE_GREEN_game_fsm: begin
          we_regfile = 1'h0;
          regfile_read_address_b = 3'h7;
          current_state = 6'h06;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = REMOVE_ALL_R0_DATA_game_fsm;
          end else begin
            M_game_fsm_d = REMOVE_R0_DATA_game_fsm;
          end
        end
        BRANCH_WHITE_BLUE_game_fsm: begin
          we_regfile = 1'h0;
          regfile_read_address_b = 3'h7;
          current_state = 6'h07;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = REMOVE_ALL_R0_DATA_game_fsm;
          end else begin
            M_game_fsm_d = REMOVE_R1_DATA_game_fsm;
          end
        end
        REMOVE_ALL_R0_DATA_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h0;
          regfile_write_address = 3'h0;
          asel = 3'h0;
          bsel = 3'h7;
          alufn = 6'h18;
          current_state = 6'h08;
          M_game_fsm_d = REMOVE_ALL_R1_DATA_game_fsm;
        end
        REMOVE_ALL_R1_DATA_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h1;
          regfile_write_address = 3'h1;
          asel = 3'h0;
          bsel = 3'h7;
          alufn = 6'h18;
          current_state = 6'h09;
          M_game_fsm_d = REMOVE_ALL_R2_DATA_game_fsm;
        end
        REMOVE_ALL_R2_DATA_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h2;
          regfile_write_address = 3'h2;
          asel = 3'h0;
          bsel = 3'h7;
          alufn = 6'h18;
          current_state = 6'h0a;
          M_game_fsm_d = SUB_POINTER_game_fsm;
        end
        REMOVE_R0_DATA_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h0;
          regfile_write_address = 3'h0;
          asel = 3'h0;
          bsel = 3'h7;
          alufn = 6'h18;
          current_state = 6'h08;
          M_game_fsm_d = SUB_POINTER_game_fsm;
        end
        REMOVE_R1_DATA_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h1;
          regfile_write_address = 3'h1;
          asel = 3'h0;
          bsel = 3'h7;
          alufn = 6'h18;
          current_state = 6'h09;
          M_game_fsm_d = SUB_POINTER_game_fsm;
        end
        REMOVE_R2_DATA_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h2;
          regfile_write_address = 3'h2;
          asel = 3'h0;
          bsel = 3'h7;
          alufn = 6'h18;
          current_state = 6'h0a;
          M_game_fsm_d = SUB_POINTER_game_fsm;
        end
        SUB_POINTER_game_fsm: begin
          if (pointer_value == 10'h000) begin
            M_game_fsm_d = ADD_SCORE_game_fsm;
          end else begin
            we_regfile = 1'h1;
            regfile_read_address_a = 3'h4;
            regfile_write_address = 3'h4;
            asel = 3'h0;
            bsel = 3'h3;
            wdsel = 1'h1;
            alufn = 6'h01;
            current_state = 6'h0b;
            M_game_fsm_d = ADD_SCORE_game_fsm;
          end
        end
        ADD_SCORE_game_fsm: begin
          dec_score = 1'h1;
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h3;
          regfile_write_address = 3'h3;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h00;
          current_state = 6'h0c;
          M_game_fsm_d = BRANCH_CHECK_SCORE_60_game_fsm;
        end
        BRANCH_CHECK_SCORE_60_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h7;
          regfile_read_address_b = 3'h3;
          regfile_write_address = 3'h7;
          asel = 3'h5;
          bsel = 3'h0;
          wdsel = 1'h1;
          alufn = 6'h37;
          current_state = 6'h0d;
          M_game_fsm_d = BRANCH_CHECK_SCORE_30_game_fsm;
        end
        BRANCH_CHECK_SCORE_30_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h7;
          regfile_read_address_b = 3'h3;
          regfile_write_address = 3'h7;
          asel = 3'h4;
          bsel = 3'h0;
          wdsel = 1'h1;
          alufn = 6'h37;
          current_state = 6'h0e;
          if (ra_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = SET_DIFF_3_game_fsm;
          end else begin
            M_game_fsm_d = BRANCH_CHECK_SCORE_10_game_fsm;
          end
        end
        BRANCH_CHECK_SCORE_10_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h7;
          regfile_read_address_b = 3'h3;
          regfile_write_address = 3'h7;
          asel = 3'h3;
          bsel = 3'h0;
          wdsel = 1'h1;
          alufn = 6'h37;
          current_state = 6'h0f;
          if (ra_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = SET_DIFF_2_game_fsm;
          end else begin
            M_game_fsm_d = BRANCH_CHECK_SCORE_0_game_fsm;
          end
        end
        BRANCH_CHECK_SCORE_0_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h7;
          regfile_read_address_b = 3'h3;
          regfile_write_address = 3'h7;
          asel = 3'h6;
          bsel = 3'h0;
          wdsel = 1'h1;
          alufn = 6'h37;
          current_state = 6'h0f;
          if (ra_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = SET_DIFF_1_game_fsm;
          end else begin
            M_game_fsm_d = BRANCH_DIFF_1_game_fsm;
          end
        end
        BRANCH_DIFF_1_game_fsm: begin
          we_regfile = 1'h0;
          regfile_read_address_a = 3'h7;
          current_state = 6'h10;
          M_game_fsm_d = SET_DIFF_0_game_fsm;
        end
        SET_DIFF_3_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h6;
          bsel = 3'h5;
          wdsel = 1'h1;
          alufn = 6'h1c;
          current_state = 6'h11;
          M_game_fsm_d = IDLE_game_fsm;
        end
        SET_DIFF_2_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h6;
          bsel = 3'h4;
          wdsel = 1'h1;
          alufn = 6'h1c;
          current_state = 6'h12;
          M_game_fsm_d = IDLE_game_fsm;
        end
        SET_DIFF_1_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h6;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h1c;
          current_state = 6'h13;
          M_game_fsm_d = IDLE_game_fsm;
        end
        SET_DIFF_0_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h6;
          bsel = 3'h2;
          wdsel = 1'h1;
          alufn = 6'h1c;
          current_state = 6'h14;
          M_game_fsm_d = IDLE_game_fsm;
        end
        SHIFT_R0_ONE_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h0;
          regfile_write_address = 3'h0;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h20;
          current_state = 6'h15;
          M_game_fsm_d = SHIFT_R1_ONE_game_fsm;
        end
        SHIFT_R1_ONE_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h1;
          regfile_write_address = 3'h1;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h20;
          current_state = 6'h16;
          M_game_fsm_d = SHIFT_R2_ONE_game_fsm;
        end
        SHIFT_R2_ONE_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h2;
          regfile_write_address = 3'h2;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h20;
          current_state = 6'h17;
          M_game_fsm_d = GENERATE_RAND_game_fsm;
        end
        GENERATE_RAND_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h5;
          bsel = 3'h1;
          wdsel = 1'h1;
          alufn = 6'h1c;
          current_state = 6'h18;
          M_game_fsm_d = BRANCH_CHECK_RAND_0_game_fsm;
        end
        BRANCH_CHECK_RAND_0_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h5;
          regfile_write_address = 3'h7;
          asel = 3'h0;
          bsel = 3'h2;
          alufn = 6'h33;
          current_state = 6'h19;
          wdsel = 1'h1;
          M_game_fsm_d = BRANCH_CHECK_RAND_1_game_fsm;
        end
        BRANCH_CHECK_RAND_1_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h5;
          regfile_read_address_b = 3'h7;
          regfile_write_address = 3'h7;
          asel = 3'h0;
          bsel = 3'h3;
          alufn = 6'h33;
          current_state = 6'h1a;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = ADD_ONE_RED_game_fsm;
          end else begin
            M_game_fsm_d = BRANCH_CHECK_RAND_2_game_fsm;
          end
        end
        BRANCH_CHECK_RAND_2_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h5;
          regfile_read_address_b = 3'h7;
          regfile_write_address = 3'h7;
          asel = 3'h0;
          bsel = 3'h4;
          alufn = 6'h33;
          current_state = 6'h1b;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = ADD_ONE_GREEN_game_fsm;
          end else begin
            M_game_fsm_d = BRANCH_CHECK_RAND_3_game_fsm;
          end
        end
        BRANCH_CHECK_RAND_3_game_fsm: begin
          we_regfile = 1'h0;
          regfile_read_address_b = 3'h7;
          current_state = 6'h1c;
          if (rb_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = ADD_ONE_BLUE_game_fsm;
          end else begin
            M_game_fsm_d = ADD_ONE_ALL_RED_game_fsm;
          end
        end
        ADD_ONE_RED_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h0;
          regfile_write_address = 3'h0;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h00;
          current_state = 6'h1d;
          M_game_fsm_d = ADD_POINTER_game_fsm;
        end
        ADD_ONE_GREEN_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h1;
          regfile_write_address = 3'h1;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h00;
          current_state = 6'h1e;
          M_game_fsm_d = ADD_POINTER_game_fsm;
        end
        ADD_ONE_BLUE_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h2;
          regfile_write_address = 3'h2;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h00;
          current_state = 6'h1f;
          M_game_fsm_d = ADD_POINTER_game_fsm;
        end
        ADD_ONE_ALL_RED_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h0;
          regfile_write_address = 3'h0;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h00;
          current_state = 6'h20;
          M_game_fsm_d = ADD_ONE_ALL_GREEN_game_fsm;
        end
        ADD_ONE_ALL_GREEN_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h1;
          regfile_write_address = 3'h1;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h00;
          current_state = 6'h21;
          M_game_fsm_d = ADD_ONE_ALL_BLUE_game_fsm;
        end
        ADD_ONE_ALL_BLUE_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h2;
          regfile_write_address = 3'h2;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h00;
          current_state = 6'h22;
          M_game_fsm_d = ADD_POINTER_game_fsm;
        end
        ADD_POINTER_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h4;
          regfile_write_address = 3'h4;
          asel = 3'h0;
          bsel = 3'h3;
          wdsel = 1'h1;
          alufn = 6'h00;
          current_state = 6'h23;
          M_game_fsm_d = CHECK_POINTER_game_fsm;
        end
        CHECK_POINTER_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h4;
          regfile_write_address = 3'h7;
          asel = 3'h0;
          bsel = 3'h6;
          wdsel = 1'h1;
          alufn = 6'h33;
          current_state = 6'h24;
          M_game_fsm_d = BRANCH_CHECK_POINTER_game_fsm;
        end
        BRANCH_CHECK_POINTER_game_fsm: begin
          we_regfile = 1'h1;
          regfile_read_address_a = 3'h7;
          current_state = 6'h25;
          if (ra_data[0+0-:1] == 1'h1) begin
            M_game_fsm_d = RESET_REGISTERS_R0_game_fsm;
          end else begin
            M_game_fsm_d = IDLE_game_fsm;
          end
        end
        RESET_REGISTERS_R0_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h0;
          wdsel = 1'h0;
          current_state = 6'h26;
          M_game_fsm_d = RESET_REGISTERS_R1_game_fsm;
        end
        RESET_REGISTERS_R1_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h1;
          wdsel = 1'h0;
          current_state = 6'h27;
          M_game_fsm_d = RESET_REGISTERS_R2_game_fsm;
        end
        RESET_REGISTERS_R2_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h2;
          wdsel = 1'h0;
          current_state = 6'h28;
          M_game_fsm_d = RESET_REGISTERS_R4_game_fsm;
        end
        RESET_REGISTERS_R4_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h4;
          wdsel = 1'h0;
          current_state = 6'h2a;
          M_game_fsm_d = RESET_REGISTERS_R5_game_fsm;
        end
        RESET_REGISTERS_R5_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h5;
          wdsel = 1'h0;
          current_state = 6'h2b;
          M_game_fsm_d = RESET_REGISTERS_R6_game_fsm;
        end
        RESET_REGISTERS_R6_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h6;
          wdsel = 1'h0;
          current_state = 6'h2e;
          M_game_fsm_d = RESET_REGISTERS_R7_game_fsm;
        end
        RESET_REGISTERS_R7_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h7;
          wdsel = 1'h0;
          current_state = 6'h2f;
          M_game_fsm_d = GAMEOVER_game_fsm;
        end
        GAMEOVER_game_fsm: begin
          we_regfile = 1'h0;
          current_state = 6'h30;
          if (red_btn_input || green_btn_input || blue_btn_input) begin
            M_game_fsm_d = RESET_REGISTERS_R3_game_fsm;
            dec_rst = 1'h1;
          end else begin
            M_game_fsm_d = GAMEOVER_game_fsm;
          end
        end
        RESET_REGISTERS_R3_game_fsm: begin
          we_regfile = 1'h1;
          regfile_write_address = 3'h3;
          wdsel = 1'h0;
          current_state = 6'h29;
          M_game_fsm_d = IDLE_game_fsm;
        end
      endcase
    end
  end
  
  always @(posedge clk) begin
    M_game_fsm_q <= M_game_fsm_d;
  end
  
endmodule
