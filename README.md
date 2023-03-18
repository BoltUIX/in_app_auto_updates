# in_app_auto_updates

Immediate updates are fullscreen UX flows that require the user to update and restart the app in order to continue using it. This UX flow is best for cases where an update is critical to the core functionality of your app. After a user accepts an immediate update, Google Play handles the update installation and app restart.
## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  in_app_auto_updates: ^0.0.2
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:in_app_auto_updates/in_app_auto_updates.dart';
```

<hr>

@override
void initState() {
    InAppUpdates().doInAppUpdates(); // Call this
}
<hr>

<table>
<tr>
<td>
<img  src="https://developer.android.com/static/images/app-bundle/immediate_flow.png"  alt="">
</td>
</tr>
</table>

