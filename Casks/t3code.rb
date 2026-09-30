cask "t3code" do
  arch arm: "arm64", intel: "x64"

  version "0.0.45-nightly.20260930.2481"

  on_arm do
    sha256 "4cfb1b0ba5db36fa2d33cffff18a52681c5cab8c8af0fbc7d74151f4f8c32307"
  end
  on_intel do
    sha256 "feab1aac25cf1d588f268388c97f29219c754ac78ab0067d4deb9027ba84e6b7"
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
