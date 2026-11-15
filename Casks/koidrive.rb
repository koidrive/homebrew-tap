cask "koidrive" do
  version "0.1.0-alpha.6"
  sha256 "f3d1c589ad7abfd7d13d4cc7cd7a7d419b9c4fb08ec4f5cbc828496029cf396c"

  url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.6/Koidrive-#{version}-arm64.dmg"
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
