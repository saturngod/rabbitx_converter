#import "RabbitxConverterPlugin.h"
#if __has_include(<rabbitx_converter/rabbitx_converter-Swift.h>)
#import <rabbitx_converter/rabbitx_converter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "rabbitx_converter-Swift.h"
#endif

@implementation RabbitxConverterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRabbitxConverterPlugin registerWithRegistrar:registrar];
}
@end
