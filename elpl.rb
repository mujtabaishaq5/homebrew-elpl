class Elpl < Formula
  desc "ELPL programming language compiler"
  homepage "https://github.com/mujtabaishaq5/ELPL-Official/"
  url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/elpl-compiler-v7.6.0.zip"
  sha256 "2a35b7afe063d5d40e0f22addf705dabacbbd0b8a0dc891cf069ed3a57a6e34d"
  license "MIT"

  def install
    # Installs the bin and lib directories into Homebrew's private libexec
    libexec.install "bin", "lib"

    # Symlinks your 'elplc' wrapper script into the global system path
    bin.install_symlink libexec/"bin/elplc"
  end

  test do
    # Validates that the compiler command executes successfully
    assert_match "ELPL version", shell_output("#{bin}/elplc --v")
  end
end
