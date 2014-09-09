//
//  DTCAppDelegate.m
//  Pop Hamburger Button
//
//  Created by Mike Rundle on 8/24/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCAppDelegate.h"
#import "DTCTestButton.h"
#import "POP.h"

@interface DTCAppDelegate ()

@property (assign) BOOL hamburgerOpen;

@property (strong) DTCTestButton *hamburgerButton;
@property (strong) UIView *top;
@property (strong) UIView *middle;
@property (strong) UIView *bottom;

- (void)didTapHamburgerButton:(id)sender;

@end

@implementation DTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Add the main hamburger button
	self.hamburgerButton = [DTCTestButton buttonWithType:UIButtonTypeCustom];
	[self.hamburgerButton addTarget:self action:@selector(didTapHamburgerButton:) forControlEvents:UIControlEventTouchUpInside];
	self.hamburgerButton.backgroundColor = [UIColor blackColor];
	[self.hamburgerButton setFrame:CGRectMake(200, 200, 150, 150)];
	self.hamburgerButton.layer.cornerRadius = 75;
	[self.window addSubview:self.hamburgerButton];
	
	CGFloat sectionWidth = 80;
	CGFloat sectionHeight = 11;
	
	// Add the top, middle and bottom hamburger pieces
	self.top = [[UIView alloc] initWithFrame:CGRectMake(self.hamburgerButton.bounds.size.width/2 - sectionWidth/2,
				40, sectionWidth, sectionHeight)];
	self.top.backgroundColor = [UIColor whiteColor];
	self.top.userInteractionEnabled = NO;
	self.top.layer.cornerRadius = sectionHeight/2;
	[self.hamburgerButton addSubview:self.top];
	
	self.middle = [[UIView alloc] initWithFrame:CGRectMake(self.hamburgerButton.bounds.size.width/2 - sectionWidth/2,
														69, sectionWidth, sectionHeight)];
	self.middle.backgroundColor = [UIColor whiteColor];
	self.middle.userInteractionEnabled = NO;
	self.middle.layer.cornerRadius = sectionHeight/2;
	[self.hamburgerButton addSubview:self.middle];
	
	self.bottom = [[UIView alloc] initWithFrame:CGRectMake(self.hamburgerButton.bounds.size.width/2 - sectionWidth/2,
														   99, sectionWidth, sectionHeight)];
	self.bottom.backgroundColor = [UIColor whiteColor];
	self.bottom.userInteractionEnabled = NO;
	self.bottom.layer.cornerRadius = sectionHeight/2;
	[self.hamburgerButton addSubview:self.bottom];
	
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)didTapHamburgerButton:(id)sender {
	
	if (self.hamburgerOpen) {
		self.hamburgerOpen = NO;
		
		// Fade in the center line
		[UIView animateWithDuration:0.2 animations:^{
			self.middle.alpha = 1.0f;
		}];
		
		// Rotate the top bar to form an X
		POPSpringAnimation *topRotate = [self.top.layer pop_animationForKey:@"topRotate"];
		
		if (topRotate) {
			topRotate.toValue = @(0);
		} else {
			topRotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
			topRotate.toValue = @(0);
			topRotate.springBounciness = 11;
			topRotate.springSpeed = 18.0f;
			[self.top.layer pop_addAnimation:topRotate forKey:@"topRotate"];
		}
		
		// Rotate the bottom bar to form an X
		POPSpringAnimation *bottomRotate = [self.bottom.layer pop_animationForKey:@"bottomRotate"];
		
		if (bottomRotate) {
			bottomRotate.toValue = @(0);
		} else {
			bottomRotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
			bottomRotate.toValue = @(0);
			bottomRotate.springBounciness = 11;
			bottomRotate.springSpeed = 18.0f;
			[self.bottom.layer pop_addAnimation:bottomRotate forKey:@"bottomRotate"];
		}
		
		// Re-position the top bar to be in the middle of the button
		POPSpringAnimation *topPosition = [self.top.layer pop_animationForKey:@"topPosition"];
		
		if (topPosition) {
			topPosition.toValue = @(0);
		} else {
			topPosition = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
			topPosition.toValue = @(0);
			topPosition.springBounciness = 0;
			topPosition.springSpeed = 18.0f;
			[self.top.layer pop_addAnimation:topPosition forKey:@"topPosition"];
		}
		
		// Re-position the bototm bar to be in the middle of the button
		POPSpringAnimation *bottomPosition = [self.bottom.layer pop_animationForKey:@"bottomPosition"];
		
		if (bottomPosition) {
			bottomPosition.toValue = @(0);
		} else {
			bottomPosition = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
			bottomPosition.toValue = @(0);
			bottomPosition.springBounciness = 0;
			bottomPosition.springSpeed = 18.0f;
			[self.bottom.layer pop_addAnimation:bottomPosition forKey:@"bottomPosition"];
		}
		
		// Change the color of the top and bottom lines to red
		POPSpringAnimation *topColor = [self.top pop_animationForKey:@"topColor"];
		
		if (topColor) {
			topColor.toValue = [UIColor whiteColor];
		} else {
			topColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
			topColor.toValue = [UIColor whiteColor];
			topColor.springBounciness = 0;
			topColor.springSpeed = 18.0f;
			[self.top pop_addAnimation:topColor forKey:@"topColor"];
		}
		
		POPSpringAnimation *bottomColor = [self.bottom pop_animationForKey:@"bottomColor"];
		
		if (bottomColor) {
			bottomColor.toValue = [UIColor whiteColor];
		} else {
			bottomColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
			bottomColor.toValue = [UIColor whiteColor];
			bottomColor.springBounciness = 0;
			bottomColor.springSpeed = 18.0f;
			[self.bottom pop_addAnimation:bottomColor forKey:@"bottomColor"];
		}
		
	} else {
		self.hamburgerOpen = YES;
		
		// Fade out the center line
		[UIView animateWithDuration:0.2 animations:^{
			self.middle.alpha = 0.0f;
		}];
		
		// Rotate the top bar to form an X
		POPSpringAnimation *topRotate = [self.top.layer pop_animationForKey:@"topRotate"];
		
		if (topRotate) {
			topRotate.toValue = @(-M_PI/4);
		} else {
			topRotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
			topRotate.toValue = @(-M_PI/4);
			topRotate.springBounciness = 11;
			topRotate.springSpeed = 18.0f;
			[self.top.layer pop_addAnimation:topRotate forKey:@"topRotate"];
		}
		
		// Rotate the bottom bar to form an X
		POPSpringAnimation *bottomRotate = [self.bottom.layer pop_animationForKey:@"bottomRotate"];
		
		if (bottomRotate) {
			bottomRotate.toValue = @(M_PI/4);
		} else {
			bottomRotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
			bottomRotate.toValue = @(M_PI/4);
			bottomRotate.springBounciness = 11;
			bottomRotate.springSpeed = 18.0f;
			[self.bottom.layer pop_addAnimation:bottomRotate forKey:@"bottomRotate"];
		}
		
		// Re-position the top bar to be in the middle of the button
		POPSpringAnimation *topPosition = [self.top.layer pop_animationForKey:@"topPosition"];
		
		if (topPosition) {
			topPosition.toValue = @(29);
		} else {
			topPosition = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
			topPosition.toValue = @(29);
			topPosition.springBounciness = 0;
			topPosition.springSpeed = 18.0f;
			[self.top.layer pop_addAnimation:topPosition forKey:@"topPosition"];
		}
		
		// Re-position the bototm bar to be in the middle of the button
		POPSpringAnimation *bottomPosition = [self.bottom.layer pop_animationForKey:@"bottomPosition"];
		
		if (bottomPosition) {
			bottomPosition.toValue = @(-29);
		} else {
			bottomPosition = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
			bottomPosition.toValue = @(-29);
			bottomPosition.springBounciness = 0;
			bottomPosition.springSpeed = 18.0f;
			[self.bottom.layer pop_addAnimation:bottomPosition forKey:@"bottomPosition"];
		}
		
		// Change the color of the top and bottom lines to red
		POPSpringAnimation *topColor = [self.top pop_animationForKey:@"topColor"];
		
		if (topColor) {
			topColor.toValue = [UIColor redColor];
		} else {
			topColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
			topColor.toValue = [UIColor redColor];
			topColor.springBounciness = 0;
			topColor.springSpeed = 18.0f;
			[self.top pop_addAnimation:topColor forKey:@"topColor"];
		}
		
		POPSpringAnimation *bottomColor = [self.bottom pop_animationForKey:@"bottomColor"];
		
		if (bottomColor) {
			bottomColor.toValue = [UIColor redColor];
		} else {
			bottomColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
			bottomColor.toValue = [UIColor redColor];
			bottomColor.springBounciness = 0;
			bottomColor.springSpeed = 18.0f;
			[self.bottom pop_addAnimation:bottomColor forKey:@"bottomColor"];
		}
	}
}

@end
