`include "environment.sv"
program test_main(if_serdes test_if);
    environment env;

    initial begin
        env = new(test_if);
        env.gen.nooftr=10;
        env.run();
    end 
endprogram