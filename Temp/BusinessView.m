//
//  BusinessView.m
//  
//
//  Created by Malachy Donovan on 10/24/15.
//
//

#import "BusinessView.h"

@implementation BusinessView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, 200, 20)];
        [_myLabel setTextColor:[UIColor blackColor]];
        [_myLabel setBackgroundColor:[UIColor clearColor]];
        [_myLabel setFont:[UIFont fontWithName: @"Arial" size: 16.0f]];
        [self addSubview:_myLabel];
        
        self.percentView = [[UIView alloc] initWithFrame:CGRectMake(250, 25, 0, 25) ];
        self.percentView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:1.0];
        [self addSubview:_percentView];
        
        self.approximate = [[UILabel alloc] initWithFrame:CGRectMake(256, 25, 100, 25)];
        [_approximate setTextColor:[UIColor clearColor]];
        [_approximate setBackgroundColor:[UIColor clearColor]];
        [_approximate setFont:[UIFont fontWithName: @"Arial-BoldMT" size: 13.0f]];
        [self addSubview:_approximate];
        
        self.myButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_myButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        [_myButton setTitle:@"" forState:UIControlStateNormal];
        [_myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _myButton.frame = CGRectMake(250, 25, 100, 25);
        _myButton.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
        [self addSubview:_myButton];

        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(250.0, 25.0)];
        [path addLineToPoint:CGPointMake(350.0, 25.0)];
        [path addLineToPoint:CGPointMake(350.0, 50.0)];
        [path addLineToPoint:CGPointMake(250.0, 50.0)];
        [path addLineToPoint:CGPointMake(250.0, 25.0)];
        
        [path moveToPoint:CGPointMake(frame.origin.x, 0)];
        [path addLineToPoint:CGPointMake(frame.origin.x + frame.size.width, 0)];
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = [path CGPath];
        shapeLayer.strokeColor = [[UIColor grayColor] CGColor];
        shapeLayer.lineWidth = 1.0;
        shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        [self.layer addSublayer: shapeLayer];
    }
    return self;
}

- (void)change:(UIButton*)sender
{
    if ([_approximate.textColor isEqual:[UIColor clearColor]]) {
        [_approximate setTextColor:[UIColor blackColor]];
        self.percentView.alpha = 0.0;
    }
    else {
       [_approximate setTextColor:[UIColor clearColor]];
        self.percentView.alpha = _percentage/100.0;
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
