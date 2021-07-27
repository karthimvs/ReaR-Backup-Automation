#!/usr/bin/env bash

##############################################################################
#Ver = 1.0
#Description = Backup Automation for Rear Backup tool with e-Mail Alert
#Author = KarthiMvs
##############################################################################

destmail=log@your-email.com

if [[ $(id -u) -eq 0 ]];
    then
       sudo rear -v -d mkbackup 2>&1

    if [[ $? -eq 0 ]];
        then
           echo -e "Dear Team,\n\n\"$HOSTNAME\" server ReaR Backup has been Successful.\n\n\n\nThanks,\nAuto generated e-Mail,\nChennai Team." | mail -s ""\'$HOSTNAME\'" Rear Backup Success" $destmail
    sleep 5
            rm -rf /tmp/rear.*

        else
            echo -e "Dear Team,\n\n\"$HOSTNAME\" server ReaR Backup Status Failed. Please check and run again!!!\n\n\n\nThanks,\nAuto generated e-Mail,\nChennai Team." | mail -s "**Critical Alert** "\'$HOSTNAME\'"  Rear Backup Failed" $destmail

    fi
else
    echo
    echo
    echo -e "'\033[1;31m'Your are not a root user'\033[0m'"
    echo -e "'\033[1;31m'Please run the script in root user'\033[0m'"
    echo
    echo
fi
