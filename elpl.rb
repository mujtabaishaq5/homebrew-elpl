class Elpl < Formula
  desc "ELPL programming language compiler"
  homepage "https://github.com/mujtabaishaq5/ELPL-Official/"
  url "https://elpl-d8625.web.app/elpl-compiler-v7.5.9.zip"
  sha256 "ad6350200ab1be45ffdac72b9532e1bb26b699e9fc0eb732b744a4db24d8cb12"
  license "MIT"

  # Automatically ensures Java 17+ is installed for the JVM wrapper
  depends_on "openjdk"

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
