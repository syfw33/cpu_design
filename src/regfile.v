module regfile(
    input clk,
    input reset,
    input w_en,                // Write Enable
    input [4:0] read_addr1,  // Read address for register 1
    input [4:0] read_addr2,  // Read address for register 2
    input [4:0] write_addr,  // Write address
    input [31:0] write_data,
    output reg [31:0] read_data1, 
    output reg [31:0] read_data2  
);
reg [31:0] regs[31:1];

integer i;
initial begin
    for(i=1;i<32;i=i+1)
        regs[i] <= 0;
end

assign read_data1=(read_addr1!=0)?regs[read_addr1]:0;
assign read_data2=(read_addr2!=0)?regs[read_addr2]:0;

always @ (negedge CLK or negedge RST) begin
    if(reset==0) begin
        for(i=1;i<32;i=i+1)
            regs[i] <= 0;
    end
    else if (we && write_addr != 0) begin  //$0reg 不能改
        regs[write_addr] <= write_data;
    end
end
endmodule