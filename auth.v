`include "number_of_users.v"
module authenticat #(parameter N=`Number)();
    reg [9:0]card_no [0:N];
    reg  [10:0] password [0:N] ;
    reg [10:0]inp[0:2];
    // integer bal,ID,pass,k;
    integer flag,k, file;
  initial begin
    #5;
        // $readmemb("balance.txt", balance); 
        $readmemb("password.txt", password);   
        $readmemb("cardNo.txt", card_no); 
        $readmemb("input.txt", inp); 
        assign flag =0;
         for( k=0;k<=N; k=k+1)
         begin
          //  $display("%d %d %d %d %d ",k, inp[0], inp[1], password[k],card_no[k]);
        if(card_no[k]==inp[0] && password[k]==inp[1])
        begin
            assign flag=1;
        end
         end
        file=$fopen("./flag.txt","w");
       $fwrite(file, "%0b ", 0);
       $fwrite(file, "%0b", flag);
       $fclose(file);
  end
endmodule