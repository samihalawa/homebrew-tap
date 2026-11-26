cask "postura" do
  version "1.6.5"
  sha256 "0a0ece23724797ba3e49a75f745ef4df1c9fb0c02b5a53c4d33db325625e20b4"

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
