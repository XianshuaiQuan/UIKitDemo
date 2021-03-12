//
//  ViewController.m
//  UINavigationController
//
//  Created by 全先帅 on 2021/3/11.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
