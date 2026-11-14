class Koidrive < Formula
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com"
  version "0.1.0-alpha.4"
  license all_of: ["Apache-2.0", "AGPL-3.0-or-later"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.4/koidrive-aarch64-apple-darwin.tar.gz"
      sha256 "4de5915829b62ff52d39a44855f59870389b16a4f50411e77d1f85033beeb871"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.4/koidrive-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f290d8397d1a9d980749c5251c8ddb4af1c69800957cbb49c55025db7241f812"
    end
    on_intel do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.4/koidrive-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ebb7ac7541ffcbbeb384780b9b0de878379422732ea5777331e03f208daf5c3"
    end
  end

  def install
    bin.install "koi"
  end

  def caveats
    <<~EOS
      To set up Koidrive on this device, run:
        koi setup
    EOS
  end

  test do
    assert_equal "koi #{version}", shell_output("#{bin}/koi --version").strip
  end
end
