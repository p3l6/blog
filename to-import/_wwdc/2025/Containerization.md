---
title: Containerization
year: 2025
---
* New swift framework for linux containers
* Focus on security, privacy, performance
* Image management
  * Can make requests from a registry
* Runs each container in a separate lightweight virtual machine
  * Unlike (docker) which runs a single large VM for all containers
* `vminitd` is the root process inside the container
* Vm container contains no libc, or dynamic libraries. Instead `vminitd` is compiled with swift static compiler
* CLI `container`. Is this basically a docker replacement?
  * `container image pull alpine:latest`
  * `container run -t -i alpine:latest sh`
