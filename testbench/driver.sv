class driver;

    virtual if_serdes dif;
    mailbox gen2drive;
    int no_of_tr;
  	transaction t;

  function new(virtual if_serdes drive_if, mailbox mb);
        this.dif = drive_if;
        this.gen2drive = mb;
        no_of_tr = 0;
    endfunction

    task drive();
      gen2drive.get(t);

      @(posedge dif.ld);
      $display("[%0t] no==%0d",$time,no_of_tr);
      dif.din=t.din;
    endtask

    task load;
        #20 dif.ld=1;
        #10 dif.ld=0;
        forever begin
            #310 dif.ld=~dif.ld;
            #10 dif.ld=~dif.ld;
        end
    endtask


    task main;
        fork
            forever begin 
             no_of_tr++; 
              drive();
            end
            load();
        join
    endtask
endclass