_**Why to learn Docker?**_

A couple of years back, when organizations needed other applications, they buy a server without knowing the performance requirement of the software/application. This results waste of money and resources. Then Virtual machines come onto the market, which allows engineers to run multiple applications on the same resource but as a completely different server. But Every application to run on a Virtual machine requires OS and every OS needs its own CPU, RAM, etc. to run. Which increases the cost.
Then Docker Model comes into the scope, which overcomes the drawbacks of the Virtual Machine. It reduces the wastage of resources by sharing OS, memory, and CPU, and It offers many benefits for developers and system administrators, like consistency, portability, efficiency, security, scalability, and version control. These benefits make it easier to manage and deploy applications


_**Features of Docker**_
•	Docker reduces the size of development by providing a smaller part of the OS via containers.
•	It is easier to work on the same project by different teams with the help of Containers.
•	Docker containers can be deployed anywhere, on any physical, or virtual machines and on the cloud.
•	Docker containers are lightweight so, it becomes east to scale them.


**_Advantages of Docker_******
•	Docker uses less memory.
•	The full operating system is not required to run an application.
•	Containers run faster than the other Virtual Machines.
•	It is lightweight.
•	It allows us to use a remote repository to share your containers with other teams.
•	To reduce the risks, it uses dependencies.


Disadvantages of Docker
•	Complexity will increase due to layering.
•	It is difficult to manage a large number of containers.
•	For an application that needs better graphics, Docker is not suitable for it.
•	Cross-platform compatibility is not allowed.

_Difference Between Docker Containers and Virtual Machines_

Docker Containers	Virtual Machines
Docker Containers contain binaries, libraries, and configuration files along with the application itself.	Virtual Machines (VMs) run on Hypervisors, which allow multiple Virtual Machines to run on a single machine along with its own operating system.
They don’t contain a guest OS for each container and rely on the underlying OS kernel, which makes the containers lightweight.	Each VM has its own copy of an operating system along with the application and necessary binaries, which makes it significantly larger and it requires more resources.
Containers share resources with other containers in the same host OS and provide OS-level process isolation.	They provide Hardware-level process isolation and are slow to boot.



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

1. Named Volumes

version: "3.9"
services:
  db:
    image: postgres:16
    container_name: my_postgres
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: mydb
    volumes:
      - db_data:/var/lib/postgresql/data
      
volumes:
  db_data:
 
db_data is a named volume managed by Docker.

The data persists even if the container is removed.

Docker stores it under /var/lib/docker/volumes/db_data/_data.

2. Bind Mounts

version: "3.9"

services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html:ro


./html → local directory on your machine.
/usr/share/nginx/html → directory inside container.
:ro makes it read-only.


3. using tmpfs 

version: "3.9"

services:
  app:
    image: node:20
    working_dir: /usr/src/app
    volumes:
      - app-data:/usr/src/app/data # Named volume (persistent data)
      - ./src:/usr/src/app         # Bind mount (for dev)
      - type: tmpfs
        target: /tmp               # In-memory storage
    ports:
      - "3000:3000"

volumes:
  app-data


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



**Docker:**

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

**Docker components:**

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

**Docker Engine is the product, while Docker Daemon is one of its core components. When we install Docker, we install the Docker Engine, which internally runs the Docker Daemon to manage containers using containerd and runc.**

<img width="1000" height="382" alt="image" src="https://github.com/user-attachments/assets/02e83184-5891-4ab9-a952-879ed78b6baa" />
<img width="800" height="400" alt="image" src="https://github.com/user-attachments/assets/c45e0b0f-4e86-411d-b790-2a3d09241fbe" />



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
**Output: Hello World**

docker run myimage DevOps
**Output: DevOps**

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

Container network isolation ensures that a single compromised service cannot turn into a full system breach by eliminating unintended communication paths.
Network isolation between containers means ensuring that only explicitly allowed services can communicate, while everything else is blocked by default.
The goal is to prevent lateral movement, reduce blast radius, and enforce least-privilege networking.

**Docker Networking.**

Docker networking is the system that enables containers to communicate with each other, the host, and external networks. It defines how data moves between containers and across systems during containerized application execution.

It provides isolated, flexible network environments using built-in drivers like bridge, host, overlay, and none. Each driver supports different use cases, such as local development, swarm-based orchestration, or integration with legacy infrastructure. 

Docker supports six network types to manage container communication that implement core networking functionality:

<img width="665" height="814" alt="image" src="https://github.com/user-attachments/assets/bb4fb84b-7365-4749-a243-21e4ae8500a7" />


Distroless images in container:



Mutli-stage build in docker:







Real time challenges:

#Docker is a single daemon process. Which can cause a single point of failure, If the Docker Daemon goes down for some reason all the applications are down.
#Docker Daemon runs as a root user. Which is a security threat. Any process running as a root can have adverse effects. When it is comprised for security reasons, it can impact other applications or containers on the host.
#Resource Constraints: If you're running too many containers on a single host, you may experience issues with resource constraints. This can result in slow performance or crashes.

**How to secure Docker networking?**
To secure Docker networking:

Use user-defined networks to segment services.
Limit published ports to only what is required.
Run containers as non-root users and apply --cap-drop to remove unnecessary capabilities.
Separate frontend and backend networks for better isolation.
Use mTLS for encrypted service-to-service communication.
Consider macvlan networks for strict isolation from the host and other containers.
Regularly scan images, update dependencies, and rotate secrets.


Docker Compose:





-> BuildKit is an open-source project and Docker's new builder, designed to enable advanced build features, including multi-architecture builds (30:53). It significantly improves upon the legacy Docker builder, which did not support multi-platform builds natively (29:54).



-------------------------------------------------------------------



Docker Model Runner: 



















