#!/bin/bash  

typeset -i sum=0
> Branch_Transaction_History.txt
> Branch_Current_Balance.txt
for user_name in */ ; do
    cd $user_name
    declare -a bal
    mapfile -t tran_hist < Transaction_history.txt
    bal=(`cat "Current_balance.txt"`)
    typeset -i curr_bal=${bal[0]}
    sum=$sum+$curr_bal
    cd ..
    for (( i = 0 ; i < ${#tran_hist[@]} ; i++))
    do
        echo ${tran_hist[$i]}>> Branch_Transaction_History.txt
    done
done

echo $sum>Branch_Current_Balance.txt









