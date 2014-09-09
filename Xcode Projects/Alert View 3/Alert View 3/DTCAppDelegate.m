//
//  DTCAppDelegate.m
//  Alert View 3
//
//  Created by Mike Rundle on 8/18/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCAppDelegate.h"
#import "UIColor+Hex.h"
#import "JNWSpringAnimation.h"
#import "NSValue+JNWAdditions.h"

@implementation DTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	// Construct the main window for this application
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Grey overlay
	UIView *overlayView = [[UIView alloc] initWithFrame:self.window.bounds];
	overlayView.backgroundColor = [UIColor blackColor];
	overlayView.alpha = 0.0f;
	[self.window addSubview:overlayView];
	
	// Alert view with background image, rounded corners and a slight shadow
	CGFloat alertDimension = 250;
	CGRect alertViewFrame = CGRectMake(self.window.bounds.size.width/2 - alertDimension/2,
									   self.window.bounds.size.height/2 - alertDimension/2, alertDimension, alertDimension);
	UIView *alertView = [[UIView alloc] initWithFrame:alertViewFrame];
	alertView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"alert_box"]];
	alertView.alpha = 0.0f;
	alertView.transform = CGAffineTransformMakeScale(0, 0);
	alertView.layer.cornerRadius = 10;
	alertView.layer.shadowColor = [UIColor blackColor].CGColor;
	alertView.layer.shadowOffset = CGSizeMake(0, 5);
    alertView.layer.shadowOpacity = 0.3f;
	alertView.layer.shadowRadius = 10.0f;
	[self.window addSubview:alertView];
	
    
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		
		[UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			overlayView.alpha = 0.2f;
			alertView.alpha = 1.0f;
		} completion:NULL];
		
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = 32;
		scale.stiffness = 450;
		scale.mass = 2.4;
		scale.fromValue = @(0);
		scale.toValue = @(1.0);
		
		[alertView.layer addAnimation:scale forKey:scale.keyPath];
		alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
	});
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		
		// Fade out the grey overlay
		[UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			overlayView.alpha = 0.0f;
			alertView.alpha = 0.0f;
		} completion:NULL];
		
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = 28;
		scale.stiffness = 28;
		scale.mass = 1;
		scale.fromValue = @(1);
		scale.toValue = @(0);
		
		[alertView.layer addAnimation:scale forKey:scale.keyPath];
		alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
		
	});
	
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
