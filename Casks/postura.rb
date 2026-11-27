cask "postura" do
  version "1.6.10"
  sha256 "9e1ae88a1a65faf4fada0bcd8a3401a0a473b2b220e4478c73ecf58b86f549ba"

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
