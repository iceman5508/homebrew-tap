class Haki < Formula
  desc "Statically-typed, ARC-managed, general-purpose programming language"
  homepage "https://github.com/iceman5508/haki-lang"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/iceman5508/haki-lang/releases/download/v#{version}/hakic-macos-arm64.tar.gz"
      sha256 "7270bbc7f221572c18dedf3faabb01fa37e83a32e4bfa0d9f527198c943e3f17"
    else
      url "https://github.com/iceman5508/haki-lang/releases/download/v#{version}/hakic-macos-x86_64.tar.gz"
      sha256 "7ed68b7e8af9d77ee3d94cf54d7e66d6c5598c0b72e9c66971b6d48b6bca58ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/iceman5508/haki-lang/releases/download/v#{version}/hakic-linux-arm64.tar.gz"
      sha256 "0c478061fa12e9feff6c6c2c1a1ed6cd3d1f4e60b6943a8312c0d2a71e0dde91"
    else
      url "https://github.com/iceman5508/haki-lang/releases/download/v#{version}/hakic-linux-x86_64.tar.gz"
      sha256 "088212a605f764a805884b4b332bc196fcb31a8af09d07d6b55fa9754623a134"
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