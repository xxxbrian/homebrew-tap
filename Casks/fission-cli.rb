cask "fission-cli" do
  arch arm: "darwin-arm64", intel: "darwin-amd64"

  version "1.21.0"
  sha256 arm:   "e677fd79e7a20ba32086bdc5bf1e43f138a4577cec507e1df07bbd2828e312db",
         intel: "a67e2186c23656e7d748a7e330187cf5c0770c7fee9d85fe6449119b82a3f07a"

  url "https://github.com/fission/fission/releases/download/v#{version}/fission-v#{version}-#{arch}"
  name "Fission"
  desc "Fast and Simple Serverless Functions for Kubernetes"
  homepage "https://fission.io"

  livecheck do
    url :url
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  container type: :naked

  binary "fission-v#{version}-#{arch}", target: "fission"

  zap trash: [
    "~/.fission",
    "~/Library/Saved Application State/io.fission.savedState"
  ]
end
