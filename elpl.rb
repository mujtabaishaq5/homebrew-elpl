class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  version "7.1.3"
  license "MIT"

  if OS.mac?
    url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPLN.zip"
    sha256 "85726cff4545e5f89336f552d4cc5ab00dd11577ddf45a7c9d1bbdd95e4c8364"
  elsif OS.linux?
    url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/elpl-linux-x64.tar.gz"
    sha256 "bf4301b9eba2e6a9fbdc3beb3aa927a159b1321c95b768eecb3ff169948f53e7"
  end

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
