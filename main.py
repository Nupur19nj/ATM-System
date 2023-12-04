import os

print("select operation to be performed ")
print("1 :check balance")
print("2. withdraw cash")
print("3. register card")
print("4.change pincode")

choice  =int(input("enter choice "))
if choice==1: 
    #check balance
    
    file=open("input.txt","w")
    c_no=int(input("enter Card no :"))
    c_no_b=bin(c_no).replace("0b","")
   
    pin=int(input("enter pin :"))
    pin_b=bin(pin).replace("0b","")
     # file.write()
    file.write(" "+str(c_no_b)+" "+str(pin_b))
  
    file.close()  # Close the file after writing

    os.system('cmd /c "iverilog -o check_balance_out.vvp check_balance.v"')
    os.system('cmd /c "vvp check_balance_out.vvp"')


elif choice==2:
    #withdraw cash 
    
    file=open("input.txt","w")
    c_no=int(input("enter Card no : "))
    c_no_b=bin(c_no).replace("0b","")
    file.write(" "+str(c_no_b))
    pin=int(input("enter pin : "))
    pin_b=bin(pin).replace("0b","")
    file.write(" "+str(pin_b))

    remove=int((input("enter amount to withdraw : ")))
    remove_b=bin(remove).replace("0b","")
    file.write(" "+str(remove_b))
    file.close()
   
   
    os.system('cmd /c "iverilog -o withdraw_out.vvp withdraw.v"')
    os.system('cmd /c "vvp withdraw_out.vvp"')

   
elif choice==3:
    #  register card
    file=open("input.txt","w")
    c_no=int(input("enter Card no : "))
    c_no_b=bin(c_no).replace("0b","")
    file.write(" "+str(c_no_b))
    pin=int(input("enter pin : "))
    pin_b=bin(pin).replace("0b","")
    file.write(" "+str(pin_b))

    # remove=int((input("enter amount to withdraw :")))
    # remove_b=bin(remove).replace("0b","")
    # file.write(" "+str(remove_b))
    file.close()
   
   
    os.system('cmd /c "iverilog -o add_card_out.vvp add_card.v"')
    os.system('cmd /c "vvp add_card_out.vvp"')

elif choice==4:
    #change pincode
      
    file=open("input.txt","w")
    c_no=int(input("enter Card no : "))
    c_no_b=bin(c_no).replace("0b","")
    file.write(" "+str(c_no_b))
    pin=int(input("enter pin : "))
    pin_b=bin(pin).replace("0b","")
    file.write(" "+str(pin_b))

    newPin=int((input("enter new pin : ")))
    newPin_b=bin(newPin).replace("0b","")
    file.write(" "+str(newPin_b))
    file.close()

    os.system('cmd /c "iverilog -o changePin_out.vvp changePin.v"')
    os.system('cmd /c "vvp changePin_out.vvp"')
else:
    print("invalid choice")


# print(cardNo)