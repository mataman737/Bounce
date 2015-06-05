//
//  BouncLabel.h
//  Bounce
//
//  Created by Rich Fellure on 6/5/15.
//  Copyright (c) 2015 Max Howell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BounceLabel : UILabel

-(void)randomlyPlaceInView:(UIView *)view;
@property (readonly)NSArray *words;

@end
