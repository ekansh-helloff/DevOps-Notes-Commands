Docker --> Docker Engine -> Containers 



**Containers** and virtual machines are both technologies used to isolate applications and their dependencies, but they have some key differences:



1\. Resource Utilization: Containers share the host operating system kernel, making them lighter and faster than VMs. VMs have a full-fledged OS and hypervisor, making them more resource-intensive.

2\. Portability: Containers are designed to be portable and can run on any system with a compatible host operating system. VMs are less portable as they need a compatible hypervisor to run.

3\. Security: VMs provide a higher level of security as each VM has its own operating system and can be isolated from the host and other VMs. Containers provide less isolation, as they share the host operating system.





**Management**: Managing containers is typically easier than managing VMs, as containers are designed to be lightweight and fast-moving.

====================================================

>>>  Files and Folders in containers base images

/bin: contains binary executable files, such as the ls, cp, and ps commands.
/sbin: contains system binary executable files, such as the init and shutdown commands.
/etc: contains configuration files for various system services.
/lib: contains library files that are used by the binary executables.
/usr: contains user-related files and utilities, such as applications, libraries, and documentation.
/var: contains variable data, such as log files, spool files, and temporary files.
/root: is the home directory of the root user.

>>>  **Files and Folders that containers use from host operating system**

The host's file system: Docker containers can access the host file system using bind mounts, which allow the container to read and write files in the host file system.
Networking stack: The host's networking stack is used to provide network connectivity to the container. Docker containers can be connected to the host's network directly or through a virtual network.
System calls: The host's kernel handles system calls from the container, which is how the container accesses the host's resources, such as CPU, memory, and I/O.
Namespaces: Docker containers use Linux namespaces to create isolated environments for the container's processes. Namespaces provide isolation for resources such as the file system, process ID, and network.
Control groups (cgroups): Docker containers use cgroups to limit and control the amount of resources, such as CPU, memory, and I/O, that a container can access.

----------------------------------------------------------------------------------

**Docker daemon**

The Docker daemon (dockerd) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.


**Docker client**

The Docker client (docker) is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.


**Docker Desktop**

Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (dockerd), the Docker client (docker), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper. For more information, see Docker Desktop.


**Docker registries**

A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry.


When you use the docker pull or docker run commands, the required images are pulled from your configured registry. When you use the docker push command, your image is pushed to your configured registry. Docker objects

When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.

**Dockerfile**

Dockerfile is a file where you provide the steps to build your Docker Image...


\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*



Volumes:::



**1\. Named Volumes**



version: "3.9"

services:

&nbsp; db:

&nbsp;   image: postgres:16

&nbsp;   container\_name: my\_postgres

&nbsp;   environment:

&nbsp;     POSTGRES\_USER: user

&nbsp;     POSTGRES\_PASSWORD: pass

&nbsp;     POSTGRES\_DB: mydb

&nbsp;   volumes:

&nbsp;     - db\_data:/var/lib/postgresql/data



volumes:

&nbsp; db\_data:



&nbsp;

db\_data is a named volume managed by Docker.



The data persists even if the container is removed.



Docker stores it under /var/lib/docker/volumes/db\_data/\_data.



**2\. Bind Mounts**





version: "3.9"



services:

&nbsp; web:

&nbsp;   image: nginx:latest

&nbsp;   ports:

&nbsp;     - "8080:80"

&nbsp;   volumes:

&nbsp;     - ./html:/usr/share/nginx/html:ro





./html → local directory on your machine.



/usr/share/nginx/html → directory inside container.



:ro makes it read-only.





3\. using tmpfs 





version: "3.9"



services:

&nbsp; app:

&nbsp;   image: node:20

&nbsp;   working\_dir: /usr/src/app

&nbsp;   volumes:

&nbsp;     - ./src:/usr/src/app         # Bind mount (for dev)

&nbsp;     - app\_data:/usr/src/app/data # Named volume (persistent data)

&nbsp;     - type: tmpfs

&nbsp;       target: /tmp               # In-memory storage

&nbsp;   ports:

&nbsp;     - "3000:3000"



volumes:

&nbsp; app\_data:



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



Docker:

Docker is an open-source containerization platform that helps package an application with all its dependencies into a single, lightweight container.

Containers share the host OS kernel, making them much faster and more efficient than virtual machines.

With Docker, we can ensure the application runs exactly the same in dev, test, and production.



“In our Jenkins pipeline, we build a Docker image on every commit, tag it with the Git commit hash, push it to a registry, and deploy it.

This ensures reproducibility and easy rollbacks.”



"We had a Python API that behaved differently on dev, QA, and prod because of dependency versions.

We containerized it using Docker, writing a Dockerfile that installed exact package versions, exposed a port, and ran the app.

After that the application behaved identically across all environments.

We then pushed the image to Azure Container Registry and deployed it to Kubernetes (AKS).

**Docker life cycle:**  

The Docker life cycle describes the complete journey of a containerized application — from building an image, running it as a container, managing its state, and finally stopping or removing it.
At Docker level, the container lifecycle is usually described with five main states: created, running, paused, stopped/exited, and removed/deleted. These states are driven by common Docker CLI. It starts with building an immutable image, pushing it to a registry, running it as a container, managing its runtime state, and finally stopping and removing it. In enterprise DevOps, this lifecycle is automated through CI/CD pipelines and orchestration tools like Kubernetes to ensure scalability, reliability, and consistency.

Docker components:

Docker uses a client-server architecture. The Docker client communicates with the Docker daemon, which manages images, containers, networks, and volumes. Images are immutable templates built using Dockerfiles, and containers are runtime instances of those images. Docker registries store and distribute images. Under the hood, Docker uses Linux namespaces and cgroups to provide isolation and resource control.

The Docker client communicates with the Docker daemon using REST APIs over Unix socket or TCP
The Docker daemon is responsible for managing the complete container lifecycle.
Docker images are layered, immutable artifacts that define how a container should be created.
Containers are isolated processes running on the host OS kernel, making them faster and more lightweight than virtual machines.
Registries enable versioned image storage and secure distribution across environments.
Dockerfile allows us to create reproducible and version-controlled container images.
Docker networking enables container-to-container and container-to-external communication using virtual networks.
Docker volumes decouple container lifecycle from data lifecycle.
**Docker Engine** is the complete end-to-end platform that enables container creation, execution, and management.

Components of Docker Engine:  Docker Client (docker)/Docker Daemon (dockerd)/REST API

Responsibilities:

Accepts Docker commands
Manages container lifecycle
Builds and runs images
Handles networking and volumes

**Docker Daemon (dockerd):**   Docker Daemon is the backend service that performs all container operations requested by the Docker client.

Responsibilities:

Builds Docker images
Runs and stops containers
Manages Docker networks & volumes
Communicates with containerd and runc
Talks to registries (pull/push images)

**Docker COPY vs Docker ADD:**


**CMD vs Entry point: ** 

ENTRYPOINT defines the main executable of the container and is not overridden by default, while CMD provides default arguments or commands that can be overridden at runtime. In production, we typically combine ENTRYPOINT with CMD to create flexible yet controlled container behaviour.

FROM ubuntu
CMD ["echo", "Hello World"]
docker run myimage
--> Hello World
docker run myimage echo "Hi"
--> Hi
**CMD is easily overridden at runtime.**

FROM ubuntu
ENTRYPOINT ["echo"]
docker run myimage Hello
--> Hello
**ENTRYPOINT always runs and treats runtime input as arguments.**

FROM ubuntu
ENTRYPOINT ["echo"]
CMD ["Hello World"]
Behaviors:

docker run myimage
# Output: Hello World

docker run myimage DevOps
# Output: DevOps

**Prod Example:**
FROM python:3.11
WORKDIR /app
COPY app.py .
ENTRYPOINT ["python", "app.py"]
CMD ["--env=prod"]

docker run myapp
docker run myapp --env=dev
**ENTRYPOINT defines the application, CMD provides environment-specific defaults**

What is --entrypoint flag in Docker?

--entrypoint is used to override the ENTRYPOINT defined in a Dockerfile at runtime.

ENTRYPOINT cannot be overridden 
CMD can be overridden & But sometimes (debugging, troubleshooting), we must bypass ENTRYPOINT.

docker run --entrypoint /bin/bash myimage

docker network \& types:
Now container starts with
bash shell

📌 Real-world use

Debug container
Inspect filesystem
Run emergency commands

##Kubernetes sends SIGTERM to containers during:

Pod termination
Rolling updates

📌 If shell form is used:
App may not stop properly
Leads to crash loops

📌 Exec form handles this cleanly.

Explain how to isolate networks b/w containers:



Distroless images in container:



Mutli-stage build in docker:







Real time challenges:



Docker is a single daemon process. Which can cause a single point of failure, If the Docker Daemon goes down for some reason all the applications are down.

Docker Daemon runs as a root user. Which is a security threat. Any process running as a root can have adverse effects. When it is comprised for security reasons, it can impact other applications or containers on the host.

Resource Constraints: If you're running too many containers on a single host, you may experience issues with resource constraints. This can result in slow performance or crashes.



Secure Containers:





Docker Compose:





-> BuildKit is an open-source project and Docker's new builder, designed to enable advanced build features, including multi-architecture builds (30:53). It significantly improves upon the legacy Docker builder, which did not support multi-platform builds natively (29:54).



-------------------------------------------------------------------



Docker Model Runner: 





