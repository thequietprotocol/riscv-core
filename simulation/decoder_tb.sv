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
    // Test 1: ADDI R1, R2, 5
    instr = 32'h00510093; #10;
    $display("ADDI: opcode=%b rd=%0d rs1=%0d imm=%0d", opcode, rd, rs1, imm);


    $finish;
  end

endmodule
