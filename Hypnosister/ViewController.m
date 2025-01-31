//
//  ViewController.m
//  Hypnosister
//
//  Created by Edwin Cardenas on 30/01/25.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController ()

- (void)setupViews;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViews];
}

- (void)setupViews
{
    BNRHypnosisView *firstView = [BNRHypnosisView new];
    firstView.backgroundColor = [UIColor redColor];
    
    BNRHypnosisView *secondView = [[BNRHypnosisView alloc] init];
    secondView.backgroundColor = [UIColor blueColor];

    firstView.translatesAutoresizingMaskIntoConstraints = NO;
    secondView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:firstView];
    [firstView addSubview:secondView];
    
    [NSLayoutConstraint activateConstraints:@[
        [firstView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:240],
        [firstView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:160],
        [firstView.widthAnchor constraintEqualToConstant:100],
        [firstView.heightAnchor constraintEqualToConstant:150],
        
        [secondView.topAnchor constraintEqualToAnchor:firstView.topAnchor constant:30],
        [secondView.leadingAnchor constraintEqualToAnchor:firstView.leadingAnchor constant:20],
        [secondView.widthAnchor constraintEqualToConstant:50],
        [secondView.heightAnchor constraintEqualToAnchor:secondView.widthAnchor],
    ]];
}

@end
