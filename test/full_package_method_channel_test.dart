import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:full_package/full_package_method_channel.dart';

void main() {
  MethodChannelFullPackage platform = MethodChannelFullPackage();
  const MethodChannel channel = MethodChannel('full_package');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
