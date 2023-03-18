
import 'in_app_auto_updates_platform_interface.dart';

class InAppAutoUpdates {
  Future<String?> getPlatformVersion() {
    return InAppAutoUpdatesPlatform.instance.getPlatformVersion();
  }
}
