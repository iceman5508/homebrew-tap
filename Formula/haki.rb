class Haki < Formula
  desc "A statically-typed, ARC-managed, general-purpose language"
  homepage "https://github.com/iceman5508/haki-lang"
  version "5.0.0"

  on_macos do
    on_arm do
      url "https://github.com/iceman5508/haki-lang/releases/download/v5.0.0/hakic_v500"
      sha256 "78c2e34c5b61669674c6559b1e09218098f853ae658adda51f3c4805f9ad5bfb"
    end
  end

  def install
    bin.install "hakic_v500" => "hakic"
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
