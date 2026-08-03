class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL.zip"
  version "7.1.3"
  sha256 "0e45a761fe790a2f3960291a3515fb3acb4a911e6f46381ddb918aeed368c6f2"
  license "MIT"

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
