//0-0x0fff

module rom(
    output reg [31:0] data,
    input [15:0] addr,
    input read
);

reg [31:0] rom [1023:0]

//init
initial begin
    $readmemh("path",rom);
end

assign data = (read && addr[15:12] == 4'b0000 && addr[1:0] == 2'b00)?rom[addr[11:2]]:32'hZZZZZZZZ;

endmodule