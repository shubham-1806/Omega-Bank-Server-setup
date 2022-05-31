#!/bin/bash 

tran_var=$1
amt=$2


if [ ${#tran_var} -lt 1 ];
then
    echo "Deposit Or withdrawl [D/W]?"
    read tran_var
fi

if ! [[ $tran_var =~ [wWdD] ]] ;
then
    echo "Invalid response"
    exit 0
fi

if [ ${#amt} -lt 1 ];
then
    echo "Enter amount"
    read amt

fi

if ! [[ $amt =~ ^[0-9.]+$ ]] ; 
then
    echo "Invalid amount" 
    exit 0
fi

time=`date +%T`
date=`date +%Y-%m-%d`
user_name=`basename $PWD`

curr_bal=$(<Current_balance.txt)
curr_bal=$(bc -l <<<"${curr_bal}")
amt=$(bc -l <<<"${amt}")


if [[ $tran_var =~ [wW] ]] ;
then
    if (( $(echo "$curr_bal >= $amt" | bc -l) )) ;
    then
        echo "$user_name -$amt $date $time">>Transaction_history.txt
        curr_bal=$(bc -l <<<"${curr_bal}-${amt}")
        >Current_balance.txt
        echo $curr_bal>Current_balance.txt 
    else
        echo "Insufficient Balance"
    fi
else
    echo "$user_name +$amt $date $time">>Transaction_history.txt
    curr_bal=$(bc -l <<<"${curr_bal}+${amt}")
    >Current_balance.txt
    echo $curr_bal>Current_balance.txt 
fi







