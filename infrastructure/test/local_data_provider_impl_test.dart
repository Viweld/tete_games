import 'package:core/src/ports/local_data_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/storage/local_data_provider_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocalDataProviderImpl', () {
    late LocalDataProvider provider;

    setUp(() async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      provider = LocalDataProviderImpl(sharedPreferences: prefs);
    });

    test('getValue returns null for missing key', () async {
      expect(await provider.getValue(key: 'missing'), isNull);
    });

    test('setValue persists supported primitive types', () async {
      await provider.setValue(key: 'count', value: 7);
      await provider.setValue(key: 'enabled', value: true);
      await provider.setValue(key: 'ratio', value: 1.5);
      await provider.setValue(key: 'name', value: 'Neo');
      await provider.setValue(key: 'tags', value: <String>['a', 'b']);

      expect(await provider.getValue(key: 'count'), 7);
      expect(await provider.getValue(key: 'enabled'), isTrue);
      expect(await provider.getValue(key: 'ratio'), 1.5);
      expect(await provider.getValue(key: 'name'), 'Neo');
      expect(await provider.getValue(key: 'tags'), <String>['a', 'b']);
    });

    test('setValue stringifies unsupported object types', () async {
      await provider.setValue(key: 'custom', value: Object());

      expect(await provider.getValue(key: 'custom'), "Instance of 'Object'");
    });

    test('deleteValue removes stored entry', () async {
      await provider.setValue(key: 'temp', value: 'value');
      await provider.deleteValue(key: 'temp');

      expect(await provider.getValue(key: 'temp'), isNull);
    });

    test('clearValues removes all entries', () async {
      await provider.setValue(key: 'one', value: '1');
      await provider.setValue(key: 'two', value: '2');
      await provider.clearValues();

      expect(await provider.getValue(key: 'one'), isNull);
      expect(await provider.getValue(key: 'two'), isNull);
    });
  });
}
