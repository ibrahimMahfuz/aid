import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aid/aid.dart';

void main() {
  const MethodChannel channel = MethodChannel('aid');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Aid.platformVersion, '42');
  });
}
