## Création de deux réseaux
$ docker network create --driver bridge network1
$ docker network create --driver bridge network2

## Enumération des réseaux
$ docker network ls

## Création de 2 conteneur réliés au reseau network1
$ docker run -dit --name conteneur1 --network network1 alpine
$ docker run -dit --name conteneur2 --network network1 alpine

## Inspection du réseau network1
$ docker network inspect network1

## retourne l'objet suivant:
[
    {
        "Name": "network1",
        "Id": "474a5bf85633cbb3f8c8d979e6ce6a4bbc43f604d1454134c5e9ff52ea423026",
        "Created": "2021-06-10T07:45:44.6154026Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
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
            "281e9d7e65b1625ab57122c3970450a9f443565dbd841279e284e66a82311e33": {
                "Name": "conteneur1",
                "EndpointID": "76272e0f46f7087c087c6babd4edf60a68420a8b902ce171f37d1c9935d9e148",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            },
            "414b2dec97e6c4372b0760b92596451ee9bb393c3d7fa48b26f205159b93516a": {
                "EndpointID": "f27cdfcc49048482fd27c6b009622f90617c03f531f9ac2d2499999f22103e66",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]

## Verification de la latence entre conteneur1 et conteneur2
$ docker exec conteneur1 ping -c 1 172.

## retourne les informations suivantes
PING 172.18.0.3 (172.18.0.3): 56 data bytes
64 bytes from 172.18.0.3: seq=0 ttl=64 time=0.165 ms

--- 172.18.0.3 ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 0.165/0.165/0.165 ms

## Création de deux autre conteneur sans les affecter à un reseau
$ docker run -dit --name conteneur3 alpine
$ docker run -dit --name conteneur4 alpine

## Connection des 2 autres conteneur au reseau network2
$ docker network connect network2 conteneur3
$ docker network connect network2 conteneur4

## Inspection du réseau network2
$ docker network inspect network2

## retourne l'objet suivant:
[
    {
        "Name": "network2",
        "Id": "20bb813a52c9181a06c36d90269141ee3b83d61f972b72931ea3b57d8a0d29ff",
        "Created": "2021-06-10T07:45:49.4101346Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.19.0.0/16",
                    "Gateway": "172.19.0.1"
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
            "3bd7a4e5dd91cef6124189c4f7b1bfa427fb9b674ae01cd7076d618942f76447": {
                "Name": "conteneur3",
                "EndpointID": "951f73d4aaad3fbe0007d72ddaaf8dc091c7948d1cd6d5624d0b981ef9008ae1",
                "MacAddress": "02:42:ac:13:00:02",
                "IPv4Address": "172.19.0.2/16",
                "IPv6Address": ""
            },
            "93454a322e5d18916d348d01c1e5b93e7d344758729582ec66cc80d6bfe97df2": {
                "Name": "conteneur4",
                "EndpointID": "adc3dfada52c0fffbcded104561dc1ea3ea8e8902032b737aae70a1f262c43c3",
                "MacAddress": "02:42:ac:13:00:03",
                "IPv4Address": "172.19.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]

## Verification de la latence entre conteneur1 et conteneur2
$ docker exec conteneur3 ping -c 1 172.19.0.3

## retourne les informations suivantes
PING 172.19.0.3 (172.19.0.3): 56 data bytes
64 bytes from 172.19.0.3: seq=0 ttl=64 time=0.124 ms

--- 172.19.0.3 ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 0.124/0.124/0.124 ms

## connection de conteneur3 sur les deux reseaux
$ docker network connect network1 conteneur3

## Verification des la présence de conteneur 3 sur les deux reseaux
$ docker network inspect network1

## Retourne
[
    {
        "Name": "network1",
        "Id": "474a5bf85633cbb3f8c8d979e6ce6a4bbc43f604d1454134c5e9ff52ea423026",
        "Created": "2021-06-10T07:45:44.6154026Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
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
                "Name": "conteneur1",
                "EndpointID": "76272e0f46f7087c087c6babd4edf60a68420a8b902ce171f37d1c9935d9e148",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            },
            "3bd7a4e5dd91cef6124189c4f7b1bfa427fb9b674ae01cd7076d618942f76447": {
                "Name": "conteneur3",
                "EndpointID": "f52a97c02ce22e9e29a9c4b690f17c8fc8c54e88e584fc2176abfb59a6136d6a",
                "MacAddress": "02:42:ac:12:00:04",
                "IPv4Address": "172.18.0.4/16",
                "IPv6Address": ""
            },
            "414b2dec97e6c4372b0760b92596451ee9bb393c3d7fa48b26f205159b93516a": {
                "Name": "conteneur2",
                "EndpointID": "f27cdfcc49048482fd27c6b009622f90617c03f531f9ac2d2499999f22103e66",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]

## Verification des la présence de conteneur 3 sur les deux reseaux
$ docker network inspect network2

## Retourne
[
    {
        "Name": "network2",
        "Id": "20bb813a52c9181a06c36d90269141ee3b83d61f972b72931ea3b57d8a0d29ff",
        "Created": "2021-06-10T07:45:49.4101346Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.19.0.0/16",
                    "Gateway": "172.19.0.1"
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
            "3bd7a4e5dd91cef6124189c4f7b1bfa427fb9b674ae01cd7076d618942f76447": {
                "Name": "conteneur3",
                "EndpointID": "951f73d4aaad3fbe0007d72ddaaf8dc091c7948d1cd6d5624d0b981ef9008ae1",
                "MacAddress": "02:42:ac:13:00:02",
                "IPv4Address": "172.19.0.2/16",
                "IPv6Address": ""
            },
            "93454a322e5d18916d348d01c1e5b93e7d344758729582ec66cc80d6bfe97df2": {
                "Name": "conteneur4",
                "EndpointID": "adc3dfada52c0fffbcded104561dc1ea3ea8e8902032b737aae70a1f262c43c3",
                "MacAddress": "02:42:ac:13:00:03",
                "IPv4Address": "172.19.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]