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


SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ $input_file == "n" ];
then
    if ! [ $PWD == $path ];
    then
        cd $path
    fi
    mkdir Omege_Bank
    chmod a+x Omega_Bank
    cd Omege_Bank
    branch_add="Y"
    while [[ $branch_add =~ [Yy] ]] ;
    do
        echo "Enter branch"
        read branch
        mkdir $branch
        chmod a+x $branch
        cd $branch
        sudo useradd -d $PWD -s /bin/bash $branch
        touch Branch_Current_Balance.txt
        touch Branch_Transaction_History.txt
        touch Daily_Interest_Rates.txt
        setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$branch:rwx Branch_Current_Balance.txt
        setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$branch:rwx Branch_Transaction_History.txt
        setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$branch:rwx Daily_Interest_Rates.txt
        touch .bashrc
        setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$branch:rwx .bashrc
        echo "alias makeTransaction='$SCRIPTPATH/makeTransaction.sh'" >> .bashrc
        echo "alias updateBranch='$SCRIPTPATH/updateBranch.sh'" >> .bashrc
        echo "Add a user [Y/n]?"
        read user_add
        while [[ $user_add =~ [Yy] ]] ;
        do
            echo "Enter account number"
            read user_name
            mkdir $user_name
            chmod a+x $user_name
            cd $user_name
            sudo useradd -d $PWD $user_name
            touch .bashrc
            setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$user_name:rwx .bashrc
            echo "alias makeTransaction='$SCRIPTPATH/makeTransaction.sh'" >> .bashrc
            touch Current_balance.txt
            echo "500">Current_balance.txt
            chmod 700 Current_balance.txt
            touch Transaction_history.txt
            chmod 700 Transaction_history.txt
            touch Acc_info.txt
            echo "${user_txt_content[$i]} ${user_txt_content[$i+1]} ${user_txt_content[$i+2]} ${user_txt_content[$i+3]} ${user_txt_content[$i+4]}">Acc_info.txt
            chmod 700 Acc_info.txt
            cd ..
            echo "Add a user [Y/n]?"
            read user_add
        done
        cd ..
        echo "Add another branch [Y/n]?"
        read branch_add
    done

else
    if [ -r "$input_file" ];
    then
        declare -a user_txt_content
        user_txt_content=(`cat "$input_file"`)
        if ! [ $PWD == $path ];
        then
            cd $path
        fi
        mkdir Omega_Bank
        chmod a+x Omega_Bank
        cd Omega_Bank
        for (( i = 0 ; i < ${#user_txt_content[@]} ; i+=5))
        do
            user_name=${user_txt_content[$i]}
            branch=${user_txt_content[$i+1]}
            if ! [[ -d "$path/Omega_Bank/$branch" ]];
            then
                mkdir $branch
                chmod a+x $branch
                cd $branch
                sudo useradd -d $PWD -s /bin/bash $branch
                touch Branch_Current_Balance.txt
                touch Branch_Transaction_History.txt
                touch Daily_Interest_Rates.txt
                setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$branch:rwx Branch_Current_Balance.txt
                setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$branch:rwx Branch_Transaction_History.txt
                setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$branch:rwx Daily_Interest_Rates.txt
                touch .bashrc
                setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$branch:rwx .bashrc
                echo "alias makeTransaction='$SCRIPTPATH/makeTransaction.sh'" >> .bashrc
                echo "alias updateBranch='$SCRIPTPATH/updateBranch.sh'" >> .bashrc
                mkdir $user_name
                chmod a+x $user_name
                cd $user_name
                sudo useradd -d $PWD $user_name
                touch .bashrc
                setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$user_name:rwx .bashrc
                echo "alias makeTransaction='$SCRIPTPATH/makeTransaction.sh'" >> .bashrc
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
                chmod a+x $user_name
                cd $user_name
                sudo useradd -d $PWD -s /bin/bash $user_name
                touch .bashrc
                setfacl --set user::rwx,group::---,other:---,mask:rwx,user:$user_name:rwx .bashrc
                echo "alias makeTransaction='$SCRIPTPATH/makeTransaction.sh'" >> .bashrc
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





