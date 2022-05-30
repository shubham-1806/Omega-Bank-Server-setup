#!/bin/bash  

echo "Directory present in /tmp/Omega_Bank [Y/n]?"

read path_okay

if [ $path_okay == "Y" ] || [ $path_okay == "y" ] ;
then
    path="/tmp/Omega_Bank"
else 
    echo "enter the path"
    read path
    if ! [[ -d "$path" ]];
    then
        echo "path dosent exist"
        exit 0
    fi
fi

if ! [ $PWD == $path];
then
    cd $path
fi

for branch in */ ; do
    cd $branch
    for user_name in */ ; do
        cd $user_name
        for file in * ; do
            setfacl --set user::rw-,group::---,other:---,mask:rw-,user:${user_name::-1}:r--,user:${branch::-1}:rw- $file
        done
        cd ..
    done
    cd ..
done
