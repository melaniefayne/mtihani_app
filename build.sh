#!/bin/bash
set -e

echo "🚀 STARTING CUSTOM BUILD.SH"

# Clone specific Flutter version only if not already present
if [ ! -d "flutter" ]; then
  echo "📦 Cloning Flutter SDK at ea121f8859..."
  git clone https://github.com/flutter/flutter.git
  cd flutter
  git checkout ea121f8859
  cd ..
else
  echo "✔️ Flutter SDK already cloned"
fi

# Add flutter to PATH
export PATH="$PWD/flutter/bin:$PATH"

# Verify
flutter --version
flutter doctor

# Enable web
flutter config --enable-web

# Get packages
flutter pub get

# Build
echo "🛠️  Building Flutter Web app..."
flutter build web --release

echo "✅ DONE"