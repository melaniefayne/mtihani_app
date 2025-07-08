#!/bin/bash
set -e

echo "🚀 STARTING CUSTOM BUILD.SH"

# Remove existing Flutter (added by Vercel)
rm -rf flutter

# Clone pinned Flutter version
echo "📦 Cloning Flutter SDK at ea121f8859..."
git clone https://github.com/flutter/flutter.git
cd flutter
git checkout ea121f8859
cd ..

# Set PATH
export PATH="$PWD/flutter/bin:$PATH"

# Confirm version
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