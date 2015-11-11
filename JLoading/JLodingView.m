//
//  JLodingView.m
//  JLoading
//
//  Created by zpcui on 15/11/11.
//  Copyright © 2015年 com.czp. All rights reserved.
//

#import "JLodingView.h"

static CGFloat const pointSize = 8;
static CGFloat const viewHeight = 100;
static CGFloat const viewWidth = 100;
static CGFloat const space = 5;
static CGFloat const duration = 0.7;

@interface JLodingView ()

@property (strong, nonatomic) NSArray *points;
@property (assign, nonatomic) BOOL loading;

@end

@implementation JLodingView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIView *point1 = [[UIView alloc] initWithFrame:CGRectMake(viewWidth/2.0 - pointSize/2.0 - pointSize - space, 0, pointSize, pointSize)];
    point1.backgroundColor = [UIColor whiteColor];
    point1.layer.cornerRadius = pointSize/2;
    
    UIView *point2 = [[UIView alloc] initWithFrame:CGRectMake(viewWidth/2.0 - pointSize/2.0, 0, pointSize, pointSize)];
    point2.backgroundColor = [UIColor whiteColor];
    point2.layer.cornerRadius = pointSize/2;
    
    UIView *point3 = [[UIView alloc] initWithFrame:CGRectMake(viewWidth/2.0 - pointSize/2.0 + pointSize +space, 0, pointSize, pointSize)];
    point3.backgroundColor = [UIColor whiteColor];
    point3.layer.cornerRadius = pointSize/2;
    
    [self addSubview:point1];
    [self addSubview:point2];
    [self addSubview:point3];
    
    self.points = @[point1, point2, point3];
    [self startAnimation];
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), viewWidth, viewHeight)];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        _loading = YES;
    }
    return self;
}


- (void)startAnimation {
    
    if (self.loading) {
        UIView *point1 = self.points[0];
        UIView *point2 = self.points[1];
        UIView *point3 = self.points[2];
        
        CGPoint point1Center = point1.center;
        CGPoint point2Center = point2.center;
        CGPoint point3Center = point3.center;
        
        [UIView animateWithDuration:duration animations:^{
            
            UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point2.center radius:(point3Center.x - point1Center.x)/2.0 startAngle:-M_PI endAngle:0 clockwise:YES];
            
            CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
            keyframeAnimation.path = path.CGPath;
            keyframeAnimation.repeatCount = 1;
            keyframeAnimation.calculationMode = kCAAnimationPaced;
            keyframeAnimation.removedOnCompletion = YES;
            keyframeAnimation.fillMode = kCAFillModeForwards;
            keyframeAnimation.duration = duration;
            keyframeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [point1.layer addAnimation:keyframeAnimation forKey:nil];
            
            point3.center = point2Center;
            point2.center = point1Center;
            
        } completion:^(BOOL finish) {
            point1.center = point3Center;
            self.points = @[point2, point3, point1];
            [self startAnimation];
        }];
    }
}

- (void)stopLoading {
    self.loading = NO;
    self.hidden = YES;
}

@end
