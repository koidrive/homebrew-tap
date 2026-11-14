class Koidrive < Formula
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com"
  version "0.1.0-alpha.3"
  license all_of: ["Apache-2.0", "AGPL-3.0-or-later"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.3/koidrive-aarch64-apple-darwin.tar.gz"
      sha256 "3fcd5e62e76d20afa3f48b5e8d223c8557b8af8fdd60ce454ae279647437ea18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.3/koidrive-aarch64-unknown-linux-musl.tar.gz"
      sha256 "52c55932091231a6a03e85039f79704ef37ccf43245d1e4789a7f136672164f7"
    end
    on_intel do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.3/koidrive-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f8a44548fb7efe7bcbf9afadf010bffb6335b67e77f4beb1ee8b690f38c91424"
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
