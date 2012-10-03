//
//  TSViewController.m
//  tinySharkiOS
//
//  Created by Konrad Kolasa on 02.10.2012.
//  Copyright (c) 2012 AppetyLabs. All rights reserved.
//

#import "TSViewController.h"

@interface TSViewController ()

@end

@implementation TSViewController

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    webView = [[UIWebView alloc] initWithFrame:[self.view bounds]];
    
    CGRect indicatorFrame = CGRectMake((self.view.frame.size.width/2)-11, (self.view.frame.size.height/2)-11, 22, 22);
    aIndicator = [[UIActivityIndicatorView alloc] initWithFrame:indicatorFrame];
    [aIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    // the base view for this view controller
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    contentView.backgroundColor = [UIColor blueColor];
    
    // important for view orientation rotation
    contentView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.view = contentView;
    self.view.autoresizesSubviews = YES;
    //create a frame that will be used to size and place the web view
    CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
    webFrame.origin.y -= 20.0;	// shift the display up so that it covers the default open space from the content view
    UIWebView *aWebView = [[UIWebView alloc] initWithFrame:webFrame];
    self.webView = aWebView;
    //aWebView.scalesPageToFit = YES;
    aWebView.autoresizesSubviews = YES;
    aWebView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    //set the web view and acceleration delagates for the web view to be itself
    [aWebView setDelegate:self];
    
    NSURL *url = [NSURL URLWithString:@"http://grooveshark.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [aWebView loadRequest:request];
    [aWebView setDelegate:self];
    
    //add the web view to the content view
    [contentView addSubview:webView];
    
    [self.view addSubview:aIndicator];
    [aIndicator startAnimating];
    [aIndicator setHidesWhenStopped:YES];
    
	// Do any additional setup after loading the view.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [aIndicator stopAnimating];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return YES;
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
    if(fromInterfaceOrientation == UIInterfaceOrientationPortrait){
        NSString* result = [webView stringByEvaluatingJavaScriptFromString:@"rotate(0)"];
        //NSString a = *result;
        NSLog(@"%@",result);
        
    }
    else{
        [webView stringByEvaluatingJavaScriptFromString:@"rotate(1)"];
    }
    
}

- (void) accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
    
    NSString* javaScriptCall = [NSString stringWithFormat:@"accelerate(%f, %f, %f)", acceleration.x, acceleration.y, acceleration.z];
    
    [webView stringByEvaluatingJavaScriptFromString:javaScriptCall];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
