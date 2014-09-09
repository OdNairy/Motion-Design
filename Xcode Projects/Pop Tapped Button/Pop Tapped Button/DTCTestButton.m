//
//  DTCTestButton.m
//  Pop Tapped Button
//
//  Created by Mike Rundle on 8/23/14.
//  Copyright (c) 2014 Flyosity, LLC. All rights reserved.
//

#import "DTCTestButton.h"
#import "POP.h"

@implementation DTCTestButton

#pragma mark -
#pragma mark Handle touches ourselves so we can animate a nice interaction

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	POPSpringAnimation *scale = [self pop_animationForKey:@"scale"];
	POPSpringAnimation *rotate = [self.layer pop_animationForKey:@"rotate"];
	
	if (scale) {
		scale.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
	} else {
		scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
		scale.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
		scale.springBounciness = 20;
		scale.springSpeed = 18.0f;
		[self pop_addAnimation:scale forKey:@"scale"];
	}
	
	if (rotate) {
		rotate.toValue = @(M_PI/6);
	} else {
		rotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
		rotate.toValue = @(M_PI/6);
		rotate.springBounciness = 20;
		rotate.springSpeed = 18.0f;
		[self.layer pop_addAnimation:rotate forKey:@"rotate"];
	}
	
	[super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	POPSpringAnimation *scale = [self pop_animationForKey:@"scale"];
	POPSpringAnimation *rotate = [self pop_animationForKey:@"rotate"];
	
	if (scale) {
		scale.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
	} else {
		scale = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
		scale.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
		scale.springBounciness = 20;
		scale.springSpeed = 18.0f;
		[self pop_addAnimation:scale forKey:@"scale"];
	}
	
	if (rotate) {
		rotate.toValue = @(0);
	} else {
		rotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
		rotate.toValue = @(0);
		rotate.springBounciness = 20;
		rotate.springSpeed = 18.0f;
		[self.layer pop_addAnimation:rotate forKey:@"rotate"];
	}
	
	[super touchesEnded:touches withEvent:event];
}


@end
