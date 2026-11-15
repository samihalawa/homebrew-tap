cask "auto-hotspot" do
  version "1.0.2"
  sha256 "cd67fa197cd8ae50bac3cc477247e46c2aa088f1e486f90f6ed142c78b3a5388"

  url "https://github.com/samihalawa/mac-auto-hotspot/releases/download/v#{version}/AutoHotspot-#{version}.zip"
  name "Auto Hotspot"
  desc "Joins your iPhone Personal Hotspot automatically when Wi-Fi drops"
  homepage "https://github.com/samihalawa/mac-auto-hotspot"

  depends_on macos: ">= :ventura"

  app "AutoHotspot.app"
  binary "#{appdir}/AutoHotspot.app/Contents/MacOS/AutoHotspot", target: "auto-hotspot"

  uninstall launchctl: "io.github.samihalawa.autohotspot",
            quit:      "io.github.samihalawa.autohotspot",
            delete:    "~/Library/LaunchAgents/io.github.samihalawa.autohotspot.plist"

  zap trash: [
    "~/Library/Logs/AutoHotspot.log",
    "~/Library/Preferences/io.github.samihalawa.autohotspot.plist",
  ]

  caveats <<~EOS
    Open Auto Hotspot once from Applications to put it in the menu bar and add its login item.
  EOS
end
