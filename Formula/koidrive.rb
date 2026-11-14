class Koidrive < Formula
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com"
  version "0.1.0-alpha.5"
  license all_of: ["Apache-2.0", "AGPL-3.0-or-later"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.5/koidrive-aarch64-apple-darwin.tar.gz"
      sha256 "7db9f25fa713eeff4b5439e669637b17a7a42b117075d45e4ba0ac97dcdfca1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.5/koidrive-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d02fb61575c63a2dbf25340140b9227aa5529a434851b8e303d6afa9fe88b6ba"
    end
    on_intel do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.5/koidrive-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4c816645457bb31e1f6264a9e698fcf9ed55734865167d8886a86a717acd35ab"
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
