//
//  CustomCoreGraphicsView.m
//  BurgerMenuObjC
//
//  Created by Reid Weber on 12/1/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "CustomCoreGraphicsView.h"

@implementation CustomCoreGraphicsView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, rect);
}

@end
