class Haki < Formula
  desc "Statically-typed, ARC-managed, general-purpose programming language"
  homepage "https://github.com/iceman5508/haki-lang"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iceman5508/haki-lang/releases/download/v#{version}/hakic-macos-arm64.tar.gz"
      sha256 "91e372b1514f998d17f44906b149681ac8f1d2752cc4a3680c53786c817436f8"
    else
      url "https://github.com/iceman5508/haki-lang/releases/download/v#{version}/hakic-macos-x86_64.tar.gz"
      sha256 "b0a05a6ce804f1d85b1d49576a76b1d4968def48f8ae63de183b8be2a748fee9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iceman5508/haki-lang/releases/download/v#{version}/hakic-linux-arm64.tar.gz"
      sha256 "31583fcf0145e5b91c743079c9e4ec28fe3a533ba44a2c39f8511fafb0daf6b0"
    else
      url "https://github.com/iceman5508/haki-lang/releases/download/v#{version}/hakic-linux-x86_64.tar.gz"
      sha256 "43e0794ed604481c4284626812e88761ba51ae4ae407f9e40c5ae67919606ab4"
    end
  end

  def install
    bin.install "hakic"
  end

  def post_install
    (bin/"haki").make_relative_symlink(bin/"hakic") unless (bin/"haki").exist?
  end

  test do
    (testpath/"hello.haki").write <<~HAKI
      fn main() {
          print("Hello from Homebrew!")
      }
    HAKI
    assert_match "Hello from Homebrew!", shell_output("#{bin}/hakic #{testpath}/hello.haki --emit-c -o #{testpath}/hello_bin --quiet && #{testpath}/hello_bin")
  end
end