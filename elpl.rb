class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  version "7.1.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (Built via GitHub Actions)
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-arm64.zip"
      sha256 "f32e07c54db9c20260e07648f2ed1809a2a21b57196fc3a541c563dd0252e0e1"
    else
      # Intel Mac (Built locally on your 2018 MacBook Pro)
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-intel64.zip"
      sha256 "85726cff4545e5f89336f552d4cc5ab00dd11577ddf45a7c9d1bbdd95e4c8364"
    end
  elsif OS.linux?
    # Linux x64 (Built via Docker)
    url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/elpl-linux-x64.tar.gz"
    sha256 "e892b000a0f46d4f0e6356eb317588289f3c51e041cf18d30563c54424702606"
  end

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--v"
  end
end
