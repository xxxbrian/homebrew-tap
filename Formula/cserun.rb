class Cserun < Formula
  desc "Utility tool for UNSW CSE students to run course commands locally"
  homepage "https://cserun.bojin.co"
  url "https://github.com/xxxbrian/cserun/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "68b0162a28eb16d6ce6703e72cab2030e469fdd8d61690c798c031cae595d3cc"
  license "MIT"
  head "https://github.com/xxxbrian/cserun.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    system bin/"cserun", "--config"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cserun --version")
    config_pattern = %r{Config file created at ".*/.config/cserun/config.toml",
                       please fill in the necessary information}x
    assert_match config_pattern, shell_output("#{bin}/cserun --config")
  end
end
