# Alpine Strongswan Docker Image
alpine based strongswan with a single config directory.
suitable for use with a config docker image.

## Example docker-compose.yaml
```yaml
version: '2'
services:
    strongswan_data:
        build: your_strongswan_data_dir/
        image: your.org/strongswan_data
        container_name: strongswan_data
        volumes:
            - /config
    strongswan:
        image: ajslater/strongswan 
        container_name: strongswan
        ports:
            - "500:500/udp" # IKE
            - "4500:4500/udp" # IKE for NAT & MOBIKE
        privileged: true
        cap_add:
            - NET_ADMIN
        volumes_from:
            - strongswan_data
```
## Docker Image
https://hub.docker.com/r/ajslater/strongswan
