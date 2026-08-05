class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://github.com/mujtabaishaq5/homebrew-elpl"
  version "7.1.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      # Apple Silicon (Built via GitHub Actions)
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-arm64.zip"
      sha256 "aa8adda40944d988852a1e091a96c396b2803ba71a9b07d34987579eaee6711e"
    else
      # Intel Mac (Built locally on your 2018 MacBook Pro)
      url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/ELPL-mac-intel64.zip"
      sha256 "5f6703bde2885f32e78749e5eab930702dccb9be8382ab0370f827e68239c298"
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
