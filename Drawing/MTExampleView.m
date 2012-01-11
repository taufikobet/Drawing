//
//  MTExampleView.m
//  Drawing
//
//  Created by Muhammad Taufik on 1/11/12.
//  Copyright (c) 2012 Beetlebox. All rights reserved.
//

#import "MTExampleView.h"

@implementation MTExampleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    {
        
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextSetLineWidth(context, 3);
        UIBezierPath *path;
        
        path = [UIBezierPath bezierPathWithRoundedRect:rect
                                     byRoundingCorners:UIRectCornerAllCorners
                                           cornerRadii:CGSizeMake(7.0, 7.0)];
        
        [[UIColor whiteColor] setFill];
        [path fill];
        //[[UIColor whiteColor] setStroke];
        [path stroke];
        
        UIImage *img = [UIImage imageNamed:@"goofy_smile.png"];
        [img drawInRect:CGRectMake(self.bounds.size.width/2 - 100/2, self.bounds.size.height/2 - 100/2, 100, 100)];
        
    }
    CGContextRestoreGState(context);
}


@end
