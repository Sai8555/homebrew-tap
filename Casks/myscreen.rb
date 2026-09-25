cask "myscreen" do
  version "1.0.0"
  sha256 "dc0ac512c307f4c36ed9736d3d67fd7abe4d6de5089ed4c7a56e25485cd00af6"

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
