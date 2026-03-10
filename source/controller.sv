
// controller.sv
// RV32I controller
// Generates control signals for the datapath

module controller(
    input opcode_t opcode, 
    input funct3_t funct3,
    input logic [6:0] funct7,
    output aluop_t aluOp
);

always_comb begin
    unique case(opcode)

        OP_REG: alu_op = decode_op_R(funct7, funct3);
//        OP_IMM: 
//        OP_LOAD: 
//        OP_JALR: 
//        OP_STORE: 
//        OP_BRANCH: 
//        OP_AUIPC: 
//        OP_LUI: 
//        OP_JAL: 

    endcase
end

// TODO: Move to a package with more functions
function aluop_t decode_op_R(logic[6:0] funct7, funct3_t f3)
    unique case(f3)
        F3_ADD_SUB : decode_op_R = (funct7[5] == 1)? ALU_SUB: ALU_ADD;
        F3_SLL     : decode_op_R = ALU_SLL;
        F3_SLT     : decode_op_R = ALU_SLT;
        F3_SLTU    : decode_op_R = ALU_SLTU;
        F3_XOR     : decode_op_R = ALU_XOR;
        F3_SRL_SRA : decode_op_R = (funct7[5] == 1)? ALU_SRA: ALU_SRL;
        F3_OR      : decode_op_R = ALU_OR;
        F3_AND     : decode_op_R = ALU_AND;
    endcase
endfunction

endmodule