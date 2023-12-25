//
//  YXCNativeController.m
//  Runner
//
//  Created by guogt on 2022/6/8.
//

#import "YXCNativeController.h"

@interface YXCNativeController ()

@end

@implementation YXCNativeController

/// 刷新UI
- (void)injected {

}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self setupConstraints];
}

- (void)dealloc {

    NSLog(@"%s", __func__);
}

#pragma mark - Custom Accessors (Setter 与 Getter 方法)


#pragma mark - IBActions

- (void)back {

    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol


#pragma mark - UI

- (void)setupUI {

    UIButton *backButton = [UIButton new];
    backButton.frame = CGRectMake(100, 100, 100, 50);
    backButton.backgroundColor = UIColor.purpleColor;
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}


#pragma mark - Constraints

- (void)setupConstraints {


}


#pragma mark - Lazy


@end
