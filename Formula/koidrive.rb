class Koidrive < Formula
  desc "File sync you deploy to your own Cloudflare account"
  homepage "https://koidrive.com"
  version "0.1.0-alpha.2"
  license all_of: ["Apache-2.0", "AGPL-3.0-or-later"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.2/koidrive-aarch64-apple-darwin.tar.gz"
      sha256 "25aa55e949c8283ab6b45aa371076b5efbd9a4a902334f0e7ec050509f6d634f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.2/koidrive-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ae2ec9f531950292e0a8d2214f9507579747752799c623bca2529d04752036e3"
    end
    on_intel do
      url "https://github.com/koidrive/koidrive/releases/download/v0.1.0-alpha.2/koidrive-x86_64-unknown-linux-musl.tar.gz"
      sha256 "59db58278c895df0228a72e1949ea59993ee7e6458b42ac483de0e03166cdbb3"
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
