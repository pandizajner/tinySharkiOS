//
//  TSAppDelegate.h
//  tinySharkiOS
//
//  Created by Konrad Kolasa on 02.10.2012.
//  Copyright (c) 2012 AppetyLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class TSViewController;

@interface TSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TSViewController *viewController;


@end
