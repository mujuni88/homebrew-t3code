cask "t3code" do
  arch arm: "arm64", intel: "x64"

  version "0.0.37-nightly.20260829.1219"

  on_arm do
    sha256 "8dc1527880a0febf1f3a91522aebf9312651c80bb1f636a5c2b9c43a654a6ac7"
  end
  on_intel do
    sha256 "973c6b6254c6a614cc765a9a6915caff1b36ca3c1e97adb5b1796e21490a70d5"
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
