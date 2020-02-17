#import "FlutterShareMePlugin.h"

@implementation FlutterShareMePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_share_me"
            binaryMessenger:[registrar messenger]];
  FlutterShareMePlugin* instance = [[FlutterShareMePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
     if ([[call method] isEqualToString:@"shareWhatsApp"]) {
         
         NSString * urlWhats = [NSString stringWithFormat:@"whatsapp://send?text=%@", call.arguments[@"msg"]];
            NSURL * whatsappURL = [NSURL URLWithString:urlWhats];

if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
    [[UIApplication sharedApplication] openURL: whatsappURL];
    result(@"whatsappURL");

}

     
  } else      if ([[call method] isEqualToString:@"shareFacebook"]) {

      
      

               NSString * urlWhats = [NSString stringWithFormat:@"https://www.facebook.com/sharer/sharer.php?u=%@", call.arguments[@"msg"]];
                  NSURL * whatsappURL = [NSURL URLWithString:urlWhats];

      if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
          [[UIApplication sharedApplication] openURL: whatsappURL];
          result(@"shareFacebook");

      }

      
      
    }

  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
