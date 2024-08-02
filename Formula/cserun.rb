class Cserun < Formula
  desc "CSERun is a utility tool designed to assist UNSW CSE students in running course commands such as autotest and give in their local environment."
  homepage "https://cserun.bojin.co"
  version "0.1.0"
  url "https://github.com/xxxbrian/cserun/archive/refs/tags/v#{version}.tar.gz"
  sha256 "e275267466ff4b8f8ae01b196b08334bba5d720f0291d06055eb8991f4569fe3"
  license "MIT"
  head "https://github.com/xxxbrian/cserun.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    system "#{bin}/cserun", "--config"
  end

  test do
    assert_match "cserun #{version}", shell_output("#{bin}/cserun --version")
    assert_match(/Config file created at ".*\/.config\/cserun\/config\.toml", please fill in the necessary information/, shell_output("#{bin}/cserun --config"))
  end
end
