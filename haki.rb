class Haki < Formula
  desc "Haki programming language compiler"
  homepage "https://github.com/iceman5508/haki-lang"
  version "5.0.0"
  url "https://github.com/iceman5508/haki-lang/releases/download/v5.0.0/hakic_v500"
  sha256 "78c2e34c5b61669674c6559b1e09218098f853ae658adda51f3c4805f9ad5bfb"

  def install
    bin.install "hakic_v500" => "haki"
    bin.install "hakic_v500" => "hakic"
  end

  test do
    (testpath/"hello.haki").write('fn main() { print("hello") }')
    assert_match "hello", shell_output("#{bin}/haki hello.haki")
  end
end
