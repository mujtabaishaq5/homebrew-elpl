class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  version "7.4.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-arm64.zip"
      sha256 "UPDATE_AFTER_RELEASE"
    else
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-intel64.zip"
      sha256 "UPDATE_AFTER_RELEASE"
    end
  elsif OS.linux?
    url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/elpl-linux-x64.tar.gz"
    sha256 "UPDATE_AFTER_RELEASE"
  end

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
