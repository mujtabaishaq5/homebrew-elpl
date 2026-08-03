class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPLN.zip"
  version "7.1.3"
  sha256 "85726cff4545e5f89336f552d4cc5ab00dd11577ddf45a7c9d1bbdd95e4c8364"
  license "MIT"

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
