class Haki < Formula
  desc "A statically-typed, ARC-managed, general-purpose language"
  homepage "https://github.com/iceman5508/haki-lang"
  version "5.0.0"

  on_macos do
    on_arm do
      url "https://github.com/iceman5508/haki-lang/releases/download/v5.0.0/haki_v500_macos_arm64.tar.gz"
      sha256 "622dd96a2e3da7fd342792329afb928156ec2c1b4deda2297c5a5c0355b5a1e2"
    end
  end

  def install
    bin.install "haki_release_pkg/hakic" => "hakic"
    (lib/"haki").install "haki_release_pkg/haki_runtime_core.c"
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
