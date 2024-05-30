import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:select_one/service/local/hive_db.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'test_utils.dart';

void main() {
  //***** Make sure Flutter init *****
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HiveDB Tests', () {
    setUpAll(() async {
      PathProviderPlatform.instance = FakePathProviderPlatform();
      // init Hive
      await HiveDB.initHive();
    });

    test('should store and retrieve a value', () async {
      const key = 'testKey';
      const value = 'testValue';

      // put
      await HiveDB.putData(key, value);

      // find
      final retrievedValue = HiveDB.getData(key);

      // ==
      expect(retrievedValue, value);
    });

    test('should remove a value', () async {
      const key = 'testKey';
      const value = 'testValue';

      // put
      await HiveDB.putData(key, value);

      // remove
      await HiveDB.removeData(key);

      // find
      final retrievedValue = HiveDB.getData(key);

      // is remove（null）
      expect(retrievedValue, null);
    });

    tearDownAll(() async {
      // close and delete
      await Hive.deleteFromDisk();
    });
  });
}
