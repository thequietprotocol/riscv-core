
// decoder.sv
// RV32I decoder
// Extracts fields and sign-extends immediates

import riscv_define::*;

module decoder(
    input  logic [31:0] instr,
    output logic [4:0] rs1,
    output logic [4:0] rs2, 
    output logic [4:0] rd,
    output logic [2:0] funct3,
    output logic [6:0] funct7,
    output logic [31:0] imm,
    output opcode_t opcode
    );

    assign opcode = opcode_t'(instr[6:0]);
    assign rd  = instr[11:7];
    assign rs1 = instr[19:15];
    assign rs2 = instr[24:20];
    assign funct3 = instr[14:12];
    assign funct7 = instr[31:25];

    always_comb begin
        unique case(opcode)
            // I-type
            OP_IMM, OP_LOAD, OP_JALR: imm = {{20{instr[31]}}, instr[31:20]};
            
            // S-type
            OP_STORE: imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};
            
            // B-type
            OP_BRANCH: imm = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};

            // U-type
            OP_AUIPC, OP_LUI: imm = {instr[31:12], 12'b0};

            // J-type
            OP_JAL: imm = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};

            default: imm = 32'b0;
        endcase
    end

endmodule
