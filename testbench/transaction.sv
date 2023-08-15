
class transaction;

    rand bit [31:0] din;
    bit [31:0] dout;
  	

  function void display(string msg="N/A");
      $display("transaction::%s ==> din=%h, dout=%h",msg,din, dout);
    endfunction

endclass