class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL.zip"
  version "7.1.3"
  sha256 "bca9816b0dc666433e71a350d083ff9deb42eb3f850ae314bf73301b90ac0405"
  license "MIT"

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
