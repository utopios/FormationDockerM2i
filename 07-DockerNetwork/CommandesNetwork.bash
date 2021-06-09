## Pour créer un réseau
$ docker network create --driver bridge mon-bridge

## Pour inspecter un reseau
$ docker network inspect mon-bridge

## Retourne un objet JSON
[
    {
        "Name": "mon-bridge",
        "Id": "d19cf0b9826ad4675902a830219e8b4c2d80e020d82912ec902dd05eed355155",
        "Created": "2021-06-09T14:24:17.6111467Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.21.0.0/16",
                    "Gateway": "172.21.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "e671f7bb8ea7446b8a91796eeb6a70e3e807afb19d976e0f2407b5f1011f1e4f": {
                "Name": "alpine2",
                "EndpointID": "891fdef4f0dfecbde34ccffdf06d1603ea3386a4dfc5f0406f0820d06fcb6dcc",
                "MacAddress": "02:42:ac:15:00:03",
                "IPv4Address": "172.21.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]

## Pour connecter une instance à un réseau
$ docker run -it --name alpine1 --network mon-bridge alpine

##Pour connaitre la latence entre deux conteneurs
$ docker exec alpine1 ping -c 1 172.21.0.3

## Pour connecter un conteneur au reseau host (conteneur ip = machine hote IP)
$ docker run --rm -d --network host --name my_httpd httpd

## Pour connecter un conteneur existant à un réseau
$ docker network connect mon-bridge alpine1

## Pour deconnecter un conteneur existant à un réseau
$ docker network disconnect mon-bridge alpine1