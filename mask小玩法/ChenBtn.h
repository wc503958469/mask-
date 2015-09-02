//
//  ChenBtn.h
//  ben500
//
//  Created by wangchen on 15/6/9.
//  Copyright (c) 2015年 com.ben500. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChenBtn : UIView

@property (nonatomic,assign)BOOL isSelected;
@property (assign, nonatomic)  BOOL topRightRadius;
@property (assign, nonatomic)  BOOL topLeftRadius;
@property (assign, nonatomic)  BOOL bottomRightRadius;
@property (assign, nonatomic)  BOOL bottomLeftRadius;
@property (assign, nonatomic)  CGFloat cornerRadius;
@property (nonatomic ,weak)UIImage *backgroundImage;
@end
