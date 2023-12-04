`include "number_of_users.v"
module check_balance #(parameter N=`Number)();
    reg [9:0]card_no [0:N];
    reg  [10:0] password [0:N] ;
    reg [10:0]  balance [0:N];
    reg [10:0]  fd[0:1];
    reg flag=0;
    integer k;

  initial begin
       
        $readmemb("input.txt", fd); 
        $readmemb("balance.txt", balance); 
        $readmemb("password.txt", password);   
        $readmemb("cardNo.txt", card_no); 

      for( k=0;k<=N; k=k+1)
      begin
            if (fd[0]==card_no[k] &&  fd[1]==password[k])
            begin
                $display("Balance:%d", balance[k]);
                flag=1;
            end
      end
       if(flag==0)
        begin
          $display ("Card Number or Password is incorrect");
        end
   end
endmodule


