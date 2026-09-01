class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  version "7.4.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-arm64.zip"
      sha256 "fd9282b81b0a07f8814b45c999c9086c55a2de2c97b915dc44348a78af7a5a31"
    else
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-intel64.zip"
      sha256 "2dd1cf99e62bc82f2a5740a58e100d7d73845998f7d56e99efe565796a78f504"
    end
  elsif OS.linux?
    url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/elpl-linux-x64.tar.gz"
    sha256 "0eb848e3500da657ec68407393122295c1cd710d5ed154c25dd3e3a86b431be4"
  end

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
