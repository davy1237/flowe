//
//  ViewController.m
//  Temp
//
//  Created by Malachy Donovan on 10/23/15.
//  Copyright (c) 2015 Malachy Donovan. All rights reserved.
//

#import "ViewController.h"
#import "BusinessView.h"
#import "Parse/Parse.h"

@interface ViewController ()
@property NSMutableArray *myArray;
@property UIImageView *map;
@property UIImageView *searchIcon;
@property UIImageView *refreshIcon;
@property BusinessView *percentage;
@property NSMutableArray *nameArray;
@property NSMutableArray *percentArray;
@property NSMutableArray *maximumArray;
@property __block int zachsVariable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myArray = [[NSMutableArray alloc] init];

    _map = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 450)];
    _map.image = [UIImage imageNamed:@"actualMap.jpg"];
    [self.view addSubview:_map];
    
    _searchIcon = [[UIImageView alloc] initWithFrame:CGRectMake(335, 20, 40, 40)];
    _searchIcon.image = [UIImage imageNamed:@"searchicon.png"];
    [self.view addSubview:_searchIcon];
    
    _refreshIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 35, 35)];
    _refreshIcon.image = [UIImage imageNamed:@"refresh.png"];
    [self.view addSubview:_refreshIcon];
    
    PFQuery *query = [PFQuery queryWithClassName:@"PeopleRecord"];
    [query orderByDescending:@"time"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (object) {
            _zachsVariable = [[object objectForKey:@"num_people"] intValue];
            [self createBusinesses];
            [self initAndAnimate];
        }
    }
     ];
}

-(void)createBusinesses{
    _nameArray = [[NSMutableArray alloc] init];
    _nameArray[0] = @"PolyHack";
    _nameArray[1] = @"Dewick";
    _nameArray[2] = @"Brown and Brew";
    
    //if this variable is above 200, that's illegal
    

    if (_zachsVariable > 200) {
        _zachsVariable = 200;
    }
    
    _percentArray = [[NSMutableArray alloc] init];
    _percentArray[0] = [NSNumber numberWithInt:_zachsVariable/2];
    _percentArray[1] = [NSNumber numberWithInt:50];
    _percentArray[2] = [NSNumber numberWithInt:25];
    
    _maximumArray = [[NSMutableArray alloc] init];
    _maximumArray[0] = [NSNumber numberWithInt:200];
    _maximumArray[1] = [NSNumber numberWithInt:50];
    _maximumArray[2] = [NSNumber numberWithInt:350];
    
    for (int i = 0; i < 3; i++) {
        CGFloat x = 0;
        CGFloat y = 470 + i*((197.0 + 3 - 1)/3);
        CGFloat width = self.view.bounds.size.width;
        CGFloat height = 197.0/3;
        CGRect frame = CGRectMake(x, y, width, height);
        BusinessView *temp = [[BusinessView alloc] initWithFrame:frame];
        temp.percentage = [_percentArray[i] intValue];
        temp.maximum = [_maximumArray[i] intValue];
        temp.myLabel.text = _nameArray[i];
        temp.percentView.alpha = temp.percentage/100.0;
        int david = ((temp.percentage)/100.0) * temp.maximum;
        int donna = temp.maximum;
        
        temp.approximate.text = [NSString stringWithFormat:@"%d out of %d", david, donna];
        [self.myArray addObject: temp];
        [self.view addSubview: temp];
    }
}

- (void)initAndAnimate{
    for (int i = 0; i < _myArray.count; i++){
        BusinessView *tempBiz = _myArray[i];
        [UIView animateWithDuration:1.0
                              delay:0.5
                            options:0
                         animations:^{
                             CGRect frame2 = tempBiz.percentView.frame;
                             frame2.size.width = tempBiz.percentage;
                             tempBiz.percentView.frame = frame2;
                         }
                         completion:^(BOOL finished) {
                         }
         ];
    }
}

- (void)change:(UIButton*)sender {
    for(int i = 0; i < _myArray.count; i++){
        UIView *tempView = _myArray[i];
        if (tempView.alpha) {
            tempView.alpha = 0.0;
        }
        else {
        tempView.alpha = 1.0;
        }
        [tempView setNeedsDisplay];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
