module main(input choice);


always@(*)
begin
$dumpfile("main_vcd.vcd");
// $dumpvars(0, main)
      


$display("select operation");
$display("1 :check balance");
$display("2. withdraw cash");
$display("3. register card");
$display("4.change pincode");

    case(choice)
    // b'00 : check_balance();
    b'00 :$display("check balance");
    // b'01: withdraw();
    b'01: $display("2. withdraw cash");
    // b'10: add_user();
    b'10: $display("3. register card");
    // b'11: change_pin();
     b'11: $display("4.change pincode");
    endcase 
end


// module check_balance_tb;

// input choice

// endmodule


endmodule