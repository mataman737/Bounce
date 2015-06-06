//
//  ViewController.m
//  Bounce
//
//  Created by Max Howell on 6/5/15.
//  Copyright (c) 2015 Max Howell. All rights reserved.
//

#import "ViewController.h"
#import "BounceLabel.h"

@interface ViewController ()
@property UIDynamicAnimator *animator;
@property UIGravityBehavior *gravity;
@property UICollisionBehavior *collider;
@end

@implementation ViewController


- (NSArray *)words {
    return @[@"💩", @"github.com/fallaha13",@"🍌"];

    //LOL
    //github.com/fallaha13
}

- (id)randomWord {
    return self.words[arc4random_uniform(self.words.count)];
}


- (void)viewDidLoad {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[]];
    [self.animator addBehavior:self.gravity];

    self.collider = [[UICollisionBehavior alloc] initWithItems:@[]];
    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collider];

    [self go];
}

- (void)go {
    BounceLabel *label = [BounceLabel new];
    [label randomlyPlaceInView:self.view];

    NSArray *colorArray = @[[UIColor purpleColor], [UIColor greenColor], [UIColor blueColor]];
    label.textColor = colorArray[arc4random_uniform((u_int32_t)colorArray.count)];

    [self.gravity addItem:label];
    [self.collider addItem:label];

    UIDynamicItemBehavior *physics = [[UIDynamicItemBehavior alloc] initWithItems:@[label]];
    physics.elasticity = arc4random_uniform(1000.0) / 1000.0;
    [self.animator addBehavior:physics];

    NSTimeInterval time = arc4random_uniform(1000) / 1000.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self go];
    });


    if (self.view.subviews.count > 50) {
        [[self.view.subviews objectAtIndex:0] removeFromSuperview];
    }
}

@end
