//
//  TSViewController.h
//  tinySharkiOS
//
//  Created by Konrad Kolasa on 02.10.2012.
//  Copyright (c) 2012 AppetyLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TSViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *webView;
    UIActivityIndicatorView *aIndicator;
}

@property (nonatomic, retain) UIWebView *webView;

@end
