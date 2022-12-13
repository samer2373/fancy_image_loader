import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fancy_image_loader_method_channel.dart';

abstract class FancyImageLoaderPlatform extends PlatformInterface {
  /// Constructs a FancyImageLoaderPlatform.
  FancyImageLoaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static FancyImageLoaderPlatform _instance = MethodChannelFancyImageLoader();

  /// The default instance of [FancyImageLoaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelFancyImageLoader].
  static FancyImageLoaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FancyImageLoaderPlatform] when
  /// they register themselves.
  static set instance(FancyImageLoaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
