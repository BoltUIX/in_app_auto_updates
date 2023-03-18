import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_auto_updates/in_app_auto_updates_method_channel.dart';

void main() {
  MethodChannelInAppAutoUpdates platform = MethodChannelInAppAutoUpdates();
  const MethodChannel channel = MethodChannel('in_app_auto_updates');

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