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
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    BNRHypnosisView *hyposisView = [[BNRHypnosisView alloc] initWithFrame:bigRect];
    
    UIScrollView *scrollView = [UIScrollView new];
    
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.contentSize = bigRect.size;
    
    [scrollView addSubview:hyposisView];
    
    [self.view addSubview:scrollView];
    
    [NSLayoutConstraint activateConstraints:@[
        [scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
}

@end
