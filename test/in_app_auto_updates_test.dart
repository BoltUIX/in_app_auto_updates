import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_auto_updates/in_app_auto_updates.dart';
import 'package:in_app_auto_updates/in_app_auto_updates_platform_interface.dart';
import 'package:in_app_auto_updates/in_app_auto_updates_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInAppAutoUpdatesPlatform
    with MockPlatformInterfaceMixin
    implements InAppAutoUpdatesPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InAppAutoUpdatesPlatform initialPlatform = InAppAutoUpdatesPlatform.instance;

  test('$MethodChannelInAppAutoUpdates is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInAppAutoUpdates>());
  });

  test('getPlatformVersion', () async {
    InAppAutoUpdates inAppAutoUpdatesPlugin = InAppAutoUpdates();
    MockInAppAutoUpdatesPlatform fakePlatform = MockInAppAutoUpdatesPlatform();
    InAppAutoUpdatesPlatform.instance = fakePlatform;

    expect(await inAppAutoUpdatesPlugin.getPlatformVersion(), '42');
  });
}
