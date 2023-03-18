#include "include/in_app_auto_updates/in_app_auto_updates_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "in_app_auto_updates_plugin.h"

void InAppAutoUpdatesPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  in_app_auto_updates::InAppAutoUpdatesPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
