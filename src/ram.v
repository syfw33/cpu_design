
module ram(
    inout [31:0] data,
    input [15:0] addr,
    input en,read,write,clk
);

reg [31:0] ram[1023:0];

assign data = (read && en &&addr[15:12] == 4'b0001 && && addr[1:0] == 2'b00)?ram[addr[11:2]]:32'hZZZZZZZZ;

always @(posedge write) begin
    if(addr[15:12] == 4'b0001 && && addr[1:0] == 2'b00 && en) begin
        ram[addr[11:2]] = data;
    end
end
endmodule