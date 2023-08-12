

module des(
    input clock,
    input enable,
    input load,
    input din,
    output [31:0]dout
);
wire [4:0]count;
wire [31:0]reg_data;
wire des_d_in;
wire rst;

tribuf TRIBUF(din,enable,des_d_in);
d_demux16x4 DEMUX16X4(des_d_in,count,reg_data);
d_cnt4bit SEL_DEMUX(clock,load,count);
d_data DATA(reg_data,load,clock,dout);



endmodule



module d_data(
	input [31:0]din,
	input load,
	input clk,
	output reg [31:0]temp
);

always @(posedge clk) begin
	if(load) begin
		temp<=din;
	end

	else begin
		temp<=temp;
    end
end

endmodule


module d_cnt4bit(
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

module d_demux16x4 (
	input d_in,
	input [4:0]sel,
	output reg [31:0]d_out
);

always @(*) begin
	d_out[sel]<=d_in;
end
endmodule

module tribuf(
    input d_in,
    input enable,
    output d_out
);

assign d_out=enable?d_in:1'bz;
endmodule