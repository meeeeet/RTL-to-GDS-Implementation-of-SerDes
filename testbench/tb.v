`include "ser.v"
`include "des.v"
`timescale 1ns/1ps
module main;

reg clock;
reg enable;
reg [31:0]din;
reg load;
wire dout;
reg d_out;
wire [31:0]rx_data;

ser s1(.clock(clock),.enable(enable),.din(din),.dout(dout),.load(load));
des d1(.clock(clock),.enable(enable),.din(dout),.dout(rx_data),.load(load));

initial begin
    clock=0;
    enable=0;

    forever begin
        #5 clock=~clock;
    end
end

initial begin

    din=32'h12345678;
    #20;
    forever begin
        #320 din=$random;
    end


end

initial begin
    #19 enable=1;
    load=1;
    #10 load=0;

    #4000 $finish;
end


initial
begin
    load=0;
    #20 load=1;
    #10 load=0;
    forever begin
        #310 load=~load;
        #10 load=~load;
    end
end
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,main);
end


endmodule
