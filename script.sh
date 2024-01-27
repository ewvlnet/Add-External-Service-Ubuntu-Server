#!/bin/bash

echo -e "------------------------------------------------------------------------------------------------------"
echo -e "Add External Service On Your Ubuntu Server (In this example, Github)"
echo -e "------------------------------------------------------------------------------------------------------"
echo

echo -e "First we update the system"
echo -e "apt update && apt upgrade -y"
sudo apt update && apt upgrade -y
echo

echo -e "Now let's access the external Github service"
echo -e "Accessing the .ssh/ folder"
echo -e "cd ~/.ssh/"
cd ~/.ssh/
echo

echo -e "We generate a key"
echo -e "ssh-keygen"
sudo ssh-keygen
echo

echo -e "Start the SSH agent"
echo -e "eval $ ( ssh-agent -s) "
sudo eval $(ssh-agent -s)
echo

echo -e "Next step..."
echo -e "ssh-add id_rsa"
sudo ssh-add id_rsa
echo

echo -e "Get the contents of the PUBLIC key (ATTENTION!!, always the .pub)"
echo -e "cat id_rsa.pub"
sudo cat id_rsa.pub
echo
echo -e "Now you need to copy this content and register a new SSH key on Github"
echo

echo -e "----------------------------------------------------------------------------------------------------"
echo -e "ATTENTION "
echo -e "Have you already added the key to the External Service (Github)? Answer Y for yes and N for no"
echo -e "----------------------------------------------------------------------------------------------------"
sudo read KEYADD
echo

if [ $KEYADD != "" ]; then

    if [ $KEYADD = "Y" ]; then
        echo -e "Testing connection to external service..."
        echo -e "ssh -T git@github.com"
        sudo ssh -T git@github.com
        echo
    else
        echo -e "Ok, so after adding run the ssh command -T git@github.com"
    fi

else
    echo -e "Oops! You did not enter any values"
fi

echo -e "------------------------------------------------------------------------------------------------------"
echo -e "... END ..."
echo -e "------------------------------------------------------------------------------------------------------"