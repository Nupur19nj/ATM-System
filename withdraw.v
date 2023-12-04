`include "number_of_users.v"
module withdraw #(parameter N =`Number);

reg [9:0]card_no [0:N];
    reg  [10:0] password [0:N] ;
    reg [10:0]  balance [0:N];
    reg [10:0]  fd [0:2];

// integer fd,card,pass,k,index;
integer k,index,file;
initial begin
// $display("hhjs");
// #1;
// fd=$fopen("input.txt","w");
// card=$fopen("cardNo.txt","r");
// pass=$fopen("password.txt","r");
 $readmemb("input.txt", fd); 
 $readmemb("balance.txt", balance); 
 $readmemb("password.txt", password);   
 $readmemb("cardNo.txt", card_no); 
file= $fopen("balance.txt","w");
index =-1;
       for (k = 0; k <=N; k = k + 1) begin
            if (fd[0] == card_no[k] && fd[1] == password[k]) begin
                index = k;
            end
        end
if(index==-1)
$display ("Card Number or Password is incorrect");

         for(k=0;k<=N;k=k+1) begin
           if(k==index && balance[k]>=fd[2])
             begin
             $display("Current balance:%d", balance[k]);
               balance[k]=balance[k]-fd[2];
               $display("withdraw complete ...");
               $display("Balance :%d", balance[k]);


             end
             else if(k==index && balance[k]<fd[2] )begin
               $display("No enough balance");
              //  $display("%d", N);
             end
             $fwrite(file,"%0b ",balance[k]);
         end
// $display("%d", N);
end



endmodule