#!/bin/bash

logfile=$(pwd)/errors.log

function echo_msg {
    if [ $1 -eq 0 ]
    then
        if [ $2 -ne 3 ]
        then 
            echo "Success!"
        fi
    else
        case $2 in
            1)
                echo "Cannot create directory."
                ;;
            2)
                echo "Cannot change directory."
                ;;
            3)
                echo "Cannot print directory."
                ;;
            4)
                echo "Cannot create file."
                ;;
            5)
                echo "Cannot delete file."
                ;;
            *)
                ;;
        esac
    fi
}

while [ 1 -eq 1 ]
do
     echo "################################################"
     echo "Current directory: $(pwd)"
     echo "................................................"
     echo "Select option:"
     echo "[1] Create new directory"
     echo "[2] Change directory"
     echo "[3] Print listing of files in current directory"
     echo "[4] Create file"
     echo "[5] Delete file"
     echo "[6] Exit"
     echo "################################################"
     read choice
     case $choice in
          1)
               echo "Creating directory. Enter directory name: "
               read dirname
               mkdir $dirname 2>>$logfile
               echo_msg $? 1
               ;;
          2)
               echo "Changing directory. Enter directory name: "
               read dirname
               cd $dirname 2>>$logfile
               echo_msg $? 2
               ;;
          3)
               echo $(pwd)
               ls -lAh 2>>$logfile
               echo_msg $? 3
               ;;
          4)
               echo "Creating file. Enter file name: "
               read filename
               touch $filename 2>>$logfile
               echo_msg $? 4
               ;;
          5)
               echo "Deleting file. Enter file name: "
               read filename
               echo "Are you sure? y/n"
               read ans
               if [ $ans = "y" ]
               then
                    rm $filename 2>>$logfile
                    echo_msg $? 5
               else
                    echo "File was not deleted"
               fi
               ;;
          6)
               echo "Exiting..."
               exit 0
               ;;
          *)
               ;;
     esac
done
