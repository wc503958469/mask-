//
//  MaskViewController.m
//  ben500
//
//  Created by wangchen on 15/9/2.
//  Copyright (c) 2015年 com.ben500. All rights reserved.
//

#import "MaskViewController.h"
#import "ChenBtn.h"

@interface MaskViewController (){
    
}
@property (nonatomic,weak)ChenBtn *movedView;
@property (nonatomic,weak)UIView *movingView;

@end

@implementation MaskViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageView.image = [UIImage imageNamed:@"2"];
    [self.view addSubview:imageView];
    
    
    ChenBtn *view = [[ChenBtn alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.cornerRadius = 50;
    view.topLeftRadius = YES;
    view.topRightRadius = YES;
    view.bottomLeftRadius = YES;
    view.bottomRightRadius = YES;
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    view.userInteractionEnabled = YES;
    _movedView = view;
    
    imageView.layer.mask = view.layer;
    

    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:view2];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    //    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    //    view1.layer.cornerRadius = 50;
    view1.userInteractionEnabled = YES;
    _movingView = view1;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [view1 addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [view2 addGestureRecognizer:tap1];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [view1 addGestureRecognizer:pan];
    
    UIPanGestureRecognizer *pan2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [view2 addGestureRecognizer:pan2];
}
//拖动事件
-(void)pan:(UIGestureRecognizer *)recognizer{
    UIGestureRecognizerState state = recognizer.state;
    if (!CGRectEqualToRect(_movingView.frame, _movedView.frame)) {
        [UIView animateWithDuration:0.5 animations:^{
            _movedView.frame = _movingView.frame;
        } completion:^(BOOL finished) {
            if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged) {
                //拖动过程selectedview的位置
                CGPoint curPoint = [recognizer locationInView:self.view];
                //    recognizer.view.center = curPoint;
                CGFloat targetX = curPoint.x;
                CGFloat targetY = curPoint.y;
                //
                if (targetX < _movingView.frame.size.width / 2){
                    targetX = _movingView.frame.size.width/2;
                }else if (targetX > self.view.frame.size.width - _movingView.frame.size.width / 2){
                    targetX =  self.view.frame.size.width - _movingView.frame.size.width / 2;
                }
                
                if (targetY < _movingView.frame.size.height /2){
                    targetY = _movingView.frame.size.height /2;
                }else if (targetY > self.view.frame.size.height - _movingView.frame.size.height / 2){
                    targetY =  self.view.frame.size.height - _movingView.frame.size.height / 2;
                }
                _movingView.center = CGPointMake(targetX, targetY);
                _movedView.frame = _movingView.frame;
                
            }else if (state == UIGestureRecognizerStateEnded){
            }
        }];
    }else{
        if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged) {
            //拖动过程selectedview的位置
            CGPoint curPoint = [recognizer locationInView:self.view];
            //    recognizer.view.center = curPoint;
            CGFloat targetX = curPoint.x;
            CGFloat targetY = curPoint.y;
            //
            if (targetX < _movingView.frame.size.width / 2){
                targetX = _movingView.frame.size.width/2;
            }else if (targetX > self.view.frame.size.width - _movingView.frame.size.width / 2){
                targetX =  self.view.frame.size.width - _movingView.frame.size.width / 2;
            }
            
            if (targetY < _movingView.frame.size.height /2){
                targetY = _movingView.frame.size.height /2;
            }else if (targetY > self.view.frame.size.height - _movingView.frame.size.height / 2){
                targetY =  self.view.frame.size.height - _movingView.frame.size.height / 2;
            }
            _movingView.center = CGPointMake(targetX, targetY);
            _movedView.frame = _movingView.frame;
            
        }else if (state == UIGestureRecognizerStateEnded){
        }
    }
    

}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

-(void)tap:(UIGestureRecognizer *)recognizer{
    if (CGRectEqualToRect(_movingView.frame, _movedView.frame)) {
        [UIView animateWithDuration:0.5 animations:^{
            _movedView.frame = CGRectMake(_movedView.frame.origin.x - self.view.frame.size.height, _movedView.frame.origin.y - self.view.frame.size.height, _movedView.frame.size.width + self.view.frame.size.height * 2, _movedView.frame.size.height + self.view.frame.size.height * 2);
        }];
    }else{
        CGPoint point = [recognizer locationInView:self.view];
        _movingView.frame = CGRectMake(point.x - 50, point.y - 50, 100, 100);
        
        [UIView animateWithDuration:0.5 animations:^{
            _movedView.frame = _movingView.frame;
        }];
    }
    
}


@end
