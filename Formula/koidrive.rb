class Koidrive < Formula
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com"
  version "0.1.0-alpha.8"
  license all_of: ["Apache-2.0", "AGPL-3.0-or-later"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.8/koidrive-aarch64-apple-darwin.tar.gz"
      sha256 "2a0bcaec264e52729a01fac5aaf3ebd5bcae16d7c267daa54eb30cfc20861732"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.8/koidrive-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e0107acfc128a1278c275c6d274fb228f9db04731e56ad8b28ccdbacb546b031"
    end
    on_intel do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.8/koidrive-x86_64-unknown-linux-musl.tar.gz"
      sha256 "151ada002db932663a51f109a67a2e2499ec69e6a35459b5b10951b79917fcb9"
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
