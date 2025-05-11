# Ixian Sandbox Docker Images
Ixian Sandbox includes Ixian DLT, Ixian S2, Ixian Pool and Ixian Explorer Docker images.  
Ixian Pool and Explorer connect to Ixian DLT nodes in this Sandbox.  
All services in this container are pulled from GitHub and are built from source.  
Provided docker-compose.yml is configured to run the services in REGTEST network mode.  
For more information about specific service, see:  
**Ixian DLT** - https://github.com/ixian-platform/Ixian-DLT  
**Ixian S2** - https://github.com/ixian-platform/Ixian-S2  
**Ixian Pool** - https://github.com/ixian-platform/Ixian-Pool  
**Ixian Explorer** - https://github.com/ixian-platform/Ixian-Explorer  


## Prerequisites
To run the Ixian Sandbox docker container you will need to install Docker Compose, see: https://docs.docker.com/compose/install/#prerequisites


## How to use
To build and start the Ixian sandbox in REGTEST mode, execute the following:  
```
./sandbox up
```
  
Once the sandbox is started, you can access the API services using your web browser:  
Ixian DLT: http://localhost:8081/  
Ixian DLT 2nd node: http://localhost:8082/  
Ixian S2: http://localhost:8600/ to http://localhost:8609/  
Ixian Explorer: https://localhost:443/  
Ixian Pool: https://localhost:444/  
  
P2P ports accessible from host:  
Ixian DLT: localhost:10234  
Ixian DLT 2nd node: localhost:10235  
Ixian S2: localhost:10600-10609  


## Sandbox commands
| Command             | Description                                         |
| ------------------- | --------------------------------------------------- |
| **up**              | Creates and starts the sandbox environment.         |
| **create**          | Creates the sandbox environment.                    |
| **start**           | Starts the sandbox environment.                     |
| **stop**            | Stops the sandbox environment.                      |
| **down**            | Stops and destroys the sandbox environment.         |
| **build**           | Rebuilds the sandbox environment.                   |
| **clean**           | Removes the container and deletes temporary files.  |
| **exec**            | Executes a shell command for the specified service. |
| **update**          | Updates container(s) from GitHub.                   |
| **updateFromLocal** | Updates container(s) from host/local storage.       |


