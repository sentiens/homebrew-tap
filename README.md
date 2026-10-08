# sentiens/tap

Homebrew tap for [EgressGuard](https://github.com/sentiens/egressguard), a VPN
kill switch for macOS that works with any VPN app (WireGuard, OpenVPN, IKEv2…):
the Mac reaches the internet only on networks you trust, through a VPN tunnel,
or not at all.

```
brew tap sentiens/tap
brew install egressguard
sudo egressguard setup
```

| Formula | What it is |
|---|---|
| [egressguard](https://github.com/sentiens/egressguard) | VPN kill switch for macOS: trusted networks, VPN tunnels, or nothing. A root daemon on the built-in pf firewall, a CLI and a menu bar app, built from source |

Requires macOS 14 or newer and the Xcode Command Line Tools
(`xcode-select --install`).
