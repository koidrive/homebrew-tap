cask "koidrive" do
  version "0.1.0-alpha.8"
  sha256 "b7aa642702a5ce4284481c28197afd6ad1b74de338f4874c87afa5429ddb213e"

  url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.8/Koidrive-#{version}-arm64.dmg"
  name "Koidrive"
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com/"

  auto_updates true
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
    To remove Koidrive with its background service, settings and sync state, run:
      koi uninstall
  EOS
end
