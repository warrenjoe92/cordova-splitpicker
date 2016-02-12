#import <Cordova/CDV.h>

@interface SplitPicker : CDVPlugin <UIPickerViewDelegate, UIPickerViewDataSource>

@property UIPickerView *doublePicker;
@property CDVInvokedUrlCommand *command;
@property NSArray* leftCol;
@property NSArray* rightCol;
@property NSMutableArray* values;

- (void) show:(CDVInvokedUrlCommand*)command;

@end
