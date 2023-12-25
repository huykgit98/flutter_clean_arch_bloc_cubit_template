FROM cirrusci/flutter
COPY . /app
WORKDIR /app
RUN flutter doctor -v
RUN flutter config --no-analytics
RUN flutter pub get
RUN flutter clean
RUN flutter --version
RUN flutter pub global activate junitreport
RUN export PATH="$PATH":"$HOME/.pub-cache/bin"
RUN export PATH="$PATH:`pwd`/flutter/bin/cache/dart-sdk/bin"
RUN flutter test --machine | tojunit --output TestResults.xml
RUN flutter build apk -t ./lib/main-int.dart
