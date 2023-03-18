import 'dart:io' show Platform;
import 'package:flutter/services.dart';

class InAppUpdates {
  void doInAppUpdates() {
    if (Platform.isAndroid) {
      // ver 1
      // Define a MethodChannel with the name "android/updates"
      const channel = MethodChannel("android/updates");

      // Call the "checkUpdate" method on the channel and handle the result asynchronously
      channel.invokeMethod<bool>("checkUpdate").then((value) {
        // If the returned value is true (i.e., an update is available), call the "performImmediateUpdate" method on the same channel
        if (value == true) {
          channel.invokeMethod("performImmediateUpdate");
        }
      });
    } else if (Platform.isIOS) {
      // ver 2
    } else {
      // ver 2
    }
  }
}
