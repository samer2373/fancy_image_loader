#import "FancyImageLoaderPlugin.h"
#if __has_include(<fancy_image_loader/fancy_image_loader-Swift.h>)
#import <fancy_image_loader/fancy_image_loader-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fancy_image_loader-Swift.h"
#endif

@implementation FancyImageLoaderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFancyImageLoaderPlugin registerWithRegistrar:registrar];
}
@end
