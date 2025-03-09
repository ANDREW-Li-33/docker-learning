[The Intro to Docker I Wish I had by Typecraft](https://www.youtube.com/watch?v=Ud7Npgi6x8E&ab_channel=typecraft)

## What are containers?

First, we should discuss virtualization

<img width="906" alt="image" src="https://github.com/user-attachments/assets/febad009-3a31-4a56-b474-f200145a7b1f" />

As can be seen above, virtualization takes portions of the host's resources, and then runs an entirely new operating system using the taken resources. It does this through software called a hypervisor, such as Microsoft's [Hyper-V](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-overview?pivots=windows-server) or Broadcom's [VMware](https://www.vmware.com/)

## Containerazation 

Imagine that on the host, we want processes / applications to run in isolation (we want containers).
- we could try commands such as chroot (change root) and rlimit (resource limit) on a process

This would work, but it's tedious to do for every process. Therefore, there's software that manages lifecycle of containers.
That's what docker is. A program that manages container lifecycles


## Installing Docker

use your favorite [package manager](https://en.wikipedia.org/wiki/List_of_software_package_management_systems)
AND install the [Docker Desktop application](https://docs.docker.com/desktop/) (for beginners)


to check that Docker was successfully installed, in your CLI run
```docker run hello-world```
make sure the docker application is running before you run this command, otherwise you'll receive this error: <br>
```docker: Cannot connect to the Docker daemon at unix:///Users/andrewli/.docker/run/docker.sock. Is the docker daemon running?. See 'docker run --help'```

## basic workflow

you start with a Dockerfile as shown below. Imagine DIR is a directory on the host machine that contains our Dockerfile
<img width="965" alt="image" src="https://github.com/user-attachments/assets/2365ce8d-e2b1-40f1-81ec-5773f46e49e0" />
<img width="700" alt="image" src="https://github.com/user-attachments/assets/deb205ea-4bd1-4c10-a4c4-6ad34037d034" />

FROM ubuntu:latest pulls the latest image of ubuntu from Dockerhub (where all Docker images are stored). RUN then tells Docker to run the command in the image that was just pulled from Dockerhub. COPY copies a file from the host machine's directory into the image. Then, we run the script (which we can do because we copied it into our image). CMD is the default command that the container will run (notice we said container, not image. CMD is run when the container started instead of during the build process from a Dockerfile to an image, which we will go over shortly).

From the Dockerfile, you create an image. You can only build one image from a given Dockerfile. If you want an image with different functionality, you have to create a new image (the Dockerfile is a blueprint for creating an immutable image). You create the image by running ```docker build```. From the image, you can create as many containers as you'd like by running ```docker run```, kind of like creating objects from a class.


## a quick example
We'll be using the dockerfile and print-message.sh file in the directory as an example. Notice in print-message.sh that we have a package that we are unsure if all users of the script will have locally. That's where Docker comes in. In our dockerfile, we make sure to run a command within our image that downloads the necessary packages (figlet and the fonts). This way, anyone that runs the dockerfile can have the required dependencies.

We can create the image by running ```docker build -t ascii:latest ."```, where the -t flag allows us to explicity add tags to our images (indicated by the ":"), and "." uses every file in the current directory. If we run ```docker images```, we can see a list of all built images (notice how the tag column says "latest"). Then, we can run the container from the image by running ```docker run ascii:latest```, and we'll be able to see our script running!

If we wanted to change the functionality of the script (such as printing different phrases), we have to change the script and rebuild the image (remember how we mentioned that images are immutable). So, we can change the phrases in print-message.sh and save our changes. Then, we rebuild using a different tag, such as ```docker build -t ascii:updated```. Running ```docker images``` again, notice how now the tag of the image we just built says "updated". When we run ```docker run ascii:updated```, we'll see the updated functionality!



