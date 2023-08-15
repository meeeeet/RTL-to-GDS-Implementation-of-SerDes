class scoreboard;

    mailbox mon2scb;
    int count;
  	int flag;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
        count=0;
      flag=0;
    endfunction

    task main;
        transaction tr;
        forever begin
            mon2scb.get(tr);
            count++;
            if (tr.din==tr.dout) begin
                $display("[Test-%0d] Correct",count);
              flag=1;
            end
            else begin
                $display("[Test-%0d] Incorrect",count);
              flag=0;
            end
        end
    endtask
endclass