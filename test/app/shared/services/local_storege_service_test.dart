import 'package:flutter_test/flutter_test.dart';

import 'package:fluttermobx/app/shared/services/local_storege_service.dart';

void main() {
  LocalStoregeService service;

  setUp(() {
    service = LocalStoregeService();
  });

  group('LocalStoregeService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<LocalStoregeService>());
    });
  });
}
