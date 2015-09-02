//
//  ChenBtn.m
//  ben500
//
//  Created by wangchen on 15/6/9.
//  Copyright (c) 2015年 com.ben500. All rights reserved.
//

#import "ChenBtn.h"

@interface ChenBtn ()

@property (strong, nonatomic) UIColor *bgColor;

@end

@implementation ChenBtn


-(instancetype)init{
    if (self = [super init]) {
        self.isSelected = NO;
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:[UIColor clearColor]];
    _bgColor = backgroundColor;
}

-(void)setBackgroundImage:(UIImage *)backgroundImage{
    _backgroundImage = backgroundImage;
    [self setNeedsDisplay];
}

-(void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    
    if (_isSelected == YES) {
        self.backgroundColor = [UIColor grayColor];
    }
    else{
        self.backgroundColor = [UIColor blackColor];
    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    UIBezierPath *p = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(_bottomLeftRadius?UIRectCornerBottomLeft:0)|(_bottomRightRadius?UIRectCornerBottomRight:0)|(_topLeftRadius?UIRectCornerTopLeft:0)|(_topRightRadius?UIRectCornerTopRight:0) cornerRadii:CGSizeMake(_cornerRadius, 0.f)];
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextAddPath(c, p.CGPath);
    CGContextClosePath(c);
    CGContextClip(c);
    CGContextAddRect(c, rect);
    CGContextSetFillColorWithColor(c, [self bgColor].CGColor);

    CGContextFillPath(c);
    
    if (_backgroundImage) {
//        CGContextSaveGState(c);
//        CGContextDrawImage(c, rect, _backgroundImage.CGImage);
//        CGContextRestoreGState(c);
//        CGContextSaveGState(c);
        
//        CGAffineTransform myAffine = CGAffineTransformMakeRotation(M_PI);
//        myAffine = CGAffineTransformTranslate(myAffine, -rect.size.width, -rect.size.height);
//        CGContextConcatCTM(c, myAffine);
        
////        CGContextRotateCTM(c, M_PI);
////        CGContextTranslateCTM(c, -rect.size.width, -rect.size.height);
//        
//        CGContextDrawImage(c, rect, _backgroundImage.CGImage);
//        CGContextRestoreGState(c);
        
        [_backgroundImage drawInRect:rect ];//会缩放图片
        
    }
}

@end
