<div style="text-align: center">

## Add External Service On Your Ubuntu Server (In this example, Github) 

</div>

First we update the system

```shell
sudo apt update && apt upgrade -y
```

Now let's access the external Github service

Accessing the .ssh/ folder

```shell
cd ~/.ssh/
```

We generate a key

```shell
sudo ssh-keygen
```

Start the SSH agent

```shell
sudo eval $(ssh-agent -s)
```

Next step...

```shell
sudo ssh-add id_rsa
```

Get the contents of the PUBLIC key (ATTENTION!!, always the .pub)

```shell
sudo cat id_rsa.pub
```

Now you need to copy this content and register a new SSH key on Github

Next step...

### ATTENTION

Have you already added the key to the External Service (Github)? Answer Y for yes and N for no

```shell
sudo read KEYADD

if [ $KEYADD != "" ]; then

    if [ $KEYADD = "Y" ]; then
        echo -e "Testing connection to external service..."
        echo -e "ssh -T git@github.com"
        sudo ssh -T git@github.com
    else
        echo -e "Ok, so after adding run the ssh command -T git@github.com"
    fi

else
    echo -e "Oops! You did not enter any values"
fi

echo -e "... END ..."
```

### 📄 License

[MIT](./LICENSE.md)
