#! /bin/bash

## Team name : AWEsome Quartet
##   Limit input error upto 3 times

clear

echo ""
echo "                            <<<  WELCOME to \033[0;31mAWSome Pizzaria>>>        "
echo ""
echo -e '\033[0;31m'
echo "******************************************************************************************"
echo "*                                                                                        *"
echo "*     Today’s special  : Large Cheese pizza  : $9.99 !!!                                 *"
echo "*                                                                                        *"
echo "******************************************************************************************"
tput init

### Take customer’s name and phone number
# Variable : CustomerName, PhoneNo

function NameNPhone () {
   echo "    <<   Enter your name and phone number to start your order >>  "
   read -p "   Your name   :       " CustomerName
   read -p "   Phone No.   :       " PhoneNo
  # return $CustomerName $PhoneNo
}

# Confirm customer’s name and phone number
# Variable : C_Info ( Y or N )

function CheckInfo() {
  echo ""
  echo "   Your name is $CustomerName  and  Phone No. is $PhoneNo  "
  echo "" 
 read -p " Is all information correct ?    Y or N ===> " C_Info
}


# input confirmation

function confirmYN () {
     YorN=$1
        while [ "$YorN" != "Y" ] && [ "$YorN" != "y" ]    
        do 
                if [ "$YorN" = "N" ] || [ "$YorN" = "n" ]; then    # Type of order input is not correct
                   echo ""
                   echo " ***** Thank you for visiting AWSome Pizza, $CustomerName.  See you soon!! "   # Stop ordering
                  sleep 3
                   exit
              else 
               #   echo "You entered $YorN"
                  read -p "  Please enter Y (y) or N (n) ===> " YorN     # Type of order input is not correct
              fi
          done
}




# Enter name, phone no
NameNPhone         #function : enter name and phone number
CheckInfo                #function : validate name and phone number

while [ "$C_Info" != "Y" ] && [ "$C_Info" != "y" ]    # when Name or Phone # is not correct
do
   if [ "$C_Info" = "N" ] || [ "$C_Info" = "n" ]; then    # when Name or Phone # is not correct
       echo ""
       NameNPhone
       CheckInfo
   else                                                                               # when input is not valid -> ask to enter Y or N
       echo ""
       read -p "  Please enter Y (y) or N (n) ===> " C_Info
   fi
done


clear
                   
echo " ----------------- Select Type of Order ---------------"
echo ""
read -p "               1: Carry Out       2: Delivery     =>        " T_order    #T_order : 1 -> Carrry out 2 -> Delivery
echo ""
echo ""
echo "--------------------------------------------------------------------------------------------"
case $T_order in
      1) read -p "Your order will be ready to pick up in 30 minutes. Would like to start orders?  Y or N   ==>  " S_order

         confirmYN "$S_order"  ;;

      2) read -p "Your order will be delivered in 45 minutes and $5 delivery fee. Would like to start orders?  Y or N   ==>  " S_order

         confirmYN "$S_order"

         read -p "    Please enter Delivery Address    :     "  D_addr
         echo ""
         read -p " Is Delivery address $D_addr?     Y or N ====>   "  C_addr

         while [ "$C_addr" != "Y" ] && [ "$C_addr" != "y" ]    
         do 
              if [ "$C_addr" = "N" ] || [ "$C_addr" = "n" ]; then    # Type of order input is not correct
                   echo ""
                   read -p "    Please enter correct delivery Address    :     "  D_addr
                   echo ""
                   read -p "  Is Delivery address $D_addr?     Y or N ====>   "  C_addr
              else
                 echo "" 
                 echo "You entered $C_addr"
                 read -p "  Please enter Y (y) or N (n) ===> " C_addr     # Type of order input is not correct
              fi
          done  ;;
esac



# ==============  Start orders

Clear
P_Order_Count = 0
S_Order_Count = 0
D_Order_Count = 0
DR_Order_Count = 0
E_Order_Count = 0

declare -a Size_Arr
Size_Arr=( s S m M l L x X xl XL xL Xl)

echo 
echo "******************************************************************************************"
echo "*                                                                                        *" 
echo "*     1 : Pizza      2  : Sides   3  :  Desserts    4  : Drinks      5  :  Extras        *"
echo "*                                                                                        *"
echo "******************************************************************************************"
echo "*  << Pizza >>                                                                           *"    
echo "*   Store’s picks        : Pepperoni, Cheese, Sausage                                    *"
echo "*   Specialties          : Meat, Meatball pepperoni, Hawaiian                            *"
echo "*   Meatless Specialties : Fresh Spinach & Tomato Alfredo, Garden Fresh                  *"
echo "*                           Extra Cheesy Alfredo, Tuscan Six Cheese                      *"
echo "*   Create Your Own                                                                      *"
echo "*  << Sides >>                                                                           *"
echo "*    wings      : BBQ/Buffalo/Hot/Soy honey                                              *"
echo "*    pasta-meat :  sauce/chicken alfredo                                                 *"                     
echo "*    salad      :-Caesar salad/chicken salad                                             *"
echo "*    cheesy bread                                                                        *"
echo "*                                                                                        *"
echo "*  << Dessert >>                                                                         *"
echo "*    cinnamon sticks                                                                     *"
echo "*    brownies   *"
echo "*       "
echo "*  << Drinks >> "
echo "*   Coke/water/Sprite/Dr.Pepper  "
echo "*   << Extras >> "
echo "******************************************************************************************"
echo ""
read -p "         <<< What would you like to order?  select [ 1 - 5 ]  :   " Order_Menu

case $Order_Menu in
     1) echo "--------------------------------------------------------------------------------------------"
#        reap -p  "   Awesome!! Would you like to order Pizza?    Y or N"  M_order 
#        confirmYN ??? or modified?
#
       Order_Pizza ()

function Order_Stores_pick () {
     echo ""
     echo "*  ------------------------------------------------------------------------------------  *"    
     echo "*   1 Pepperoni - small: "`echo '$'`"12.20  Medium : "`echo '$'`"14.60  Large : "`echo '$'`"16.80  X-Large : "`echo '$'`"20.90   *" 
     echo "*   2 Cheese    - small: "`echo '$'`"12.20  Medium : "`echo '$'`"14.60  Large : "`echo '$'`"16.80  X-Large : "`echo '$'`"20.90   *" 
     echo "*   3 Sausage   - small: "`echo '$'`"12.20  Medium : "`echo '$'`"14.60  Large : "`echo '$'`"16.80  X-Large : "`echo '$'`"20.90   *" 
     echo "*  ------------------------------------------------------------------------------------  *"   
     echo ""
     read -p " Please select pizza : [ 1 - 3 ] " Ordered_Pizza_Name
     echo ""
     
     while ((Ordered_Pizza_name < 0)) || ((Ordered_Pizza_name > 4))
     do
          echo ""
          read -p "  Please enter the number 1 - 5    ===> " Ordered_Pizza_Name
          echo ""
     done
     
     read -p " Please select size : [ S  M  L  X ]  ===> " Ordered_Pizza_Size

     size_check=0

     while (( size_check == 0 ))   
     do   
          if [[ "${Size_Arr[*]}" =~ "$Ordered_Pizza_Size" ]]; then 
               size_check=1
     else
          read -p "  Please select a correct size : [ S  M  L  X ]    ===> " Ordered_Pizza_Size
          echo " You entered $Ordered_Pizza_Size "
     fi
done

function Order_Pizza () {
     echo ""
     echo "*  ------------------------------------------------------------------------------------  *"    
     echo "*   1 : Store’s picks        : Pepperoni, Cheese, Sausage                                *"
     echo "*   2 : Specialties          : Meat, Meatball pepperoni, Hawaiian                            *"
     echo "*   3 : Meatless Specialties : Fresh Spinach & Tomato Alfredo, Garden Fresh                  *"
     echo "*                           Extra Cheesy Alfredo, Tuscan Six Cheese                      *"
     echo "*   4 : Create Your Own                                                                      *"
     echo "*  ------------------------------------------------------------------------------------  *"   
     echo ""
     read -p " Please enter your choice : [ 1 - 4 ] " P_choice
     echo ""


    
     
     case $P_Kind in
          1)  

 
 
        # M_Check=0
        ;;
            2) echo "--------------------------------------------------------------------------------------------
        reap -p  "   Awesome!! Would you like to order Sides?    Y or N"  M_order 

        Order_Sides()
 
        # M_Check=0
        ;;
            3) echo "--------------------------------------------------------------------------------------------
        reap -p  "   Awesome!! Would you like to order Dessert?    Y or N"  M_order 

 
        # M_Check=0
        ;;
            4) echo "--------------------------------------------------------------------------------------------
        reap -p  "   Awesome!! Would you like to order Drinks?    Y or N"  M_order 

 
        # M_Check=0
        ;;
  
             5) echo "--------------------------------------------------------------------------------------------
        reap -p  "   Awesome!! Would you like to order Extra?    Y or N"  M_order 

 
        # M_Check=0
        ;;


