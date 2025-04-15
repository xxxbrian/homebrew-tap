class GlobalProtectCli < Formula
  desc "Command-line interface for GlobalProtect VPN"
  homepage "https://github.com/xxxbrian/global-protect"
  url "https://github.com/xxxbrian/global-protect/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "25c9c21555d4df38e1326a0209b58a9af8b32c4d29c18b6c895f573a15bcdfea"
  license "GPL-3.0"
  head "https://github.com/xxxbrian/global-protect.git", branch: "main"

  depends_on "rust" => :build
  depends_on "openconnect"

  def install
    # build all executables
    system "cargo", "build", "--release"
    # install all executables
    bin.install "target/release/gpclient"
    bin.install "target/release/gpservice"
    bin.install "target/release/gpauth"
  end

  test do
    # test version output
    assert_match version.to_s, shell_output("#{bin}/gpclient --version")
    assert_match version.to_s, shell_output("#{bin}/gpservice --version")
    assert_match version.to_s, shell_output("#{bin}/gpauth --version")
  end
end
