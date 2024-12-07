module ir(
    input [31:0] i_data,
    input IRWre,
    input clk,
    output reg [31:0] o_data
);
always @(negedge clk) begin 
    if(IRWre) o_data = i_data;
end
endmodule