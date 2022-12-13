#ifndef FLUTTER_PLUGIN_FANCY_IMAGE_LOADER_PLUGIN_H_
#define FLUTTER_PLUGIN_FANCY_IMAGE_LOADER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace fancy_image_loader {

class FancyImageLoaderPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FancyImageLoaderPlugin();

  virtual ~FancyImageLoaderPlugin();

  // Disallow copy and assign.
  FancyImageLoaderPlugin(const FancyImageLoaderPlugin&) = delete;
  FancyImageLoaderPlugin& operator=(const FancyImageLoaderPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace fancy_image_loader

#endif  // FLUTTER_PLUGIN_FANCY_IMAGE_LOADER_PLUGIN_H_
