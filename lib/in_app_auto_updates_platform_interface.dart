import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'in_app_auto_updates_method_channel.dart';

abstract class InAppAutoUpdatesPlatform extends PlatformInterface {
  /// Constructs a InAppAutoUpdatesPlatform.
  InAppAutoUpdatesPlatform() : super(token: _token);

  static final Object _token = Object();

  static InAppAutoUpdatesPlatform _instance = MethodChannelInAppAutoUpdates();

  /// The default instance of [InAppAutoUpdatesPlatform] to use.
  ///
  /// Defaults to [MethodChannelInAppAutoUpdates].
  static InAppAutoUpdatesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InAppAutoUpdatesPlatform] when
  /// they register themselves.
  static set instance(InAppAutoUpdatesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
