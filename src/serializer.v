//RTL Code of serializer 

module serializer(
    input clock,
    input enable,
    input [15:0]din,
    output dout
);


wire [3:0]count;
wire [15:0]reg_data;
wire load;
nor LOAD(load,count[0],count[1],count[2],count[3]);
cnt4bit SEL_MUX(clock,enable,count);
data DATA(din,load,clock,reg_data);
mux16x4 MUX16X4(reg_data,count,dout);



endmodule



module data(
	input [15:0]din,
	input load,
	input clk,
	output reg [15:0]temp
);
// reg [15:0]temp

always @(negedge clk ) begin
	if(load) begin
		temp<=din;
	end
	else
		temp<=temp;
end

endmodule



module cnt4bit(
input clock,
input enable,
output reg [3:0]count
);


always @ (posedge clock)
begin
 if (enable)
	count<=count+4'd1;
 else
	count<=4'd0;
end
	
	
endmodule

module mux16x4 (
	input [15:0]d_in,
	input [3:0]sel,
	output reg d_out
);

always @(*) begin
	d_out<=d_in[sel];
end
	
endmodule
