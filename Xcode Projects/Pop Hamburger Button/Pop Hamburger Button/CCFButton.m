//
//  CCFButton.m
//  Buttons Demo
//
//  Created by Mike Rundle on 5/1/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "CCFButton.h"
#import "JNWSpringAnimation.h"

@implementation CCFButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark -
#pragma mark Handle touches ourselves so we can get nice interactions

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];
	[self setNeedsDisplay];
	
	JNWSpringAnimation *explode = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
	explode.damping = 35;
	explode.stiffness = 1000;
	explode.mass = 3;
	explode.fromValue = @([[self.layer valueForKeyPath:@"transform.scale"] floatValue]);
	explode.toValue = @(0.8);
	
	[self.layer addAnimation:explode forKey:@"transform.scale"];
	self.transform = CGAffineTransformMakeScale(0.8, 0.8);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesCancelled:touches withEvent:event];
	[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesEnded:touches withEvent:event];
	[self setNeedsDisplay];
	
	JNWSpringAnimation *explode = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
	explode.damping = 23;
	explode.stiffness = 23;
	explode.mass = 1;
	explode.fromValue = @([[self.layer valueForKeyPath:@"transform.scale"] floatValue]);
	explode.toValue = @(1.0);
	
	[self.layer addAnimation:explode forKey:@"transform.scale"];
	self.transform = CGAffineTransformMakeScale(1.0, 1.0);
}

@end
