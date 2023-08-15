`include "interface.sv"
`include "test.sv"
`include "ser.v"
`include "des.v"

module main;

    bit clk;
    bit en;

    initial begin
        fork
            begin
                clk = 0;
                forever
                    #5 clk = ~clk;
            end

            begin
                en=0;
                #6 en=1;
            end
        join
    end

    if_serdes if_serdes_inst(
        .clk(clk),
        .en(en)
    );

    ser ser_dut(
        .clock(clk),
        .enable(en),
        .load(if_serdes_inst.ld),
        .din(if_serdes_inst.din),
        .dout(if_serdes_inst.ser_dout)
    );

    des des_dut(
        .clock(clk),
        .enable(en),
        .load(if_serdes_inst.ld),
        .din(if_serdes_inst.ser_dout),
        .dout(if_serdes_inst.dout)
    );

    test_main t1(if_serdes_inst);
    initial begin
             $dumpvars;
        $dumpfile("dump.vcd");
 
    end
endmodule