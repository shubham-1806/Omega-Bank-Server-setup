# Omega-Bank-Server-setup
SysAd Task 1 for Delta

Firstly the CEO is expected to run the genUser command to generate the entire hierarchy of the banking system. He is put down as the owner of all the files and directories present in the system. This script generates the entire file sytem for the bank. The CEO can choose to pass a text file in order rto create the data base or choose to do it on his own. If a text file is passed it should be in the folllowing format.


Acc Number  Branch  Type of citizen Other Category Other Category

All empty spaces should be in the form of a "-"


ex: https://inductions.delta.nitt.edu/sysad-task1-User_Accounts.txt

The files are then correspondingly created


The permit command is again called by the CEO to give the required permissions to each user.

The update branch script brings the current balance and transaction history of the bank up to date.

The allott interest script allots interest to the customers based on the daily_interest rates file which the branch's managers are expected to keep upto date.

The make Transaction script accepts p[tional arguements (d- deposit w-withdrawl and amount for the respective amount) if not provided it asks for the same later in the script.

The generate_aliases generates the required aliases for the CEO in .bash_aliases since .bashrc reccomends putting the aliases here rather than the original file. However it can be changed based on convenience. The aliases for the other users are created in the genUser script itself.


Here is an example of the system

```*Omega_Bank
    *branch1
        *daily_interest_rates
        *branch_current_balance
        *branch_transaction_history
        *user_1
            *current_balance
            *acc_info
            *transaction_history
        *user2.......
    *branch2....
```

An example system has been uploaded

