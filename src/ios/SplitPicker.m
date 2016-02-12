#import "SplitPicker.h"

@implementation SplitPicker

- (void)show:(CDVInvokedUrlCommand*)command
{

    // NSString* name = [[command arguments] objectAtIndex:0];
    // NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    NSDictionary *jsonObj = [ [NSDictionary alloc] initWithObjectsAndKeys:
                                                    @"myData", @"myKey",
                                                    nil
                         ];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsDictionary:jsonObj];

    //[self success:result callbackId:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
