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
    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:self.view.bounds];
    firstView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:firstView];
}

@end
