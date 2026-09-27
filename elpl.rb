class Elpl < Formula
  desc "ELPL programming language compiler"
  homepage "https://github.com/mujtabaishaq5/ELPL-Official/"
  url "https://github.com/mujtabaishaq5/homebrew-elpl/releases/download/programminglanguage/elpl-compiler-v7.6.0.zip"
  sha256 "af8769b8ab13dfe0d92606fc4e7c010e7614ca520605d6ea4213824880dd79db"
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
