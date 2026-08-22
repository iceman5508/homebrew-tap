class Haki < Formula
  desc "A statically-typed, ARC-managed, general-purpose language"
  homepage "https://github.com/iceman5508/haki-lang"
  version "5.0.0"

  on_macos do
    on_arm do
      url "https://github.com/iceman5508/haki-lang/releases/download/v5.0.0/haki_v500_macos_arm64.tar.gz"
      sha256 "3a6f7007c5adbb9e591b027810544cd66d33ecb81a730281fc14178084694052"
    end
  end

  def install
    bin.install "hakic"
    bin.install "haki_runtime_core.c"
    ["haki", "haki-gtk", "haki-dom", "haki-web"].each do |name|
      (bin/name).write <<~SH
        #!/bin/bash
        exec "#{bin}/hakic" "$@"
      SH
      chmod 0755, bin/name
    end
  end

  test do
    (testpath/"hello.haki").write('fn main() { print("Hello from Haki!") }')
    assert_match "Hello from Haki!", shell_output("#{bin}/haki hello.haki")
  end
end
