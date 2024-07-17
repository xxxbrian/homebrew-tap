cask "alacritty-full" do
  version "0.13.2-patch.6"
  sha256 "fd5fa2c4f6396214e32e4cf3f07224ae087d2336e19a95fd94beacd8d5ef0720"

  url "https://github.com/xxxbrian/alacritty/releases/download/v#{version}/Alacritty-v#{version}.dmg"
  name "Alacritty"
  desc "GPU-accelerated terminal emulator"
  homepage "https://github.com/xxxbrian/alacritty/"

  livecheck do
    url :url
    # regex(/v?(\d+(?:\.\d+)+)/i)
    # should include the patch version
    regex(/v?(\d+(?:\.\d+)+-patch\.\d+)/i)
    strategy :github_latest
  end

  app "Alacritty.app"
  binary "Alacritty.app/Contents/MacOS/alacritty"
  binary "Alacritty.app/Contents/Resources/completions/_alacritty",
         target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_alacritty"
  binary "Alacritty.app/Contents/Resources/completions/alacritty.bash",
         target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/alacritty"
  binary "Alacritty.app/Contents/Resources/completions/alacritty.fish",
         target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/alacritty.fish"
  binary "Alacritty.app/Contents/Resources/61/alacritty",
         target: "#{ENV.fetch("TERMINFO", "~/.terminfo")}/61/alacritty"
  binary "Alacritty.app/Contents/Resources/61/alacritty-direct",
         target: "#{ENV.fetch("TERMINFO", "~/.terminfo")}/61/alacritty-direct"
  manpage "Alacritty.app/Contents/Resources/alacritty.1.gz"
  manpage "Alacritty.app/Contents/Resources/alacritty.5.gz"
  manpage "Alacritty.app/Contents/Resources/alacritty-msg.1.gz"
  manpage "Alacritty.app/Contents/Resources/alacritty-bindings.5.gz"

  zap trash: [
    "~/Library/Preferences/io.alacritty.plist",
    "~/Library/Saved Application State/io.alacritty.savedState",
  ]
end
