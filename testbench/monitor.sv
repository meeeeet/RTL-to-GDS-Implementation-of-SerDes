class monitor;

    virtual if_serdes mn_if;
	transaction tr;
    mailbox mon2scb;

    function new(virtual if_serdes mn_if, mailbox mon2scb);
        this.mn_if = mn_if;
        this.mon2scb = mon2scb;
      	tr=new();
    endfunction

    task main;
        forever begin
          
			wait(mn_if.ld)
            tr.din=mn_if.din;
          	repeat(32) @(posedge mn_if.clk)
      	    tr.dout = mn_if.dout;
          mon2scb.put(tr);
        end
    endtask 
    
endclass