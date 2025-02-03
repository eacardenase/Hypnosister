//
//  ViewController.m
//  Hypnosister
//
//  Created by Edwin Cardenas on 30/01/25.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic) BNRHypnosisView *hypnosisView;

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
//    bigRect.size.width *= 2.0;
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.contentSize = bigRect.size;
//    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.minimumZoomScale = 1;
    scrollView.maximumZoomScale = 1.5;
    
    self.hypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:self.hypnosisView];
    
//    screenRect.origin.x += screenRect.size.width;
//    BNRHypnosisView *anotherView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
//    [scrollView addSubview:anotherView];
    
    [NSLayoutConstraint activateConstraints:@[
        [scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
}

# pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.hypnosisView;
}

@end
