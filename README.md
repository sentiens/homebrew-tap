# sentiens/tap

Homebrew tap for [EgressGuard](https://github.com/sentiens/egressguard), a VPN
kill switch for macOS that works with any VPN app (WireGuard, OpenVPN, IKEv2…):
the Mac reaches the internet only on networks you trust, through a VPN tunnel,
or not at all; and for [Router Limits](https://github.com/sentiens/router-limits),
a menu bar view of TeamClaude and codex-multi-auth quota.

```
brew tap sentiens/tap
brew install egressguard
sudo egressguard setup
```

| Formula | What it is |
|---|---|
| [egressguard](https://github.com/sentiens/egressguard) | VPN kill switch for macOS: trusted networks, VPN tunnels, or nothing. A root daemon on the built-in pf firewall, a CLI and a menu bar app, built from source |
| [router-limits](https://github.com/sentiens/router-limits) | Menu bar app for TeamClaude and codex-multi-auth quota pools, built from source. Needs a machine-local router setup (see its README) and macOS 15 or newer |

Requires macOS 14 or newer and the Xcode Command Line Tools
(`xcode-select --install`).
