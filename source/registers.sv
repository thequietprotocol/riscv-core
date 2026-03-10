
// registers.sv
// 32x32-bit register file

module register_file #(
    parameter WIDTH = 32, 
    parameter DEPTH = 32
)(
    input logic clk, 
    input logic we,
    input logic [WIDTH-1:0] write_data,
    input logic [$clog2(DEPTH)-1:0] write_addr,
    input logic [$clog2(DEPTH)-1:0] read_addr1,
    input logic [$clog2(DEPTH)-1:0] read_addr2,
    output logic [WIDTH-1:0] read_data1,
    output logic [WIDTH-1:0] read_data2
);

(* ram_style = "distributed" *)  // Avoid block RAM
logic [WIDTH-1:0] RF [0:DEPTH-1];

// Synchronous write
always_ff @(posedge clk) begin
    if(we && (write_addr != '0))
        RF[write_addr] <= write_data;
end

// Async read - TODO: read-after-write solution
assign read_data1 = (read_addr1 == '0)? '0: RF[read_addr1];  
assign read_data2 = (read_addr2 == '0)? '0: RF[read_addr2];

endmodule