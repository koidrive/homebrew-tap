cask "koidrive" do
  version "0.1.0-alpha.3"
  sha256 "d8590ecb09e59c0414122329ad5c530b1e26fca0363e820b0c18d22dd671a2c7"

  url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.3/Koidrive-#{version}-arm64.dmg"
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
