#!/bin/bash

# Clone specific Flutter version only if not already cloned
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable
  cd flutter
  git checkout ea121f8859  # same as local version
  cd ..
fi

# Export flutter path
export PATH="$PWD/flutter/bin:$PATH"

# Enable web and build
flutter doctor
flutter config --enable-web
flutter pub get
flutter build web --release