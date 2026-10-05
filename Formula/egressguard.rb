class Egressguard < Formula
  desc "VPN kill switch for macOS: trusted networks, VPN tunnels, or nothing"
  homepage "https://github.com/sentiens/egressguard"
  url "https://github.com/sentiens/egressguard/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e46b1a58ae6af706f844f3f19a7bc84493ed3ca26357445d79cdad00669316fb"
  license "MIT"
  head "https://github.com/sentiens/egressguard.git", branch: "main"

  depends_on "go" => :build
  depends_on macos: :sonoma

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      EgressGuard is not active yet. Install the root daemon and the menu bar app:
        sudo egressguard setup

      After every `brew upgrade egressguard`, run it again: the daemon runs from a
      root-owned copy of the binary in /Library/Application Support/EgressGuard.

      Before `brew uninstall egressguard`, remove the daemon and its pf rules:
        sudo egressguard uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/egressguard version")
    assert_predicate prefix/"EgressGuard.app/Contents/MacOS/EgressGuard", :executable?
    assert_path_exists libexec/"setup.sh"
    assert_match "egressguard", shell_output("#{bin}/egressguard help")
  end
end
