//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Edwin Cardenas on 30/01/25.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()

@property (nonatomic) UIColor *circleColor;
@property (nonatomic) UIColor *gradientTopColor;
@property (nonatomic) UIColor *gradientBottomColor;

@end

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor]; // transparent
        self.circleColor = [self getRandomColor];
    }
    
    return self;
}

- (CGPoint)getCenter:(CGRect)bounds
{
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    return center;
}

- (CAGradientLayer *)getGradientLayerWithCenter:(CGPoint)center
{
    self.gradientTopColor = [self getRandomColor];
    self.gradientBottomColor = [self getRandomColor];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.colors = @[(id)self.gradientTopColor.CGColor, (id)self.gradientBottomColor.CGColor];
    gradientLayer.locations = @[@(0.3), @(1)];
    gradientLayer.frame = self.bounds;
    
    CAShapeLayer *layerMask = [CAShapeLayer layer];
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    CGPoint triangleCenter;
    triangleCenter.x = center.x;
    triangleCenter.y = center.y - 150;
    
    [trianglePath moveToPoint:triangleCenter];
    [trianglePath addLineToPoint:CGPointMake(triangleCenter.x + 100, triangleCenter.y + 300)];
    [trianglePath addLineToPoint:CGPointMake(triangleCenter.x - 100, triangleCenter.y + 300)];
    layerMask.path = trianglePath.CGPath;
    
    gradientLayer.mask = layerMask;
    
    return gradientLayer;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    CGPoint center = [self getCenter:bounds];
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
    
    [self.circleColor setStroke];
    [path stroke];
    
    CAGradientLayer *gradientLayer = [self getGradientLayerWithCenter:center];
    [self.layer addSublayer:gradientLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.circleColor = [self getRandomColor];
    self.gradientTopColor = [self getRandomColor];
    self.gradientBottomColor = [self getRandomColor];
    
    [self setNeedsDisplay];
}

- (UIColor *)getRandomColor
{
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
