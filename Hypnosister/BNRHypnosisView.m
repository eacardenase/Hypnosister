//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Edwin Cardenas on 30/01/25.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor]; // transparent
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0
                      endAngle:M_PI * 2
                     clockwise:YES];
    }
    
    path.lineWidth = 10;
    
    [[UIColor grayColor] setStroke];
    [path stroke];
    
    UIColor *topColor = [UIColor colorWithRed:0.99 green:0.36 blue:0.37 alpha:1];
    UIColor *bottomColor = [UIColor colorWithRed:0.9 green:0 blue:0.45 alpha:1];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.colors = @[(id)topColor.CGColor, (id)bottomColor.CGColor];
    gradientLayer.locations = @[@(0), @(1)];
    gradientLayer.frame = bounds;
    
    CAShapeLayer *layerMask = [CAShapeLayer layer];
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    CGPoint triangleCenter;
    triangleCenter.x = center.x;
    triangleCenter.y = center.y - 150;
    
    [trianglePath moveToPoint:triangleCenter];
    [trianglePath addLineToPoint:CGPointMake(triangleCenter.x + 100, triangleCenter.y + 300)];
    [trianglePath addLineToPoint:CGPointMake(triangleCenter.x - 100, triangleCenter.y + 300)];
    layerMask.path = trianglePath.CGPath;
    
    NSLog(@"%f %f", center.x, center.y);
    
    [self.layer addSublayer:gradientLayer];
    gradientLayer.mask = layerMask;
}

@end
