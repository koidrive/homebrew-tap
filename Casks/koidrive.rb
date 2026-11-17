cask "koidrive" do
  version "0.1.0-alpha.7"
  sha256 "ee93f3c7389faf5236e2f7cfff6af5122542391a3e5b57891c4de3cc35ced256"

  url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.7/Koidrive-#{version}-arm64.dmg"
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
