#!/bin/bash  

input_file=$1
if [ "$#" -lt 1 ];
then
    input_file="n"
fi

echo "create entire directory in /tmp  [Y/n]?"
read path_okay

if [ $path_okay == "Y" ] || [ $path_okay == "y" ] ;
then
    path="/tmp"
else 
    echo "enter the path"
    read path
    if ! [[ -d "$path" ]];
    then
        echo "path dosent exist"
        exit 0
    fi
fi


if [ $input_file == "n" ];
then
    if ! [ $PWD == $path ];
    then
        cd $path
    fi
    mkdir Omege_Bank
    cd Omege_Bank
else
    if [ -r "$input_file" ];
    then
        declare -a user_txt_content
        user_txt_content=(`cat "$input_file"`)
        if ! [ $PWD == $path ];
        then
            cd $path
        fi
        mkdir Omege_Bank
        cd Omege_Bank
        for (( i = 0 ; i < ${#user_txt_content[@]} ; i+=5))
        do
            user_name=${user_txt_content[$i]}
            branch=${user_txt_content[$i+1]}
            if ! [[ -d "$path/$branch" ]];
            then
                mkdir $branch
                cd $branch
                sudo useradd -d $PWD $branch
                mkdir $user_name
                cd $user_name
                sudo useradd -d $PWD $user_name
                touch Current_balance.txt
                echo "500">Current_balance.txt
                chmod 700 Current_balance.txt
                touch Transaction_history.txt
                chmod 700 Transaction_history.txt
                touch Acc_info.txt
                echo "${user_txt_content[$i]} ${user_txt_content[$i+1]} ${user_txt_content[$i+2]} ${user_txt_content[$i+3]} ${user_txt_content[$i+4]}">Acc_info.txt
                chmod 700 Acc_info.txt
                cd ..
                cd ..
            else
                cd $branch
                mkdir $user_name
                cd $user_name
                sudo useradd -d $PWD $user_name
                touch Current_balance.txt
                echo "500">Current_balance.txt
                chmod 700 Current_balance.txt
                touch Transaction_history.txt
                chmod 700 Transaction_history.txt
                touch Acc_info.txt
                echo "${user_txt_content[$i]} ${user_txt_content[$i+1]} ${user_txt_content[$i+2]} ${user_txt_content[$i+3]} ${user_txt_content[$i+4]}">Acc_info.txt
                chmod 700 Acc_info.txt
                cd ..
                cd ..
            fi
        done
    else
        echo "inputted file not found"
        exit 0
    fi
fi





