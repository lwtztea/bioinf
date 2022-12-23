## Theory

As usual, we will start with a few theoretical questions:

* What is Docker and how it differs from dependencies management systems? From virtual machines?
  - Docker is a platform which helps developers build, deploy, and manage their applications by using containers. 🤙
  - Dependency management system is just a system for declaring, resolving and using dependencies required by the project in an automated fashion. So we can lock our dependencies in docker container.
  - VMs have the host OS and guest OS inside each VM. Docker containers host on a single physical server with a host OS, which shares among them.
  - VMs are more resource-intensive than Docker containers as the virtual machines need to load the entire OS to start.
* What are the advantages and disadvantages of using containers over other approaches?
  - Advantages: сonsistency, saved space (as opposed to using VM), ease in sharing.
  - Disadvantages: data storage is intricate, it's necessary to write a Dockerfile to build a container))0)
* Explain how Docker works: what are Dockerfiles, how are containers created, and how are they run and destroyed?
  - Dockerfile is a text file that contains one command (instructions) per line.
  - A docker image is organized in a layered fashion. Every instruction on a Dockerfile is added a layer in an image.
  - The top layer of an image is writable and used by the running container.
  - The docker run first creates a writeable container layer over the specified image, and then starts it using the specified in Dockerfile command.
  - You can 'destroy' container via stop (send a STOPSIGNAL instruction in the container), rm or kill commands.
* Name and describe at least one Docker competitor (i.e. a tool based on the same containerization technology).
  - AWS Lambda enables running code in the cloud.
  - Jetty provides a web server and servlet container, additionally providing support for HTTP/2, WebSocket etc.
* What is conda? How it differs from apt, yarn, and others?
  - Conda is a cross platform package and environment manager that installs and manages conda packages from the Anaconda repository.
  - APT is a collection of tools used to install, update, remove, and otherwise manage software packages on Debian and its derivative operating systems.
  - Yarn is a package manager for the Node.js JavaScript runtime environment.

## Problem

**Anaconda**:

* Install conda, create a new virtual environment, and install all necessary packages. ✅
* You won't be able to install some tools - that's fine. List their names, and explain what should be done to make them conda-friendly:
  - в файле [environment.yml](https://github.com/lwtztea/bioinf/blob/9a01c5e/environment.yml) можно найти необходимые пакеты и каналы, через которые они устанавливаются (в основном это bioconda). ✅
* Export the environment to the file and verify that it can be rebuilt from the file without problems:
  - в [bioinf.yml](https://github.com/lwtztea/bioinf/blob/14238df/bioinf.yml) лежат зависимости, которые можно получить при их записи из енва в файл. ✅

**Docker**:
* Create a Dockerfile for a container with **all** required dependencies. Don't forget about comments. Test that all tools are accessible and work inside the container. ✅
* Move all executables to $PATH folders (e.g.`/usr/local/bin`) to make them accessible without specifying the full path. ✅
* Use [hadolint](https://hadolint.github.io/hadolint/) and remove as many reported warnings as possible. ✅
* Add relevant [labels](https://docs.docker.com/engine/reference/builder/#label), e.g. maintainer, version, etc. ✅
* Create an extra Dockerfile that starts from a conda base image and builds everything from your conda environment file. ✅
