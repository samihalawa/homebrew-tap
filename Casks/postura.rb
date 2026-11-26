cask "postura" do
  version "1.6.4"
  sha256 "a9d19c9d4f0fed68fe186fcd1be949d2a9baccf4a5dd7d6739efc6c073bcab05"

  url "https://github.com/samihalawa/postura/releases/download/v#{version}/Postura-#{version}.zip"
  name "Postura"
  desc "Posture coach with gradual screen cover and Dock controls"
  homepage "https://github.com/samihalawa/postura"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
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
    Open Postura from the Dock and allow camera access.
    The first launch sets up the local posture model.
  EOS
end
