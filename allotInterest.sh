#!/bin/bash  

for branch in */ ; do
    cd $branch
    declare -a interest_info
    interest_info=(`cat "Daily_Interest_Rates.txt"`)
    for user_name in */ ; do
        cd $user_name
        interest=0
        declare -a acc_info
        acc_info=(`cat "Acc_info.txt"`)
        for (( i = 2 ; i < ${#acc_info[@]} ; i++))
        do
            for (( j = 0 ; j < ${#interest_info[@]} ; j+=2))
            do
                if [ ${acc_info[$i]} == ${interest_info[$j]} ];
                then
                    add_amount=${interest_info[$j+1]::-1}
                    interest=$(bc -l <<<"${interest}+${add_amount}")
                    break
                fi
            done
        done
        interest=$(bc -l <<<"${interest}+1")
        curr_bal=$(<Current_balance.txt)
        >Current_balance.txt
        write_value=$(bc -l <<<"${curr_bal}*${interest}")
        echo $write_value>Current_balance.txt 
        cd ..
    done
    cd ..
done


