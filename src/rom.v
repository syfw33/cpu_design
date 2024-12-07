`timescale 1ns / 1ps

module rom(
    output reg [31:0] data,
    input [15:0] addr,
    input read,
    input en
);

reg [31:0] memory [0:4095]
genvar i;
generate
    for(i=0;i<4096;i=i+1) begin : init_rom
        initial begin
            memory[i] = 32'h00000000 + i;
        end
    end
endgenerate

always @(*) begin
    if (read && ena) begin
        data = memory[addr];  
    end else begin
        data = 32'hZZZZZZZZ;  
    end
end
endmodule