Towards an out-of-order RISC-V RV32I processor in SystemVerilog, targeting the Basys 3 FPGA (Xilinx Artix-7)

## Goal

Build a fully functional out-of-order processor from scratch, progressing through:

1. **In-order base** — Pipelined RV32I core with forwarding and hazard detection
2. **OoO infrastructure** — ROB, reservation stations, register renaming, CDB
3. **Precise exceptions** — In-order commit via ROB retirement
4. **FPGA deployment** — Synthesis, timing closure, and demo on Basys 3

## Status

🔧 **Phase 1 — In-order base**: In progress

## Structure
```
├── constraint/      # Constraint file(s)
└── documents/       # Design notes and references
├── packages/        # Packages (riscv_define.sv)
├── simulation/      # Testbenches and simulation scripts
├── source/          # Design source files (.sv)
```

## Tools

- **Language**: SystemVerilog
- **Simulation**: Vivado Simulator
- **Synthesis**: Vivado (Basys 3 — XC7A35T)

## ISA Support

RV32I base integer instruction set

## References
- S. L. Harris and D. Harris, Digital Design and Computer Architecture: RISC-V Edition
- D. A. Patterson and J. L. Hennessy, *Computer Organization and Design: The Hardware/Software Interface, RISC‑V Edition
- J. L. Hennessy and D. A. Patterson, Computer Architecture: A Quantitative Approach
