cask "t3code" do
  arch arm: "arm64", intel: "x64"

  version "0.0.46-preview.20261002.2598"

  on_arm do
    sha256 "cda9bdbd456e554ce6c08a9e8a4a8971abb64018da8d2770f68b36ee5097ca2e"
  end
  on_intel do
    sha256 "e4b9009bbbbc1194a5fe53be742fbcc560586a80e16c1c10364605d3c7f6ad4a"
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

  app "T3 Code (Alpha).app"

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
