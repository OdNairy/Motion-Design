//
//  DTCAppDelegate.m
//  Bouncy test
//
//  Created by Mike Rundle on 8/11/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCAppDelegate.h"
#import "DTCViewController.h"
#import "NSValue+JNWAdditions.h"
#import "JNWSpringAnimation.h"

@implementation DTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	 UIViewController *viewController = [[DTCViewController alloc] initWithNibName:nil bundle:nil];
	 [self.window setRootViewController:viewController];
	
	UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(200, 500, 200, 100)];
	redBall.backgroundColor = [UIColor blueColor];
	redBall.transform = CGAffineTransformMakeScale(0, 0);
	redBall.transform = CGAffineTransformTranslate(redBall.transform, 0, 500);
	redBall.layer.cornerRadius = 3;
	[self.window addSubview:redBall];
	
	
	UIView *greenBall = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 50, 50)];
	greenBall.backgroundColor = [UIColor greenColor];
	greenBall.layer.cornerRadius = 25;
	[self.window addSubview:greenBall];
	
	UIView *blueBall = [[UIView alloc] initWithFrame:CGRectMake(350, 200, 50, 50)];
	blueBall.backgroundColor = [UIColor blueColor];
	blueBall.layer.cornerRadius = 25;
	[self.window addSubview:blueBall];
	
	
	// Using JNWSpringAnimation to slide the alert up
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 7.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = 15;
		scale.stiffness = 15;
		scale.mass = 1;
		
		scale.fromValue = @(0);
		scale.toValue = @(1.0);
		
		[redBall.layer addAnimation:scale forKey:scale.keyPath];
		redBall.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
		
		JNWSpringAnimation *rotate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
		rotate.damping = 15;
		rotate.stiffness = 15;
		rotate.mass = 1;
		
		rotate.fromValue = @(500);
		rotate.toValue = @(0);
		
		[redBall.layer addAnimation:rotate forKey:rotate.keyPath];
		redBall.transform = CGAffineTransformTranslate(redBall.transform, 0, 0);
	});
	
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 9 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = 15;
		scale.stiffness = 15;
		scale.mass = 1;
		
		scale.fromValue = @(1.0);
		scale.toValue = @(2);
		
		[greenBall.layer addAnimation:scale forKey:scale.keyPath];
		greenBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
	});
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = 30;
		scale.stiffness = 30;
		scale.mass = 1;
		
		scale.fromValue = @(1.0);
		scale.toValue = @(2);
		
		[blueBall.layer addAnimation:scale forKey:scale.keyPath];
		blueBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
	});
	
	
	 [UIView animateWithDuration:.5 delay:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		redBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
	} completion:NULL];
	
		[UIView animateWithDuration:3 delay:2 usingSpringWithDamping:1 initialSpringVelocity:0 options:0 animations:^{
		redBall.transform = CGAffineTransformMakeTranslation(300, 0);
	} completion:NULL];
	
	
	[UIView animateWithDuration:.5 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		redBall.backgroundColor = [UIColor greenColor];
		redBall.transform = CGAffineTransformConcat(
			CGAffineTransformMakeScale(2.0, 2.0),
			CGAffineTransformMakeTranslation(75, 0));
	} completion:NULL];
	
	
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;}

@end
