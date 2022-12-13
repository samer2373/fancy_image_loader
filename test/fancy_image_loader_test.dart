import 'package:flutter_test/flutter_test.dart';
import 'package:fancy_image_loader/fancy_image_loader.dart';
import 'package:fancy_image_loader/fancy_image_loader_platform_interface.dart';
import 'package:fancy_image_loader/fancy_image_loader_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFancyImageLoaderPlatform
    with MockPlatformInterfaceMixin
    implements FancyImageLoaderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FancyImageLoaderPlatform initialPlatform = FancyImageLoaderPlatform.instance;

  test('$MethodChannelFancyImageLoader is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFancyImageLoader>());
  });

  test('getPlatformVersion', () async {
    FancyImageLoader fancyImageLoaderPlugin = FancyImageLoader();
    MockFancyImageLoaderPlatform fakePlatform = MockFancyImageLoaderPlatform();
    FancyImageLoaderPlatform.instance = fakePlatform;

    expect(await fancyImageLoaderPlugin.getPlatformVersion(), '42');
  });
}
