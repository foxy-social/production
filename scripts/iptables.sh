#!/bin/sh
iptables -F
ip6tables -F

# Kill IPv4

# Accept IPv4 stuff from localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -j ACCEPT

# Accept SSH
iptables -A INPUT -i ens3 -p tcp --dport 22 -j ACCEPT

# Accept outgoing connections and stuff related to them
iptables -A INPUT -i ens3 -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o ens3 -p tcp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# DNS resolution
iptables -A INPUT -i ens3 -p udp --sport 53 -j ACCEPT
iptables -A OUTPUT -o ens3 -p udp --dport 53 -j ACCEPT

# Allow ICMP
iptables -A INPUT -i ens3 -p icmp -j ACCEPT

# Drop anything else
iptables -A INPUT -i ens3 -p tcp -j REJECT --reject-with tcp-reset
iptables -A INPUT -i ens3 -j DROP

# IPv6 config

# Allow SSH
ip6tables -A INPUT -i ens3 -p tcp --dport 22 -j ACCEPT

# Allow loopback on IPv6 + Cloudflare IP ranges
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A INPUT -i ens3 -p tcp -s 2400:cb00::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p tcp -s 2606:4700::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p tcp -s 2803:f800::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p tcp -s 2405:b500::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p tcp -s 2405:8100::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p tcp -s 2a06:98c0::/29 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p tcp -s 2c0f:f248::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p udp -s 2400:cb00::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p udp -s 2606:4700::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p udp -s 2803:f800::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p udp -s 2405:b500::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p udp -s 2405:8100::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p udp -s 2a06:98c0::/29 --dport 443 -j ACCEPT
ip6tables -A INPUT -i ens3 -p udp -s 2c0f:f248::/32 --dport 443 -j ACCEPT
ip6tables -A INPUT -s ::1/128 -j ACCEPT
ip6tables -A INPUT -s fe80::/64 -j ACCEPT

# Accept already established or related connections
ip6tables -A INPUT -i ens3 -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -A OUTPUT -o ens3 -p tcp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# DNS resolution
ip6tables -A INPUT -i ens3 -p udp --sport 53 -j ACCEPT
ip6tables -A OUTPUT -o ens3 -p udp --dport 53 -j ACCEPT

# Allow ICMP
ip6tables -A INPUT -i ens3 -p ipv6-icmp -j ACCEPT

# Drop anything else
#ip6tables -A INPUT -i ens3 -j LOG --log-prefix='[iptables input drop] '
ip6tables -A INPUT -i ens3 -p tcp -j REJECT --reject-with tcp-reset
ip6tables -A INPUT -i ens3 -j DROP
iptables -A FORWARD -o ens3 -j DROP
ip6tables -A FORWARD -o ens3 -j DROP
