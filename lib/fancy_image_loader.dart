
import 'fancy_image_loader_platform_interface.dart';

class FancyImageLoader {
  Future<String?> getPlatformVersion() {
    return FancyImageLoaderPlatform.instance.getPlatformVersion();
  }
}
