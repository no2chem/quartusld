# Docker image for Quartus License Server

This repository contains a Docker image for the Quartus flexlm license server, making
it easy to deploy your license server without having to install dependencies other than
Docker.

Once you have built the image, you can run it by executing:
```
 docker run -v <path-to-license-file>:/license.dat --mac-address <mac-address> --hostname <hostname> -p <host-port>:<port-in-license-dat> -it quartus-ld:latest
```

To set the port in license.dat:

```
SERVER <Server Name> <host/NIC ID> <License server port number>
Vendor alterad <path to daemon> port=<user defined port number>
Vendor mgcld <path to daemon> port=<user defined port number>
```

See the [Docker reference](https://docs.docker.com/config/containers/container-networking/) on how to map ports.