//
//  DTCAppDelegate.m
//  Pop Tapped Button
//
//  Created by Mike Rundle on 8/23/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCAppDelegate.h"
#import "POP.h"
#import "DTCTestButton.h"

@implementation DTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	DTCTestButton *button = [DTCTestButton buttonWithType:UIButtonTypeCustom];
	[button setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateNormal];
	[button setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateHighlighted];
	[button setFrame:CGRectMake(100, 100, 50, 50)];
	[self.window addSubview:button];
	
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
