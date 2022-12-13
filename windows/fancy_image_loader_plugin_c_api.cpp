#include "include/fancy_image_loader/fancy_image_loader_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "fancy_image_loader_plugin.h"

void FancyImageLoaderPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  fancy_image_loader::FancyImageLoaderPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
