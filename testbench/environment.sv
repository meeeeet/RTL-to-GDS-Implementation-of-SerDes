`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
    //generator and driver instance
    generator  gen;
    driver     driv;
  	monitor mon;
  	scoreboard scb;
    
    //mailbox handle's
    mailbox gen2driv;
    mailbox mon2scb;
    //event for synchronization between generator and test
    event gen_ended;

    virtual if_serdes vif;

    function new(virtual if_serdes vif);
        this.vif = vif;
      gen2driv=new();
      mon2scb=new();

      gen = new(gen2driv, gen_ended);
      driv = new(vif,gen2driv);
      mon=new(vif,mon2scb);
      scb=new(mon2scb);
    endfunction


    task test;
        fork
            gen.main();
            driv.main();
          	mon.main();
          	scb.main();
        join_none
    endtask

    task post_test;
        wait(gen_ended.triggered);
      $display("[Generator]>>Done");
      wait(gen.nooftr==driv.no_of_tr);
      wait(gen.nooftr==scb.count);
    endtask

    task run;
        test();
        post_test();
      if(scb.flag) $display("<<<<<<<<<<<<<<<<<<<[Result]:: Passed>>>>>>>>>>>>>>>");
      else $display("<<<<<<<<<<<<<<<<<<<<<<<<<[Result]:: Failed>>>>>>>>>>>>>>>>>>>>>>>>>");
        $finish;
    endtask
    
endclass