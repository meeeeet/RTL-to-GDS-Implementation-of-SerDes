class generator;

    rand transaction tr;
    mailbox gen2drive;
    int nooftr;
    event e1;

    function new(mailbox gen2drive, event e1);
        this.gen2drive = gen2drive;
        this.e1 = e1;
    endfunction

    task main();
        repeat(nooftr) begin
            tr = new();
            tr.randomize();
            gen2drive.put(tr);
//           $display("%t genr::tr no=%0d",$time,nooftr);
        end
        -> e1;
    endtask

endclass
