//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <in_app_auto_updates/in_app_auto_updates_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) in_app_auto_updates_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "InAppAutoUpdatesPlugin");
  in_app_auto_updates_plugin_register_with_registrar(in_app_auto_updates_registrar);
}
