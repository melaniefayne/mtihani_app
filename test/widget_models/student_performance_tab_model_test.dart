import 'package:flutter_test/flutter_test.dart';
import 'package:mtihani_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('StudentPerformanceTabModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
