//
//  BusinessView.h
//  
//
//  Created by Malachy Donovan on 10/24/15.
//
//

#import <UIKit/UIKit.h>

@interface BusinessView : UIView

@property UILabel *myLabel;
@property UILabel *approximate;
@property float percentage;
@property UIView *percentView;
@property int maximum;
@property UIButton *myButton;

- (id)initWithFrame:(CGRect)frame;


@end
