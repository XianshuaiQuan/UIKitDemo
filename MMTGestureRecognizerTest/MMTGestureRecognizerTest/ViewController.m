//
//  ViewController.m
//  MMTGestureRecognizerTest
//
//  Created by 全先帅 on 2021/3/18.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture; //轻拍
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture; //平移
@property (nonatomic, strong) UIPinchGestureRecognizer *pinchGesture; //捏合（缩放）
@property (nonatomic, strong) UISwipeGestureRecognizer *swipGesture; //横扫
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture; //长按
@property (nonatomic, strong) UIRotationGestureRecognizer *rotationGesture; //旋转
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *screenEdgePanGesture; //屏幕边缘平移

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationController];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.myView];
    [self setGestureRecognizer];
    
    
}

#pragma mark - gestureRescognizer
- (void)setGestureRecognizer {
    [self.myView addGestureRecognizer:self.tapGesture];
    [self.myView addGestureRecognizer:self.swipGesture];
}

#pragma mark - navigationController
- (void)setNavigationController {
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    
    self.navigationItem.title = @"gestureRecognizer";
    self.navigationItem.rightBarButtonItem.style = UIBarButtonItemStylePlain;
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:nil];
    self.navigationItem.rightBarButtonItem = barButton;
}

#pragma mark - lazy
- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureEvent)];
        _tapGesture.numberOfTapsRequired = 1;//单击
        _tapGesture.numberOfTouchesRequired = 1;//手指数
    }
    return _tapGesture;
}

- (UISwipeGestureRecognizer *)swipGesture {
    if (!_swipGesture) {
        _swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipEvent)];
        _swipGesture.numberOfTouchesRequired = 1;
        _swipGesture.direction = UISwipeGestureRecognizerDirectionRight ;
    }
    return _swipGesture;
}

- (UIView *)myView {
    if (!_myView) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(50, 200, 300, 300)];
        _myView.backgroundColor = [UIColor greenColor];
    }
    return _myView;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.myView.frame) + 60, self.view.frame.size.width, 60)];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.font = [UIFont systemFontOfSize:30];
    }
    return _textField;
}

#pragma mark - gestureEvent
- (void)tapGestureEvent {
    self.myView.backgroundColor = [UIColor yellowColor];
    self.textField.text = @"轻拍";
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
        self.myView.backgroundColor = [UIColor greenColor];
        self.textField.text = @"";
    }];
}

- (void)swipEvent {
    self.myView.backgroundColor = [UIColor blackColor];
    self.textField.text = @"轻扫";
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
        self.myView.backgroundColor = [UIColor greenColor];
        self.textField.text = @"";
    }];
}

@end
