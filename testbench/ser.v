//RTL Code of serializer 

module ser(
    input clock,
    input enable,
    input load,
    input [31:0]din,
    output dout
);


wire [4:0]count;
wire [31:0]reg_data;
wire d_out;
wire rst;

cnt4bit SEL_MUX(clock,load,count);
data DATA(din,load,clock,rst,reg_data);
mux16x4 MUX16X4(reg_data,count,enable,d_out);
s_tribuf TRIBUFF(enable,d_out,dout);


endmodule



module data(
	input [31:0]din,
	input load,
	input clk,
    output reg rst,
	output reg [31:0]temp
);


always @(posedge clk) begin
	if(load) begin
		temp<=din;
        rst<=1'b0;
	end
	else begin
		temp<=temp;
        rst<=1'b1;
    end
end

endmodule


module cnt4bit(
input clock,
input load,
output reg [4:0]count
);

always @ (posedge clock) begin
    if (!load)
        count<=count+5'd1;
    else
        count<=5'd0;
end

endmodule

module mux16x4 (
	input [31:0]d_in,
	input [4:0]sel,
        input enable,
	output reg d_out
);

always @(*) begin
	d_out<=d_in[sel];
end

endmodule

module s_tribuf(input enable, input din, output reg dout);
always @ (*)
begin
if(enable) dout<=din;
else dout<=1'bz; //for gds, 0
end
endmodule
