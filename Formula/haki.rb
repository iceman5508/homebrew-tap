class Haki < Formula
  desc "A statically-typed, ARC-managed, general-purpose language"
  homepage "https://github.com/iceman5508/haki-lang"
  version "2.1.0"

  on_macos do
    on_arm do
      url "https://github.com/iceman5508/haki-lang/releases/download/v2.1.0/hakic-macos-arm64.tar.gz"
      sha256 "41b5d057c54477af59f0136f9f0968251d8aee75ff8b8e35385fc239c5ece488"
    end
    on_intel do
      url "https://github.com/iceman5508/haki-lang/releases/download/v2.1.0/hakic-macos-x86_64.tar.gz"
      sha256 "a9a7fef0b0b1b9f398c46201941df77e8671aecd58cf5021a253e98700b62612"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iceman5508/haki-lang/releases/download/v2.1.0/hakic-linux-arm64.tar.gz"
      sha256 "d42280f911a1ad6ec2e16a95b8057f27778941a14e59d226669b1457b9329045"
    end
    on_intel do
      url "https://github.com/iceman5508/haki-lang/releases/download/v2.1.0/hakic-linux-x86_64.tar.gz"
      sha256 "e29982f94b6fc9d721dbb40833055b07d9422630c52eaec04fe202045317dd17"
    end
  end

  def install
    bin.install "hakic"
    bin.install_symlink "hakic" => "haki"
    bin.install_symlink "hakic" => "haki-gtk"
    bin.install_symlink "hakic" => "haki-dom"
    bin.install_symlink "hakic" => "haki-web"
  end

  test do
    (testpath/"hello.haki").write('fn main() { print("Hello from Haki!") }')
    assert_match "Hello from Haki!", shell_output("#{bin}/haki hello.haki")
  end
end