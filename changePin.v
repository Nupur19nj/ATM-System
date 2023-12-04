`include "number_of_users.v"
module withdraw #(parameter N =`Number);

reg [9:0]card_no [0:N];
reg  [10:0] password [0:N] ;
reg [10:0]  balance [0:N];
reg [10:0]  fd[0:2];
reg [10:0]  size;
reg flag=0;

integer k,index,file;
initial begin

    $readmemb("input.txt", fd); 
    $readmemb("balance.txt", balance); 
    $readmemb("password.txt", password);   
    $readmemb("cardNo.txt", card_no); 
    file= $fopen("password.txt","w");
       for (k = 0; k <= N; k = k + 1) begin
            if (fd[0] == card_no[k] && fd[1] == password[k]) begin
                flag=1;
                password[k]=fd[2];    
            end
                $fwrite(file,"%0b ",password[k]);
        end


    if(flag==1)begin
            $display("Pin changed successfully");
    end
    else begin
        $display("wrong cardNo/password");
        end
end
endmodule