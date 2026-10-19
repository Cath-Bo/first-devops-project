
## Network Interfaces

**Command:**
```bash
ip addr
```

**Output:**

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever

**Interpretation:**
- `lo` is the loopback interface. It allows the machine to communicate with itself. It has the IPv4 address 127.0.0.1. Its MAC address is `00:00:00:00:00:00`.

2: enp3s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether 10:9a:dd:5e:06:4a brd ff:ff:ff:ff:ff:ff
    altname enx109add5e064a

**Interpretation**
- `enp3s0` is the Ethernet interface. It is currently down. Its MAC address is `10:9a:dd:5e:06:4a`.


3: wlp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 8c:7b:9d:d5:a2:34 brd ff:ff:ff:ff:ff:ff
    altname wlx8c7b9dd5a234
    inet 192.168.138.3/24 brd 192.168.138.255 scope global dynamic noprefixroute wlp2s0
       valid_lft 562sec preferred_lft 562sec
    inet6 fe80::e370:5391:f823:c240/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever

**Interpretation**
- `wlp2s0` is the Wi-Fi interface.  It is active and has a physical network connection, as indicated by `LOWER_UP`.It has the IPv4 address `192.168.138.3`. Its MAC address is `8c:7b:9d:d5:a2:34`.

4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether f2:ba:5b:b8:9a:98 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::f0ba:5bff:feb8:9a98/64 scope link proto kernel_ll 
       valid_lft forever preferred_lft forever

**Interpretation**
- `docker0` is the virtual network bridge used by Docker. It is currently down and has no active carrier, as indicated by `NO-CARRIER`. Its IPv4 address is `172.17.0.1`. Its MAC address is `f2:ba:5b:b8:9a:98`.

_________________________

## Routing Table

**Comand**

```ip routing```

**Output**

default via 192.168.138.1 dev wlp2s0 proto dhcp src 192.168.138.3 metric 600 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
192.168.138.0/24 dev wlp2s0 proto kernel scope link src 192.168.138.3 metric 600 

**Interpretation**

- `default via 192.168.138.1 dev wlp2s0 proto dhcp src 192.168.138.3 metric 600` — This is the default route. Packets destined for networks without a more specific route are sent through the gateway `192.168.138.1` using the Wi-Fi interface `wlp2s0`. The route was configured through DHCP. The source IP address is `192.168.138.3`. The metric `600` is the route's priority value; lower metrics are preferred when otherwise comparable routes exist.

- `172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown` — This route covers the Docker network `172.17.0.0/16`. The route is connected directly to the virtual interface `docker0`, so no gateway is specified. The source IP address is `172.17.0.1`. The `linkdown` flag indicates that the Docker bridge currently has no active link.

- `192.168.138.0/24 dev wlp2s0 proto kernel scope link src 192.168.138.3 metric 600` — This route covers the local Wi-Fi network `192.168.138.0/24`. Packets destined for this subnet are sent directly through `wlp2s0`, without passing through the default gateway. The source IP address is `192.168.138.3`. The route was created automatically by the kernel when the interface received its IP address.

________________________

# Default Gateway

- `192.168.138.1` The default gateway is needed so that the computer knows where to send packets when the destination is in another network.
________________________

# Public Address

```bash
curl -4 https://ifconfig.me```

**Output**

- `178.43.209.136` The public IPv4 address observed by an external server.
________________________

# Listening Network Ports

```bash
sudo ss -tulpn
```
| Protocol | State  | Recv-Q | Send-Q | Local Address:Port | Peer Address:Port | Process                |
|----------|--------|--------|--------|--------------------|-------------------|------------------------|
| TCP      | LISTEN | 0      | 128    |       0.0.0.0:22   |      0.0.0.0:*    | `sshd` (PID 707, FD 6) |
| TCP      | LISTEN | 0      | 128    |          [::]:22   |         [::]:*    | `sshd` (PID 707, FD 7) |

**Interpretation:**

- **Protocol:** TCP is used for reliable network connections.
- **State:** `LISTEN` means that the SSH server is waiting for incoming connections.
- **Recv-Q:** `0` means that no connections are currently waiting in the accept queue.
- **Send-Q:** `128` is the reported maximum backlog for pending connections.
- **Local Address:Port:** `0.0.0.0:22` means that SSH listens on all IPv4 interfaces. `[::]:22` indicates listening on IPv6 addresses.
- **Peer Address:Port:** `*` means that connections may originate from any remote address and port.
- **Process:** `sshd` is the SSH server process. PID identifies the process, and FD identifies its socket file descriptor.
Listening on port 22 means that the computer is ready to accept SSH connections. This allows to manage Debian remotely through the terminal.
