cask "mycat" do
  arch arm: "arm64", intel: "x64"

  version "0.1.37"
  sha256 arm:   "c3a6e91e6b1876d78e4c825cde6fb2bf556be4a0a1c7a205b66bd07ac63e3c0c",
         intel: "cebe80bfaf30d1c5d92499f3b14cf8f126141e2cd2442447325c3b6efcbbb562"

  url "https://github.com/yumiaura/myCat/releases/download/#{version}/mycat-macos-#{arch}.zip"
  name "myCat"
  desc "Tiny animated desktop pet cat"
  homepage "https://github.com/yumiaura/myCat"

  # Bumped by the myCat release workflow on every tag.
  livecheck do
    url :url
    strategy :github_latest
  end

  app "mycat.app"

  zap trash: [
    "~/.config/myCat",
    "~/Library/Application Support/mycat",
  ]

  caveats <<~EOS
    mycat.app is not signed by Apple. The first time, open it with a right-click
    on mycat.app in Applications and "Open", or allow it in
    System Settings > Privacy & Security.
  EOS
end
