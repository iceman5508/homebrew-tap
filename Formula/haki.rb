class Haki < Formula
  desc "Statically-typed, ARC-managed, general-purpose programming language"
  homepage "https://haki-lang.dev"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/haki-lang/haki/releases/download/v#{version}/hakic-macos-arm64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_MACOS_ARM64"
    else
      url "https://github.com/haki-lang/haki/releases/download/v#{version}/hakic-macos-x86_64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_MACOS_X86_64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/haki-lang/haki/releases/download/v#{version}/hakic-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_LINUX_ARM64"
    else
      url "https://github.com/haki-lang/haki/releases/download/v#{version}/hakic-linux-x86_64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_LINUX_X86_64"
    end
  end

  # hakic --emit-c requires gcc or clang
  # On macOS, Xcode Command Line Tools provides clang
  # On Linux, gcc is typically already installed
  # We don't make it a hard dependency since it's usually present

  def install
    bin.install "hakic"
  end

  def post_install
    # Create a symlink so 'haki' also works as a command
    (bin/"haki").make_relative_symlink(bin/"hakic") unless (bin/"haki").exist?
  end

  test do
    (testpath/"hello.haki").write <<~HAKI
      fn main() {
          print("Hello from Homebrew!")
      }
    HAKI
    assert_match "Hello from Homebrew!", shell_output("#{bin}/hakic run #{testpath}/hello.haki --quiet")
  end
end
