# Notes: Networking Basics & Troubleshooting

## 1. Network Interfaces & IP Addressing
- **`ip addr` (or `ip -br addr`):** Displays network interface descriptors, MAC addresses, and assigned IP addresses in a clean tabular format.
- **Loopback (`lo`):** The internal virtual network interface (`127.0.0.1`) used for local host communication.
- **Gateway:** The routing node (`172.27.128.1` on typical WSL2 setups) that bridges local traffic to external networks and the internet.

## 2. Active Sockets & Port Listening
- **`ss` (Socket Statistics):** The modern, high-performance replacement for legacy `netstat`.
- **Key Flags (`-tulpn`):**
  - `-t`: Display TCP sockets.
  - `-u`: Display UDP sockets.
  - `-l`: Show listening ports (servers waiting for connections).
  - `-p`: Show the process ID (PID) and program name using the socket.
  - `-n`: Numeric output (do not resolve service names).

## 3. Name Resolution & Connectivity Testing
- **`nslookup` / `dig`:** Queries DNS servers to translate human-readable domain names (e.g., `google.com`) into IP addresses.
- **`ping`:** Tests round-trip latency and packet loss to a target IP or domain using ICMP echo requests.