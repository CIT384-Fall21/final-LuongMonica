# Name: Monica Luong
1. What is the difference between Docker image and Docker container?
    * An image is used to build a container. An image has all the commands/instructions, such as updating the packages or making a user. An image is needed so you can replicate a container in an automated process. A container is the actual running application and its environment. Containers can't exist without an image, but images can exist without having an associated container built from it.                          <!-- answer -->

2. What is the command to build a docker image named `cit384-final`?
    * `docker build -t cit384-final .`  (when you're in the same directory as the Dockerfile) OR                                      <!-- answer -->
    * `docker build -t cit384-final https://github.com/nameOfRepoWhereDockerfileIs`                                                   <!-- answer -->

3. What is the command to run a container with `cit384-final` image with an interactive terminal running bash?
    * `docker run -dit cit384-final /bin/bash`                                                                                        <!-- answer -->

4. When running Docker commands there are many options you can use for example to run a container named cit384 with an ubuntu image the command is: `docker run --name cit384 ubuntu`. What do the following options do? 
   1. --name: Names my container cit384
   2. -d: detached, makes it continue running in the background                                                                       <!-- answer -->
   3. --rm: removes/deletes the container after you exit it                                                                           <!-- answer -->
   4. -p: specify a port you want to map from your host to the container. e.g: -p 8080:80 maps your host port 8080 to container 80    <!-- answer -->
   5. --add-host: add entry into /etc/hosts of the container. e.g: --add-host="site1.internal:127.0.0.1"                              <!-- answer -->
   6. -it: interactive terminal, get a shell                                                                                          <!-- answer -->
   7. -v: mount a directory that you can read and write from host and container (bidirectional). e.g: -v /myvolume /mnt/myvolume      <!-- answer -->

5. What is the difference between `-` and `--` in command line parameter?
    * `-` will read what follows as separate options. `--` will read what follows as a single option. e.g: `-rm` is interpreted as the options `-r` and `-m` while `--rm` is interpreted as the option `rm`                                                                           <!-- answer -->

6. In the following code block, provide the git instructions necessary to add a new file to the remote repository: git@github.com:org/project.git (You should presume that you don't have a copy of this repository on your local computer.)
   ```
   # make sure you already have your ssh keys uploaded to github                                                                      <!-- answer -->
   git clone git@github.com:org/project.git                                                                                           <!-- answer -->
   cd project/                                                                                                                        <!-- answer -->
   touch file                                                                                                                         <!-- answer -->
   git add file                                                                                                                       <!-- answer -->
   git commit -m "added new file"                                                                                                     <!-- answer -->
   git push                                                                                                                           <!-- answer -->
   ```
   <!-- You many add any number of lines in the above code block that you need. -->

7. What do the following Apache Directive do?
   1. SSLEngine: Allows us to enable or disable the SSL engine for 
   2. ProxyEngine: doesn't exist (at least in newer versions of Apache, couldn't find it in the docs). SSLProxyEngine, however, does exist and allows us to enable or disable ssl engine for proxying                                                                             <!-- answer -->
   3. ProxyAddHeaders: whether or not to add proxy-related info to the backend server through the X-Forwarded-For, X-Forwarded-Host, and X-Forwarded-Server HTTP headers                                                                                                    <!-- answer -->
   4. ProxyPass: proxies to remote server. allows use of mapping remote servers to local URL namespace. e.g: you have a vhost block for site1.internal that says `ProxyPass "/" http://site2.internal/`. this will map site2.internal's "/" to site1.internal's "/". thus, http://site1.internal/ will be proxied to http://site2.internal/                                                                                <!-- answer -->
   5. ProxyPassReverse: cleans up the URL in the http response headers sent from the reverse proxy. so the end user doesn't know the existence of the backend servers/vhosts                                                                                                         <!-- answer -->
   6. RewriteRule: rewrite/modify the URL for any number of purposes like cleaning up the URL to make it more presentable or redirecting to another page                                                                                                                               <!-- answer -->
   7. Redirect: sends external redirect, telling client to get another URL                                                            <!-- answer -->

8. What module needs to be enabled in order to use the Rewrite directive?
    * rewrite                                                                                                                         <!-- answer -->
9. What is the command to enable a new domain/vHost?
    * sudo a2ensite newDomain.conf                                                                                                    <!-- answer -->

10. What is the command to disable a new domain/vHost?
    * sudo a2dissite newDomain.conf                                                                                                   <!-- answer -->

11. What happens when a user enters a URL into the browser?
    * The URL is parsed, parts of the URL is used to build the request payload, a socket is established between client and server, the actual request is sent to the server, the server does some processing and sends the response back to the client. The user gets the resource they requested or see some sort of http code signaling error or information.                                                           <!-- answer -->

---
You may earn extra credit in this part of the assignment by: 
   1. Adding a file named ``interview_question.md`` to your repository
   2. Providing a comprehensive answer, in essay form, to the following question:
      * What happens when a user enters a URL into the browser?

Of course, your answer here need to much more complete and robust then the answer you provide to the last question in the assignment above.
