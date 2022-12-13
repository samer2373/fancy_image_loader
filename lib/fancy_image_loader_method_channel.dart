import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fancy_image_loader_platform_interface.dart';

/// An implementation of [FancyImageLoaderPlatform] that uses method channels.
class MethodChannelFancyImageLoader extends FancyImageLoaderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fancy_image_loader');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
