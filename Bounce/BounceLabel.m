//
//  BouncLabel.m
//  Bounce
//
//  Created by Rich Fellure on 6/5/15.
//  Copyright (c) 2015 Max Howell. All rights reserved.
//

#import "BounceLabel.h"

@implementation BounceLabel

- (NSArray *)words {
    return @[@"word1", @"bounce", @"chairs", @"👾", @"😡"];
}

- (id)randomWord {
    return self.words[arc4random_uniform(self.words.count)];
}

-(instancetype)init {
    self = [super init];
    if (self) {
        self.text = [self randomWord];
        [self sizeToFit];
        self.textColor = [UIColor blackColor];
    }
    return self;
}

-(void)randomlyPlaceInView:(UIView *)view {
    CGRect f = self.frame;
    f.origin.y = 10;
    f.origin.x = arc4random_uniform(view.bounds.size.width - self.bounds.size.width);
    self.frame = f;

    self.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    }];
    [view addSubview:self];
}

@end
