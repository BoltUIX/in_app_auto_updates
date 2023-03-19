# in_app_auto_updates

Immediate updates are fullscreen UX flows that require the user to update and restart the app in order to continue using it. This UX flow is best for cases where an update is critical to the core functionality of your app. After a user accepts an immediate update, Google Play handles the update installation and app restart.
## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  in_app_auto_updates: ^0.0.3
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:in_app_auto_updates/in_app_auto_updates.dart';
```

3. Call this function in your widget
```dart
InAppUpdate().autoForceUpdate(); // Call this initState
```

<hr>

<table>
<tr>
<td>
<img  src="https://developer.android.com/static/images/app-bundle/immediate_flow.png"  alt="">
</td>
</tr>
</table>


Please refer to the example app for guidance on how to use this plugin.

### Android

For Android devices, this plugin utilizes the official Android APIs for performing in-app updates that were released in 2019. You can find more information on this at:
https://developer.android.com/guide/app-bundle/in-app-updates.

### iOS
However, for iOS devices, there is no built-in functionality for in-app updates. As an alternative, you may want to consider using packages like https://pub.dev/packages/upgrader. If you attempt to use the methods provided by this plugin on an iOS device, you will receive a not-implemented exception.

# Troubleshooting

## Getting ERROR_API_NOT_AVAILABLE error
In case you encounter an ERROR_API_NOT_AVAILABLE error, please note that this plugin cannot be tested locally. It must be installed through Google Play in order to function properly. For more information on In-App Updates from Google, please refer to their official documentation:
https://developer.android.com/guide/playcore/in-app-updates/test