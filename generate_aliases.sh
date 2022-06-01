#!/bin/bash  


SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo "alias genUser='$SCRIPTPATH/genUser.sh'" >> ~/.bash_aliases
echo "alias permit='$SCRIPTPATH/permit.sh'" >> ~/.bash_aliases
echo "alias allotInterest='$SCRIPTPATH/allotInterest.sh'" >> ~/.bash_aliases
echo "alias updateBranch='$SCRIPTPATH/updateBranch.sh'" >> ~/.bash_aliases
echo "alias makeTransaction='$SCRIPTPATH/makeTransaction.sh'" >> ~/.bash_aliases







