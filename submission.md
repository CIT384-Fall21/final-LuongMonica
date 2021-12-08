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
    *                                                   <!-- answer -->

6. In the following code block, provide the git instructions necessary to add a new file to the remote repository: git@github.com:org/project.git (You should presume that you don't have a copy of this repository on your local computer.)
   ```
                                                        <!-- answer -->
   ```
   <!-- You many add any number of lines in the above code block that you need. -->

7. What do the following Apache Directive do?
   1. SSLEngine: Allows us to enable or disable the SSL engine for 
   2. ProxyEngine:                                      <!-- answer -->
   3. ProxyAddHeaders:                                  <!-- answer -->
   4. ProxyPass:                                        <!-- answer -->
   5. ProxyPassReverse:                                 <!-- answer -->
   6. RewriteRule:                                      <!-- answer -->
   7. Redirect:                                         <!-- answer -->

8. What module needs to be enabled in order to use the Rewrite directive?
    *                                                  <!-- answer -->
9. What is the command to enable a new domain/vHost?
    *                                                  <!-- answer -->

10. What is the command to disable a new domain/vHost?
    *                                                  <!-- answer -->

11. What happens when a user enters a URL into the browser?
    *                                                  <!-- answer -->

---
You may earn extra credit in this part of the assignment by: 
   1. Adding a file named ``interview_question.md`` to your repository
   2. Providing a comprehensive answer, in essay form, to the following question:
      * What happens when a user enters a URL into the browser?

Of course, your answer here need to much more complete and robust then the answer you provide to the last question in the assignment above.
