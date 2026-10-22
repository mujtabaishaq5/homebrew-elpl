class Elpl < Formula
  desc "ELPL programming language compiler"
  homepage "https://github.com/mujtabaishaq5/ELPL-Official/"
  url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/elpl-compiler-v7.9.9-17.zip"
  sha256 "dd9ef3b7cff9af07f35aa1610b9f2e6a2a86c00e643ed2f53cff36f8fa9e557f"
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
