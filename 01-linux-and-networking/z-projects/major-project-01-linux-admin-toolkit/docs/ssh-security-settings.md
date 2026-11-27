# SSH Server Security Hardening Guide (`/etc/ssh/sshd_config`)

## Baseline Hardening Settings
To protect Linux cloud instances (such as AWS EC2) from brute-force and unauthorized root access, enforce the following parameters in `/etc/ssh/sshd_config`:

| Parameter | Recommended Value | Security Purpose |
| :--- | :--- | :--- |
| `PermitRootLogin` | `no` | Blocks direct root logins; forces administrators to authenticate as a named user and escalate via `sudo`. |
| `PasswordAuthentication` | `no` | Disables password-based logins entirely, requiring asymmetric cryptographic key pairs (`ed25519` or `RSA-4096`). |
| `PubkeyAuthentication` | `yes` | Explicitly enables SSH public-key authentication. |
| `PermitEmptyPasswords` | `no` | Prevents accounts without passwords from authenticating. |
| `MaxAuthTries` | `3` | Limits authentication attempts per connection to mitigate credential stuffing. |
| `X11Forwarding` | `no` | Disables GUI forwarding on headless servers to reduce attack surface. |
| `ClientAliveInterval` | `300` | Sends keepalive checks every 5 minutes and disconnects idle sessions (`ClientAliveCountMax 2`). |
| `AllowUsers` / `AllowGroups` | `AllowGroups ssh-users` | Restricts SSH access strictly to authorized administrative groups. |

## Verification & Safe Reload Procedure
Always validate syntax before restarting the SSH daemon so you do not lock yourself out of a remote session:

```bash
# 1. Test configuration syntax (silent output = valid)
sudo sshd -t

# 2. Reload SSH service without dropping active sessions
sudo systemctl reload ssh
```
