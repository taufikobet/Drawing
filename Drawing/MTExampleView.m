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
        
        CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
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
        
         CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGContextBeginPath(context);
        
        CGFloat padding = 20.0;
        
        CGRect lineRect = CGRectMake(20.0, 20.0, CGRectGetMaxX(rect) - padding, 1.0);
        lineRect = rectFor1PxStroke(lineRect);
        
        CGContextMoveToPoint(context, lineRect.origin.x, lineRect.origin.y);

        CGContextAddLineToPoint(context, lineRect.origin.x + lineRect.size.width - padding, lineRect.origin.y);
        
        CGContextStrokePath(context);
        
    }
    CGContextRestoreGState(context);
}

CGRect rectFor1PxStroke(CGRect rect) {
    return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5, 
                      rect.size.width - 1, rect.size.height - 1);
}


@end
