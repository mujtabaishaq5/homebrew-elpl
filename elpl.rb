class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  version "7.1.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (Built via GitHub Actions)
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-arm64.zip"
      sha256 "PASTE_ARM64_HASH_HERE"
    else
      # Intel Mac (Built locally on your 2018 MacBook Pro)
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPLN.zip"
      sha256 "85726cff4545e5f89336f552d4cc5ab00dd11577ddf45a7c9d1bbdd95e4c8364"
    end
  elsif OS.linux?
    # Linux x64 (Built via Docker)
    url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/elpl-linux-x64.tar.gz"
    sha256 "PASTE_LINUX_HASH_HERE"
  end

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
