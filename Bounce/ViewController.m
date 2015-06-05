//
//  ViewController.m
//  Bounce
//
//  Created by Max Howell on 6/5/15.
//  Copyright (c) 2015 Max Howell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIDynamicAnimator *animator;
@property UIGravityBehavior *gravity;
@property UICollisionBehavior *collider;
@end

@implementation ViewController


- (NSArray *)words {
<<<<<<< HEAD
    return @[@"TEST", @"COLORS", @"POOPY", @"BUTTS", @"POOP"];
}

- (NSArray *)colors {
    return @[[UIColor purpleColor], [UIColor redColor], [UIColor orangeColor], [UIColor blueColor], [UIColor greenColor]];
=======
    return @[@"FOLLOW", @"ME", @"RN", @"OR", @"ELSE",@"🍌"];
>>>>>>> d0c906aa4344e14821535c22071939480ad69ef1
}

- (id)randomWord {
    return self.words[arc4random_uniform(self.words.count)];
}

- (id)randomColor {
    return self.colors[arc4random_uniform(self.colors.count)];
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
    UILabel *label = [UILabel new];

    label.text = @"💩💩BEAST💩SWAG💩YOOO💩💩";


    label.text = @"FALLAHWAZHERE😈";

    label.text = [self randomWord];
<<<<<<< HEAD
    label.textColor = [self randomColor];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"max"]];
    label.frame = CGRectMake(0, 0, 100, 100);
=======


    label.textColor = [UIColor blackColor];

    NSArray *colorArray = @[[UIColor purpleColor], [UIColor greenColor], [UIColor blueColor]];
    label.textColor = colorArray[arc4random_uniform((u_int32_t)colorArray.count)];

    [label sizeToFit];

>>>>>>> d0c906aa4344e14821535c22071939480ad69ef1

    [self.view addSubview:label];

    CGRect f = label.frame;
    f.origin.y = 10;
    f.origin.x = arc4random_uniform(self.view.bounds.size.width - label.bounds.size.width);
    label.frame = f;
    [self.gravity addItem:label];
    [self.collider addItem:label];

    label.alpha = 0;
    [UIView animateWithDuration:0.1 animations:^{
        label.alpha = 1;
    }];

    UIDynamicItemBehavior *physics = [[UIDynamicItemBehavior alloc] initWithItems:@[label]];
    physics.elasticity = arc4random_uniform(1000.0) / 1000.0;
    [self.animator addBehavior:physics];

    NSTimeInterval time = arc4random_uniform(1000) / 1000.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self go];
    });
}

@end
