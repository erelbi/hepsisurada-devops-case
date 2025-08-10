```
root@home-lab:/home/hepsisurada# sudo iptables -t nat -A PREROUTING -d 192.168.1.187 -p tcp --dport 8080 -j DNAT --to-destination 192.168.122.65:80
root@home-lab:/home/hepsisurada# sudo iptables -t nat -A PREROUTING -d 192.168.1.187 -p tcp --dport 81 -j DNAT --to-destination 192.168.122.92:80
root@home-lab:/home/hepsisurada# sudo iptables -t nat -A PREROUTING -d 192.168.1.187 -p tcp --dport 8200 -j DNAT --to-destination 192.168.122.92:8200
```