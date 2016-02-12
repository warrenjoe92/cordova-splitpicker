#import "SplitPicker.h"

@implementation SplitPicker

- (void)show:(CDVInvokedUrlCommand*)command
{

    self.command = command;

    self.leftCol = [[command arguments] objectAtIndex:0];
    self.rightCol = [[command arguments] objectAtIndex:1];

    self.values = [NSMutableArray arrayWithObjects: @"", @"", nil];

    for (id object in self.leftCol){
        NSLog(@"%@", (NSString *)object);
    }

    for (id object in self.rightCol){
        NSLog(@"%@", (NSString *)object);
    }

    NSLog(@"got arrays");

    //create picker
    if (self.doublePicker == nil){
        NSLog(@"creating double picker");
        self.doublePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 480, 320, 270)];
        self.doublePicker.delegate = self;
        self.doublePicker.dataSource = self;
    }

    //get current view
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = window.rootViewController.view;

    //TODO preselection of rows

    [topView addSubview:self.doublePicker];

    [UIView beginAnimations:@"picker" context:nil];
    [UIView setAnimationDuration:0.5];
    self.doublePicker.transform = CGAffineTransformMakeTranslation(0,-236);
    [UIView commitAnimations];


    [self returnData];

}

/* Picker View Overriden methods */

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView  numberOfRowsInComponent:(NSInteger)component{
    switch(component){
        case 0:
            return self.leftCol.count;
        case 1:
            return self.rightCol.count;
        default:
            return 0;
    }
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch(component){
        case 0:
            return [self.leftCol objectAtIndex:row];
        case 1:
            return [self.rightCol objectAtIndex:row];
        default:
            return @"";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    id value;

    switch(component){
        case 0:
            value = [self.leftCol objectAtIndex:row];
        case 1:
            value = [self.rightCol objectAtIndex:row];
        default:
            value = @"";
    }

    [self.values replaceObjectAtIndex:component withObject:value];

}


- (void)returnData{
    // NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    NSDictionary *jsonObj = [ [NSDictionary alloc] initWithObjectsAndKeys:
                             @"myData", @"myKey",
                             nil
                             ];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsDictionary:jsonObj];

    [self.commandDelegate sendPluginResult:result callbackId:self.command.callbackId];
}

@end
