class Koidrive < Formula
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com"
  version "0.1.0-alpha.7"
  license all_of: ["Apache-2.0", "AGPL-3.0-or-later"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.7/koidrive-aarch64-apple-darwin.tar.gz"
      sha256 "da15771ffe7d8c220603ed61c01052ab4631b6068cc776866fc5a7e14a550568"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.7/koidrive-aarch64-unknown-linux-musl.tar.gz"
      sha256 "89fefbc03d4c944f66b2b8cb06b511f9999ff6cbafafdd7f894b1ba867b93971"
    end
    on_intel do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.7/koidrive-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a9959711099b78ea4dde8cbcebe0b62bcfd56d56e8c496184222fa25b0579285"
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
