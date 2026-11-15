class Koidrive < Formula
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com"
  version "0.1.0-alpha.6"
  license all_of: ["Apache-2.0", "AGPL-3.0-or-later"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.6/koidrive-aarch64-apple-darwin.tar.gz"
      sha256 "e35b4e6a92454076e90bab07ae07cbf172fb019bc55772ffb39c6f9c2ec505b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.6/koidrive-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ab7aa5852dca653ee07900c221b140162c7b85dff96b2dad3f5c2f453bcb6167"
    end
    on_intel do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.6/koidrive-x86_64-unknown-linux-musl.tar.gz"
      sha256 "750dc8be3959a2144a35597295cac853002eaff37f25771d7d2d16be35256dd8"
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
