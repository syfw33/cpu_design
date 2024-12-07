`timescale 1ns / 1ps
//pc
module counter(
    output reg [15:0] pc_addr,    //16位地址线，指向指令地址
    input             clock, 
    input             reset, 
    input             en          //使能
);

always @(posedge clock or negedge reset) begin
	if(!reset) begin
		pc_addr <= 16'd0;
	end
	else begin
		if(en) pc_addr <= pc_addr+4;
		else pc_addr <= pc_addr;
	end
end

endmodule