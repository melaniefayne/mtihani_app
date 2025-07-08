#!/bin/bash
set -e

echo "🚀 STARTING CUSTOM BUILD.SH"

# Clone Flutter SDK at your working commit if not already there
if [ ! -d "flutter" ]; then
  echo "📦 Cloning Flutter SDK..."
  git clone https://github.com/flutter/flutter.git
  cd flutter
  git checkout ea121f8859
  cd ..
fi

export PATH="$PWD/flutter/bin:$PATH"

flutter doctor
flutter config --enable-web
flutter pub get

echo "🛠️  Building Flutter Web app..."
flutter build web --release

echo "✅ DONE"