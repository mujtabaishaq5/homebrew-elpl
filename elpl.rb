class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  version "7.4.2"
  license "MIT"
  depends_on "openjdk@17"

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
    sha256 "9e456f4cc193545d8fea0577afcb69231275dbad42a298edd33db00719b37cf5"
  end

  def install
    bin.install "bin/elpl"
    (lib/"elplc").install "lib/elplc/elplc.jar"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
