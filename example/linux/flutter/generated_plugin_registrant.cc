//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <fancy_image_loader/fancy_image_loader_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) fancy_image_loader_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FancyImageLoaderPlugin");
  fancy_image_loader_plugin_register_with_registrar(fancy_image_loader_registrar);
}
