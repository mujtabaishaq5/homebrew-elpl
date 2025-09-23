class Elpl < Formula
  desc "ELPL programming language"
  homepage "https://example.com" # your website
  url "https://mujtabaishaq5.github.io/ELPL-Official/ELPL.zip" # binary URL
  sha256 "6dcec4ffd5a1d2a52a1969d2b2ca221d7037036f4d92a7b9962081ec9292bc64"
  license "MIT"

  def install
    bin.install "elpl"
  end

  test do
    system "#{bin}/elpl", "--version"
  end
end
