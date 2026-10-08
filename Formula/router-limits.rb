class RouterLimits < Formula
  desc "Menu bar app for TeamClaude and codex-multi-auth quota on macOS"
  homepage "https://github.com/sentiens/router-limits"
  url "https://github.com/sentiens/router-limits/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "ce1d001feaa3d0589226303efdd19c2d6cd431f6cf751f6dc957aad1d08885fd"
  license "MIT"
  head "https://github.com/sentiens/router-limits.git", branch: "main"

  # The CLI's /usr/bin/lockf takes a file descriptor from macOS 15 on.
  depends_on macos: :sequoia

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      Router Limits reads machine-local TeamClaude and codex-multi-auth routers through
      ~/.bin/lib/agent-router-env.zsh, which it does not install. The author's private
      agent-router-setup provides it; for your own setup, see "Requirements" in
      #{homepage}#readme for the router_* functions that file must define.

      If the old web service runs, stop and remove it before the app first starts:
        launchctl bootout gui/$(id -u)/com.sentifold.router-limits-web
        rm ~/Library/LaunchAgents/com.sentifold.router-limits-web.plist

      Then open the app once and turn on Open at Login in its menu:
        open #{opt_prefix}/RouterLimits.app

      After brew upgrade router-limits, choose Quit Router Limits and open it again.

      Before brew uninstall router-limits, turn off Open at Login in its menu, or:
        rm ~/Library/LaunchAgents/com.sentiens.router-limits-menu.plist
    EOS
  end

  test do
    assert_predicate prefix/"RouterLimits.app/Contents/MacOS/RouterLimits", :executable?
    assert_match "router-limits snapshot", shell_output("#{bin}/router-limits --help")
    assert_match "self-test ok", shell_output("#{prefix}/RouterLimits.app/Contents/MacOS/RouterLimits --self-test")
  end
end
