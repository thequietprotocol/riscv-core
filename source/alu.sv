
// alu.sv
// ALU for RV32I instructions
// ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND instructions
// Zero flag output

module alu #(
    parameter WIDTH=32
)(  
    input aluop_t aluOp,
    input logic [WIDTH-1:0] aluIn1,
    input logic [WIDTH-1:0] aluIn2,
    output logic [WIDTH-1:0] aluOut,
    output logic zero
);

always_comb begin
    aluOut = 'b0;
    case(aluOp)
        ALU_ADD : aluOut = aluIn1 + aluIn2;
        ALU_SUB : aluOut = aluIn1 - aluIn2;
        ALU_SLT : aluOut = ($signed(aluIn1) < $signed(aluIn2))? 1: 0;
        ALU_SLTU: aluOut = (aluIn1 < aluIn2)? 1: 0;
        ALU_XOR : aluOut = aluIn1 ^ aluIn2;
        ALU_SRL : aluOut = aluIn1 >> aluIn2[4:0];
        ALU_SRA : aluOut = $signed(aluIn1) >>> aluIn2[4:0];
        ALU_OR  : aluOut = aluIn1 | aluIn2;
        ALU_AND : aluOut = aluIn1 & aluIn2;
        default : aluOut = '0;
    endcase
end

assign zero = (aluOut == '0);

endmodule