
module ser_top(
    input           clk,
    input           rst_n,
    input           data_en,
    input  [7:0]    parallel_data_in,
    input           load_en,
    output          ser_out
);

wire [7:0] data_8b_in;
wire [9:0] data_10b_out;
    latch_8bit data_in_latch(
        .clk(clk),
        .rst_n(rst_n),
        .data_8b_in(parallel_data_in),
        .data_en(data_en),
        .data_8b_out(data_8b_in)
    );

    encoder_8b_10b encode_data(
        .clk(clk),
        .rst_n(rst_n),
        .data_8b_in(data_8b_in),
        .ser_en(data_en),
        .data_10b_out(data_10b_out)
    );

    piso_10bit par_to_ser(
        .clk(clk),
        .rst_n(rst_n),
        .par_in(data_10b_out),
        .load_en(load_en),
        .ser_out(ser_out)
    );

endmodule
