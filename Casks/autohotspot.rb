cask "autohotspot" do
  version "1.0.2"
  sha256 "cd67fa197cd8ae50bac3cc477247e46c2aa088f1e486f90f6ed142c78b3a5388"

  url "https://github.com/samihalawa/mac-auto-hotspot/releases/download/v#{version}/AutoHotspot-#{version}.zip"
  name "Auto Hotspot"
  desc "Menu bar app that joins an iPhone Personal Hotspot when Wi-Fi drops"
  homepage "https://github.com/samihalawa/mac-auto-hotspot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "AutoHotspot.app"
  binary "#{appdir}/AutoHotspot.app/Contents/MacOS/AutoHotspot", target: "autohotspot"

  uninstall launchctl: "io.github.samihalawa.autohotspot",
            quit:      "io.github.samihalawa.autohotspot",
            delete:    "~/Library/LaunchAgents/io.github.samihalawa.autohotspot.plist"

  zap trash: [
    "~/Library/Logs/AutoHotspot.log",
    "~/Library/Preferences/io.github.samihalawa.autohotspot.plist",
  ]
end
