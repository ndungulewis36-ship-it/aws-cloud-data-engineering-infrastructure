# Lab 05: Networking Basics & Troubleshooting

## Objective
Inspect network interface configurations, evaluate active TCP/UDP listening sockets, verify external DNS resolution, and test gateway connectivity.

## Commands Executed
```bash
# Check network interface IP addresses and subnet masks
ip -br addr

# Check active listening sockets and ports
ss -tulpn

# Test external DNS resolution
nslookup google.com

# Test outbound gateway/internet connectivity
ping -c 3 8.8.8.8