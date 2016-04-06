## nginx-ssh

Simple Ubuntu docker images with SSH access and nginx

#### Running zuolan/nginx-ssh

`docker run -d -p 2222:22 -p 80:80 zuolan/nginx-ssh`

The first time that you run your container, a random password will be generated
for user `root`. To get the password, check the logs of the container by running:

`docker logs <CONTAINER_ID>`

You will see an output like the following:

```
	========================================================================
	You can now connect to this Ubuntu container via SSH using:

	    ssh -p <port> root@<host>
	and enter the root password 'U0iSGVUCr7W3' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================
```

In this case, `U0iSGVUCr7W3` is the password allocated to the `root` user.

Done!


#### Setting a specific password for the root account

If you want to use a preset password instead of a random generated one, you can
set the environment variable `ROOT_PASS` to your specific password when running the container:

`docker run -d -p 2222:22 -p 80:80 -e ROOT_PASS="mypass" zuolan/nginx-ssh`


#### Adding SSH authorized keys

If you want to use your SSH key to login, you can use `AUTHORIZED_KEYS` environment variable. You can add more than one public key separating them by `,`:

```
docker run -d -p 2222:22 -p 80:80 -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" zuolan/nginx-ssh
```

#### About Nginx

Start your image building the external ports 80 in all interfaces to your container:

`docker run -d -p 80:80 zuolan/nginx-ssh`

Test your deployment:

`curl http://localhost/`

`Hello world!`

#### Loading your custom application

In order to replace the "Hello World" application that comes bundled with this docker images, first create a new empty folder. Go to the new folder and create two subfolders: `sites-enabled` and `app`. Copy your configuration files to `sites-enabled` and you application files to `app`. Then create a new `Dockerfile` with the following contents:

```
FROM zuolan/nginx-ssh
ADD sites-enabled/ /etc/nginx/sites-enabled/
ADD app/ /app/
RUN chown -R www-data:www-data /app/
EXPOSE 80
```

Remember to put your configuration files under the folder named `sites-enabled` and your website files under the folder `app`. Also, if you want to use a different port, change the `EXPOSE 80` in `Dockerfile` as well.(eg. `EXPOSE 443 80` will allow connections go through port `443` and `80`).
After that, build the new `Dockerfile`:

    docker build -t username/my-nginx-ssh

And test it:

    docker run -d -P username/my-nginx-ssh

Test your deployment:

    curl http://localhost/

That's it!
