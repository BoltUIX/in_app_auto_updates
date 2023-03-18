package com.example.in_app_auto_updates_example

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import com.google.android.play.core.appupdate.AppUpdateInfo
import com.google.android.play.core.appupdate.AppUpdateManager
import com.google.android.play.core.appupdate.AppUpdateManagerFactory
import com.google.android.play.core.install.model.AppUpdateType
import com.google.android.play.core.install.model.UpdateAvailability
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    // Initialize the AppUpdateManager and AppUpdateInfo objects
    private lateinit var appUpdateManager: AppUpdateManager
    private lateinit var appUpdateInfo: AppUpdateInfo

    // Define the onCreate method for the activity
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Create an instance of AppUpdateManager using the factory method
        appUpdateManager = AppUpdateManagerFactory.create(context)
    }

    // Define the configureFlutterEngine method for the activity
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

        // Register the Flutter plugins and method channels
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // Set the method call handler for the "android/updates" channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "android/updates").setMethodCallHandler { call, result ->
            when (call.method) {
                // Handle the "checkUpdate" method call by calling checkUpdate function
                "checkUpdate" -> checkUpdate(result)
                // Handle the "performImmediateUpdate" method call by calling startUpdateFlowForResult function
                "performImmediateUpdate" -> {
                    appUpdateManager.startUpdateFlowForResult(
                        appUpdateInfo,
                        AppUpdateType.IMMEDIATE,
                        this,
                        100
                    )
                }
            }
        }
    }

    // Define the checkUpdate function
    private fun checkUpdate(result: MethodChannel.Result) {

        // Get the AppUpdateInfo task from AppUpdateManager
        val appUpdateInfoTask = appUpdateManager.appUpdateInfo

        // Add a success listener to the AppUpdateInfo task
        appUpdateInfoTask.addOnSuccessListener { appUpdateInfo ->

            // Store the AppUpdateInfo object in the activity
            this.appUpdateInfo = appUpdateInfo

            // Check if an update is available
            if (appUpdateInfo.updateAvailability() == UpdateAvailability.UPDATE_AVAILABLE) {
                result.success(true)
            } else result.success(false)
        }
    }
}
