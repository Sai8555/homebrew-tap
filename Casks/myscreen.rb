cask "myscreen" do
  version "1.0.0"
  sha256 "85782641e5b071b6d01ff2e2d33622a0d375a22717be2e75f08dacafd2b276c5"

  url "https://github.com/Sai8555/MyScreen/releases/download/v#{version}/MyScreen.dmg"
  name "MyScreen"
  desc "4K live desktop wallpaper manager for macOS"
  homepage "https://github.com/Sai8555/MyScreen"

  depends_on macos: :ventura

  app "MyScreen.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/MyScreen.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/MyScreen",
    "~/Library/Caches/MyScreen",
    "~/Library/Preferences/com.myscreen.app.plist",
  ]
end
