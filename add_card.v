`include "number_of_users.v"
`include "auth.v"

module add_card #(parameter N=`Number)();
reg [9:0]card_no [0:N];
reg  [10:0] password [0:N] ;
reg [10:0]  balance [0:N];
reg [10:0]inp[0:1];
reg f=0;
integer k, cardnum, pin, file, pfile,ppfile,fd;

initial begin
    
  $readmemb("./input.txt", inp); 

      for( k=0;k<=N; k=k+1)begin
            if (inp[0]==card_no[k])begin
            f=1;
            end
      end
   
   if(f==1)begin
    $display("card exists!");
  end
  else begin
        $readmemb("./input.txt", inp); 
        cardnum = inp[0];
        pin = inp[1];
        // $display(cardnum, pin);
        file=$fopen("cardNo.txt","a");
        $fwrite(file, " %0b", cardnum);
        $fclose(file);
        pfile=$fopen("password.txt","a");
        $fwrite(pfile, " %0b", pin);
        $fclose(pfile);
        ppfile=$fopen("balance.txt","a");
        $fwrite(ppfile," %0b",500);

        $display("Card added!");
      
  end
end  
endmodule