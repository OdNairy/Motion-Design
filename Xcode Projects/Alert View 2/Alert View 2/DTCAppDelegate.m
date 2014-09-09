//
//  DTCAppDelegate.m
//  Alert View 2
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
	CGAffineTransform viewTransform = CGAffineTransformConcat(CGAffineTransformMakeScale(.25, .25),
															  CGAffineTransformMakeTranslation(0, 600));
	/*alertView.transform = CGAffineTransformMakeScale(.25, .25);
	alertView.transform = CGAffineTransformTranslate(alertView.transform, 0, 600);*/
	alertView.transform = viewTransform;
	alertView.layer.cornerRadius = 10;
	alertView.layer.shadowColor = [UIColor blackColor].CGColor;
	alertView.layer.shadowOffset = CGSizeMake(0, 5);
    alertView.layer.shadowOpacity = 0.3f;
	alertView.layer.shadowRadius = 10.0f;
	[self.window addSubview:alertView];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		
		[UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			overlayView.alpha = 0.2f;
			alertView.alpha = 1.0f;
		} completion:NULL];
		
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = 12;
		scale.stiffness = 12;
		scale.mass = 1;
		scale.fromValue = @(.25);
		scale.toValue = @(1.0);
		
		[alertView.layer addAnimation:scale forKey:scale.keyPath];
		alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
		
		JNWSpringAnimation *translate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
		translate.damping = 15;
		translate.stiffness = 15;
		translate.mass = 1;
		translate.fromValue = @(600);
		translate.toValue = @(0);
		
		[alertView.layer addAnimation:translate forKey:translate.keyPath];
		alertView.transform = CGAffineTransformTranslate(alertView.transform, 0, 0);
	});
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		
		// Fade out the grey overlay
		[UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			overlayView.alpha = 0.0f;
			alertView.alpha = 0.0f;
		} completion:NULL];
		
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = 17;
		scale.stiffness = 17;
		scale.mass = 1;
		scale.fromValue = @(1.0);
		scale.toValue = @(0.5);
		
		[alertView.layer addAnimation:scale forKey:scale.keyPath];
		alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
		
		JNWSpringAnimation *translate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
		translate.damping = 4;
		translate.stiffness = 4;
		translate.mass = 1;
		translate.fromValue = @(0);
		translate.toValue = @(600);
		
		[alertView.layer addAnimation:translate forKey:translate.keyPath];
		alertView.transform = CGAffineTransformTranslate(alertView.transform, 0, 600);
		
	});
	
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
