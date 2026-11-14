cask "auto-hotspot" do
  version "1.0.1"
  sha256 "a5f64ea52d479a017e5ff32b25f64f608730e71ac5dff474b07b5534c1dcc4b1"

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
    It is not notarized: if macOS blocks it, right-click the app and choose Open.
  EOS
end
