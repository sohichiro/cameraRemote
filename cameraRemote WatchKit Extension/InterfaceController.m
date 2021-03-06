//
//  InterfaceController.m
//  cameraRemote WatchKit Extension
//
//  Created by 長尾 聡一郎 on 2015/05/16.
//  Copyright (c) 2015年 長尾 聡一郎. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)pushTakePictureButton {
    NSDictionary *dic = @{@"command":@"take_picture"};
    [WKInterfaceController openParentApplication:dic reply:^(NSDictionary *replyInfo, NSError *error){
     }];
}

@end



