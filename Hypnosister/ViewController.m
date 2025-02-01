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
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.contentSize = bigRect.size;
    [self.view addSubview:scrollView];
    
    BNRHypnosisView *hyposisView = [[BNRHypnosisView alloc] initWithFrame:bigRect];
    [scrollView addSubview:hyposisView];
    
    [NSLayoutConstraint activateConstraints:@[
        [scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:-100],
        [scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:-100],
        [scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:+100],
        [scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:+100],
    ]];
}

@end
