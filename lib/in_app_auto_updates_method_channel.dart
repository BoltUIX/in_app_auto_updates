import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'in_app_auto_updates_platform_interface.dart';

/// An implementation of [InAppAutoUpdatesPlatform] that uses method channels.
class MethodChannelInAppAutoUpdates extends InAppAutoUpdatesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('in_app_auto_updates');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
