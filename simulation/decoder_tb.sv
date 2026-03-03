// decoder_tb.sv
// Testbench for RV32I decoder

`timescale 1ns / 1ps

import riscv_define::*;

module decoder_tb;

  logic [31:0] instr;
  logic [4:0]  rs1, rs2, rd;
  logic [2:0]  funct3;
  logic [6:0]  funct7;
  logic [31:0] imm;
  opcode_t     opcode;

  decoder dut (
    .instr   (instr),
    .rs1     (rs1),
    .rs2     (rs2),
    .rd      (rd),
    .funct3  (funct3),
    .funct7  (funct7),
    .imm     (imm),
    .opcode  (opcode)
  );

  initial begin
    // Test 1: ADDI R1, R2, 5 - imm[11:0] | rs1 | f3  | rd | opcode
    instr = 32'h00510093; #10;
    $display("ADDI: opcode=%b rd=%0d rs1=%0d imm=%0d", opcode, rd, rs1, imm);

    // Test 2: ADD R3, R1, R2 - funct7 | rs2 | rs1 | f3  | rd  | opcode
    instr = 32'h002080B3; #10;
    $display("ADD: opcode=%b rd=%0d rs1=%0d rs2=%0d", opcode, rd, rs1, rs2);

    // Test 3: SW R2, 8(R1) - imm[11:5] | rs2 | rs1 | f3 | imm[4:0] | opcode
    instr = 32'h0020A423; #10;
    $display("ADD: opcode=%b imm=%0d rs1=%0d rs2=%0d", opcode, imm, rs1, rs2);

    // Test 4: BEQ R1, R2, 16 - imm[12|10:5] | rs2 | rs1 | f3  | imm[4:1|11] | opcode
    instr = 32'h00208863; #10;
    $display("ADD: opcode=%b imm=%0d rs1=%0d rs2=%0d", opcode, imm, rs1, rs2);

    // Test 5: LUI R7, 0xABCDE - imm[31:12] | rd | opcode
    instr = 32'hABCDE3B7; #10;
    $display("ADD: opcode=%b imm=%0d rd=%0d", opcode, imm, rd);

    // Test 6: JAL R1, 100 - imm[20|10:1|11|19:12] | rd | opcode
    instr = 32'h064000EF; #10;
    $display("ADD: opcode=%b imm=%0d rd=%0d", opcode, imm, rd);

    $finish;
  end

endmodule
