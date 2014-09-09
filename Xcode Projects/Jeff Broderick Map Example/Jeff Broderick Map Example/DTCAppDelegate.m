//
//  DTCAppDelegate.m
//  Jeff Broderick Map Example
//
//  Created by Mike Rundle on 8/19/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCAppDelegate.h"
#import "UIColor+Hex.h"
#import "JNWSpringAnimation.h"
#import "NSValue+JNWAdditions.h"

@interface DTCAppDelegate ()

- (void)didTapMapIcon:(id)sender;

@property (assign) BOOL mapShowing;

@property (strong) UIImageView *appBackground;
@property (strong) UIImageView *mapView;

@end

@implementation DTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	// Construct the main window for this application
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	self.mapShowing = NO;
	
	// Add the main app background image
	self.appBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.window.bounds.size.width, 548)];
	self.appBackground.image = [UIImage imageNamed:@"app-bg"];
	[self.window addSubview:self.appBackground];
	
	// Add the map view (currently transparent)
	self.mapView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 62, self.window.bounds.size.width, 458)];
	self.mapView.image = [UIImage imageNamed:@"map-arrow"];
	self.mapView.transform = CGAffineTransformMakeTranslation(0, 30);
	self.mapView.alpha = 0.0f;
	self.mapView.transform = CGAffineTransformScale(self.mapView.transform, 1.1, 1.1);
	[self.window addSubview:self.mapView];
	
	// Add the icon
	UIButton *icon = [UIButton buttonWithType:UIButtonTypeCustom];
	[icon setImage:[UIImage imageNamed:@"map-icon"] forState:UIControlStateNormal];
	[icon addTarget:self action:@selector(didTapMapIcon:) forControlEvents:UIControlEventTouchUpInside];
	[icon setFrame:CGRectMake(self.window.bounds.size.width - 49, 19, 49, 44)];
	[self.window addSubview:icon];
	
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}
	 
- (void)didTapMapIcon:(id)sender {
	
	if (self.mapShowing) {
		
		self.mapShowing = NO;
		CGFloat dampingStiffnessOut = 24.0f;
		
		[UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
			self.appBackground.alpha = 1.0f;
		} completion:NULL];
		
		[UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
			self.mapView.alpha = 0.0f;
		} completion:NULL];
		
		// Map gets 2 separate animations, one for position and the other for scale
		JNWSpringAnimation *mapScale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		mapScale.damping = dampingStiffnessOut;
		mapScale.stiffness = dampingStiffnessOut;
		mapScale.mass = 1;
		mapScale.fromValue = @([[self.mapView.layer.presentationLayer valueForKeyPath:mapScale.keyPath] floatValue]);
		mapScale.toValue = @(1.1);
		
		[self.mapView.layer addAnimation:mapScale forKey:mapScale.keyPath];
		self.mapView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
		
		JNWSpringAnimation *mapTranslate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
		mapTranslate.damping = dampingStiffnessOut;
		mapTranslate.stiffness = dampingStiffnessOut;
		mapTranslate.mass = 1;
		mapTranslate.fromValue = @([[self.mapView.layer.presentationLayer valueForKeyPath:mapTranslate.keyPath] floatValue]);
		mapTranslate.toValue = @(30);
		
		[self.mapView.layer addAnimation:mapTranslate forKey:mapTranslate.keyPath];
		self.mapView.transform = CGAffineTransformTranslate(self.mapView.transform, 0, 30);
		
		// Scale animation for the main app background
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = dampingStiffnessOut;
		scale.stiffness = dampingStiffnessOut;
		scale.mass = 1;
		scale.fromValue = @([[self.appBackground.layer.presentationLayer valueForKeyPath:@"transform.scale.x"] floatValue]);
		scale.toValue = @(1.0);
		
		[self.appBackground.layer addAnimation:scale forKey:scale.keyPath];
		self.appBackground.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
		
	} else {
		
		self.mapShowing = YES;
		CGFloat dampingStiffness = 16.0f;
		
		[UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
			self.appBackground.alpha = 0.3f;
		} completion:NULL];
		
		[UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
			self.mapView.alpha = 1.0f;
		} completion:NULL];
		
		// Map gets 2 separate animations, one for position and the other for scale
		JNWSpringAnimation *mapScale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		mapScale.damping = dampingStiffness;
		mapScale.stiffness = dampingStiffness;
		mapScale.mass = 1;
		mapScale.fromValue = @([[self.mapView.layer.presentationLayer valueForKeyPath:mapScale.keyPath] floatValue]);
		mapScale.toValue = @(1.0);
		
		[self.mapView.layer addAnimation:mapScale forKey:mapScale.keyPath];
		self.mapView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
		
		JNWSpringAnimation *mapTranslate = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
		mapTranslate.damping = dampingStiffness;
		mapTranslate.stiffness = dampingStiffness;
		mapTranslate.mass = 1;
		mapTranslate.fromValue = @([[self.mapView.layer.presentationLayer valueForKeyPath:mapTranslate.keyPath] floatValue]);
		mapTranslate.toValue = @(0);
		
		[self.mapView.layer addAnimation:mapTranslate forKey:mapTranslate.keyPath];
		self.mapView.transform = CGAffineTransformTranslate(self.mapView.transform, 0, 0);
		
		// Scale animation for the main app background
		JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
		scale.damping = dampingStiffness;
		scale.stiffness = dampingStiffness;
		scale.mass = 1;
		scale.fromValue = @([[self.appBackground.layer.presentationLayer valueForKeyPath:scale.keyPath] floatValue]);
		scale.toValue = @(0.9);
		
		[self.appBackground.layer addAnimation:scale forKey:scale.keyPath];
		self.appBackground.transform = CGAffineTransformScale(CGAffineTransformIdentity, .9, .9);
		
	}
}



@end
