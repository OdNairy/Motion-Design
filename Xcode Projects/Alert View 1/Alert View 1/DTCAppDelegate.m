//
//  DTCAppDelegate.m
//  Alert View 1
//
//  Created by Mike Rundle on 8/17/14.
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
	alertView.transform = CGAffineTransformMakeScale(1.2, 1.2);
	alertView.layer.cornerRadius = 10;
	alertView.layer.shadowColor = [UIColor blackColor].CGColor;
	alertView.layer.shadowOffset = CGSizeMake(0, 5);
    alertView.layer.shadowOpacity = 0.3f;
	alertView.layer.shadowRadius = 10.0f;
	[self.window addSubview:alertView];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		
		// Fade in the grey overlay
		[UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			overlayView.alpha = 0.2f;
		} completion:NULL];
		
		// Fade in the alert view
		[UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			alertView.alpha = 1.0f;
		} completion:NULL];
		
		// Scale-animate in the alert view
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = 14;
		scale.stiffness = 14;
		scale.mass = 1;
		scale.fromValue = @(1.2);
		scale.toValue = @(1.0);
		
		[alertView.layer addAnimation:scale forKey:scale.keyPath];
		alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
		
	});
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		
		// Fade out the grey overlay
		[UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			overlayView.alpha = 0.0f;
			alertView.alpha = 0.0f;
		} completion:NULL];
		
		// Scale-animate in the alert view
		JNWSpringAnimation *scaleAnimation = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scaleAnimation.damping = 11;
		scaleAnimation.stiffness = 11;
		scaleAnimation.mass = 1;
		scaleAnimation.fromValue = @(1.0);
		scaleAnimation.toValue = @(0.7);
		
		[alertView.layer addAnimation:scaleAnimation forKey:scaleAnimation.keyPath];
		alertView.transform = CGAffineTransformMakeScale(0.7, 0.7);
		
	});
	
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
