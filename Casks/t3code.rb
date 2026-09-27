cask "t3code" do
  arch arm: "arm64", intel: "x64"

  version "0.0.43-nightly.20260926.2318"

  on_arm do
    sha256 "b8241e5b3a5b801fca2b41f9caba5b0eec893cf170a275643437224166b1eeb8"
  end
  on_intel do
    sha256 "43d3a5068f72a4dc6ef1f9901e4ec7d41678c8b75c91103ce8271cdfff8a38b0"
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
