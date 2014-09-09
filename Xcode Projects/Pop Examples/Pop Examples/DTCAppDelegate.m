//
//  DTCAppDelegate.m
//  Pop Examples
//
//  Created by Mike Rundle on 8/23/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCAppDelegate.h"
#import "POP.h"

@implementation DTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Add our pink square to the interface
	UIView *orangeSquare = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
	orangeSquare.backgroundColor = [UIColor orangeColor];
	[self.window addSubview:orangeSquare];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
		scale.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.5)];
		scale.springBounciness = 15;
		scale.springSpeed = 5.0f;
		[orangeSquare pop_addAnimation:scale forKey:@"scale"];
		
		POPSpringAnimation *move = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
		move.toValue = @(500);
		move.springBounciness = 15;
		move.springSpeed = 5.0f;
		[orangeSquare.layer pop_addAnimation:move forKey:@"position"];
		
		POPSpringAnimation *spin = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
		spin.toValue = @(M_PI*4);
		spin.springBounciness = 15;
		spin.springSpeed = 5.0f;
		[orangeSquare.layer pop_addAnimation:spin forKey:@"spin"];
		
		POPSpringAnimation *color = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
		color.toValue = [UIColor greenColor];
		color.springBounciness = 15;
		color.springSpeed = 5.0f;
		[orangeSquare pop_addAnimation:color forKey:@"colorChange"];
	});
	
	
	// Add our red ball to the interface
	UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 75, 75)];
	redBall.backgroundColor = [UIColor redColor];
	redBall.layer.cornerRadius = 75/2; // Half the width
	[self.window addSubview:redBall];
	
	// Add a blue ball
	UIView *blueBall = [[UIView alloc] initWithFrame:CGRectMake(350, 200, 75, 75)];
	blueBall.backgroundColor = [UIColor blueColor];
	blueBall.layer.cornerRadius = 75/2; // Half the width
	[self.window addSubview:blueBall];
	
	UIView *greenBall = [[UIView alloc] initWithFrame:CGRectMake(550, 200, 75, 75)];
	greenBall.backgroundColor = [UIColor greenColor];
	greenBall.layer.cornerRadius = 75/2; // Half the width
	[self.window addSubview:greenBall];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 7 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
		scale.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
		scale.springBounciness = 5; // Between 0-20
		scale.springSpeed = 10.0f; // Between 0-20
		[redBall pop_addAnimation:scale forKey:@"scale"];
	});
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 7.8 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
		scale.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
		scale.springBounciness = 12; // Between 0-20
		scale.springSpeed = 10.0f; // Between 0-20
		[blueBall pop_addAnimation:scale forKey:@"scale"];
	});
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 8.6 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
		scale.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
		scale.springBounciness = 20; // Between 0-20
		scale.springSpeed = 10.0f; // Between 0-20
		[greenBall pop_addAnimation:scale forKey:@"scale"];
	});
	
	
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
