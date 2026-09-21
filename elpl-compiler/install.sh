#!/bin/bash
set -e
INSTALL_DIR="$HOME/.elpl-compiler"

echo "🚀 Installing ELPL Compiler..."
mkdir -p "$INSTALL_DIR/bin"
mkdir -p "$INSTALL_DIR/lib"

cp -R bin/* "$INSTALL_DIR/bin/"
cp -R lib/* "$INSTALL_DIR/lib/"
chmod +x "$INSTALL_DIR/bin/elplc"

SHELL_RC="$HOME/.zshrc"
[ ! -f "$SHELL_RC" ] && [ -f "$HOME/.bash_profile" ] && SHELL_RC="$HOME/.bash_profile"
[ ! -f "$SHELL_RC" ] && [ -f "$HOME/.bashrc" ] && SHELL_RC="$HOME/.bashrc"

if ! grep -q "\.elpl-compiler/bin" "$SHELL_RC"; then
    echo "" >> "$SHELL_RC"
    echo "# ELPL SDK Path" >> "$SHELL_RC"
    echo "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" >> "$SHELL_RC"
    echo "✅ Added $INSTALL_DIR/bin to PATH in $SHELL_RC"
else
    echo "ℹ️ PATH already configured in $SHELL_RC"
fi

if ! command -v java &> /dev/null; then
    echo "⚠️ Warning: Java is not detected in your PATH. 'elplc' is a JVM-based compiler, it requires Java 17 or higher to execute."
fi

echo "🎉 Installation complete! Run 'source $SHELL_RC' or restart your terminal."
