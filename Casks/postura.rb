cask "postura" do
  version "1.6.0"
  sha256 "ef1b163a59c9263da7f4c33cac8d5a2cfc4cd1e292ed5f2adfba1143140ee43a"

  url "https://github.com/samihalawa/postura/releases/download/v#{version}/Postura-#{version}.zip"
  name "Postura"
  desc "Camera posture guard that covers the screen with a glow when you slouch"
  homepage "https://github.com/samihalawa/postura"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on formula: "uv"

  app "Postura.app"

  uninstall launchctl: "io.github.samihalawa.postura",
            quit:      "io.github.samihalawa.postura",
            delete:    "~/Library/LaunchAgents/io.github.samihalawa.postura.plist"

  zap trash: [
    "~/Library/Application Support/Postura",
    "~/Library/Logs/postura-features.jsonl",
    "~/Library/Logs/postura-setup.log",
    "~/Library/Logs/postura.log",
    "~/Library/Logs/postura.out.log",
    "~/Library/Preferences/io.github.samihalawa.postura.plist",
  ]

  caveats <<~EOS
    Open Postura once: it lives in the menu bar, keeps itself running and
    sets up its posture model on first launch (about a minute).
  EOS
end
