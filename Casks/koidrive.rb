cask "koidrive" do
  version "0.1.0-alpha.5"
  sha256 "949576c8194bf3570fc701084fe03d8acf5acf9b17892022453c00543ae87e0a"

  url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.5/Koidrive-#{version}-arm64.dmg"
  name "Koidrive"
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Koidrive.app"
  binary "#{appdir}/Koidrive.app/Contents/Helpers/koi"

  uninstall quit: "dev.koidrive.Koidrive"

  zap script: {
        executable: "#{appdir}/Koidrive.app/Contents/MacOS/Koidrive",
        args:       ["--unregister-login-item"],
        sudo:       false,
      },
      trash:  [
        "~/Library/Application Support/Koidrive",
        "~/Library/Preferences/dev.koidrive.Koidrive.plist",
      ]

  caveats <<~EOS
    For full removal of the app, its login item and preferences, run:
      brew uninstall --zap --cask koidrive
  EOS
end
