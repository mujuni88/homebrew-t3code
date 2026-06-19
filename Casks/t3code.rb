cask "t3code" do
  arch arm: "arm64", intel: "x64"

  version "0.0.28-nightly.20260619.602"

  on_arm do
    sha256 "1d39525e9ba81c7ae6f7e0953d869b503bcef1d3e9a9830fb7af2c7e6539406d"
  end
  on_intel do
    sha256 "f095b37fbbac6e0e46c9bfe5d3b13b5629094b62da61690c71b8867ba081f195"
  end

  url "https://github.com/pingdotgg/t3code/releases/download/v#{version}/T3-Code-#{version}-#{arch}.zip",
      verified: "github.com/pingdotgg/t3code/"
  name "T3 Code"
  desc "AI-powered coding assistant built on Effect"
  homepage "https://t3.chat/code"

  livecheck do
    url "https://github.com/pingdotgg/t3code/releases"
    regex(/T3-Code-(\d+(?:\.\d+)+(?:-nightly\.\d+\.\d+)?)-arm64\.zip/i)
    strategy :page_match
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "T3 Code (Nightly).app"

  zap trash: [
    "~/Library/Application Support/t3code",
    "~/Library/Application Support/T3 Code (Nightly)",
    "~/Library/Caches/com.t3tools.t3code",
    "~/Library/Caches/com.t3tools.t3code.ShipIt",
    "~/Library/Preferences/com.t3tools.t3code.plist",
    "~/Library/Saved Application State/com.t3tools.t3code.savedState",
    "~/.t3",
  ]
end
