//
//  DTCViewController.m
//  Bouncy test
//
//  Created by Mike Rundle on 8/11/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCViewController.h"
#import "JNWSpringAnimation.h"
#import "UIColor+Hex.h"

@interface DTCViewController ()

@property (strong) UIView *redView;
@property (strong) UIView *greenView;
@property (strong) UIView *blueView;

@end

@implementation DTCViewController

- (void)loadView {
	self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	self.view.backgroundColor = [UIColor whiteColor];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
	[button addTarget:self action:@selector(animate) forControlEvents:UIControlEventTouchUpInside];
	[button setFrame:CGRectMake(100, 400, 20, 20)];
	[self.view addSubview:button];
	
	self.redView = [[UIView alloc] initWithFrame:CGRectMake(20, 60, 25, 25)];
	self.redView.backgroundColor = [UIColor colorFromHex:0xff5f8c];
	self.redView.layer.cornerRadius = 13;
	[self.view addSubview:self.redView];
	
	self.greenView = [[UIView alloc] initWithFrame:CGRectMake(20, 110, 25, 25)];
	self.greenView.backgroundColor = [UIColor colorFromHex:0x80ff48];
	self.greenView.layer.cornerRadius = 13;
	[self.view addSubview:self.greenView];
	
	self.blueView = [[UIView alloc] initWithFrame:CGRectMake(20, 160, 25, 25)];
	self.blueView.backgroundColor = [UIColor colorFromHex:0x489eff];
	self.blueView.layer.cornerRadius = 13;
	[self.view addSubview:self.blueView];
}

- (void)animate {
	JNWSpringAnimation *redAnim = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.x"];
	redAnim.damping = 19;
	redAnim.stiffness = 200;
	redAnim.mass = 6;
	redAnim.fromValue = @(0);
	redAnim.toValue = @(500);
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		[self.redView.layer addAnimation:redAnim forKey:@"transform.translation.x"];
		self.redView.transform = CGAffineTransformMakeTranslation([redAnim.toValue floatValue], 0);
	});
	
	JNWSpringAnimation *greenAnim = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.x"];
	greenAnim.damping = 32;
	greenAnim.stiffness = 128;
	greenAnim.mass = 6.5;
	greenAnim.fromValue = @(0);
	greenAnim.toValue = @(500);
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		[self.greenView.layer addAnimation:greenAnim forKey:@"transform.translation.x"];
		self.greenView.transform = CGAffineTransformMakeTranslation([greenAnim.toValue floatValue], 0);
	});
	
	JNWSpringAnimation *blueAnim = [JNWSpringAnimation animationWithKeyPath:@"transform.translation.x"];
	blueAnim.damping = 20;
	blueAnim.stiffness = 20;
	blueAnim.mass = 3;
	blueAnim.fromValue = @(0);
	blueAnim.toValue = @(500);
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.6 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
		[self.blueView.layer addAnimation:blueAnim forKey:@"transform.translation.x"];
		self.blueView.transform = CGAffineTransformMakeTranslation([blueAnim.toValue floatValue], 0);
	});
}


@end
