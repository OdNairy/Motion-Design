//
//  DTCAppDelegate.m
//  Music Player
//
//  Created by Mike Rundle on 8/21/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCAppDelegate.h"

@implementation DTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	CGFloat windowWidth = self.window.bounds.size.width;
	
	UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.window.bounds];
	backgroundView.image = [UIImage imageNamed:@"background"];
	[self.window addSubview:backgroundView];
	
	// Add the arrow and top label
	UIImageView *arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 0, windowWidth, 45)];
	arrowView.image = [UIImage imageNamed:@"arrow"];
	[self.window addSubview:arrowView];
	
	// Ministry of Fun label
	UIImageView *ministryView = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth, 57, windowWidth, 56/2)];
	ministryView.image = [UIImage imageNamed:@"ministry"];
	[self.window addSubview:ministryView];
	
	// Add a Song button
	UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[addButton setImage:[UIImage imageNamed:@"add-button"] forState:UIControlStateNormal];
	[addButton setImage:[UIImage imageNamed:@"add-button-pressed"] forState:UIControlStateHighlighted];
	[addButton setFrame:CGRectMake(windowWidth, 102, windowWidth, 45)];
	[self.window addSubview:addButton];
	
	// Katy Perry row
	UIImageView *firstRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth*1.5, 170, windowWidth, 80)];
	firstRow.image = [UIImage imageNamed:@"1st-row"];
	[self.window addSubview:firstRow];
	
	// Shakira row
	UIImageView *secondRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth*1.5, 170+80, windowWidth, 80)];
	secondRow.image = [UIImage imageNamed:@"2nd-row"];
	[self.window addSubview:secondRow];
	
	// Pitbull row
	UIImageView *thirdRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth*1.5, 170+160, windowWidth, 80)];
	thirdRow.image = [UIImage imageNamed:@"3rd-row"];
	[self.window addSubview:thirdRow];
	
	// Lana del Rey row
	UIImageView *fourthRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth*1.5, 170+240, windowWidth, 80)];
	fourthRow.image = [UIImage imageNamed:@"4th-row"];
	[self.window addSubview:fourthRow];
	
	// HEX row
	UIImageView *fifthRow = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth*1.5, 170+320, windowWidth, 80)];
	fifthRow.image = [UIImage imageNamed:@"5th-row"];
	[self.window addSubview:fifthRow];
	
	CGFloat initialDelay = 1.0f;
	CGFloat stutter = 0.06f;
#define TIME_N 1
    
	[UIView animateWithDuration:TIME_N delay:initialDelay usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
		[arrowView setFrame:CGRectMake(0, 0, windowWidth, 45)];
	} completion:NULL];
	
	[UIView animateWithDuration:TIME_N delay:initialDelay + (1 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
		[ministryView setFrame:CGRectMake(0, 57, windowWidth, 56/2)];
	} completion:NULL];
	
	[UIView animateWithDuration:TIME_N delay:initialDelay + (2 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
		[addButton setFrame:CGRectMake(0, 102, windowWidth, 45)];
	} completion:NULL];
	
	[UIView animateWithDuration:TIME_N delay:initialDelay + (3 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
		[firstRow setFrame:CGRectMake(0, 170, windowWidth, 80)];
	} completion:NULL];
	
	[UIView animateWithDuration:TIME_N delay:initialDelay + (4 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
		[secondRow setFrame:CGRectMake(0, 170+80, windowWidth, 80)];
	} completion:NULL];
	
	[UIView animateWithDuration:TIME_N delay:initialDelay + (5 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
		[thirdRow setFrame:CGRectMake(0, 170+160, windowWidth, 80)];
	} completion:NULL];
	
	[UIView animateWithDuration:TIME_N delay:initialDelay + (6 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
		[fourthRow setFrame:CGRectMake(0, 170+240, windowWidth, 80)];
	} completion:NULL];
	
	[UIView animateWithDuration:TIME_N delay:initialDelay + (7 * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
		[fifthRow setFrame:CGRectMake(0, 170+320, windowWidth, 80)];
	} completion:NULL];
	
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
