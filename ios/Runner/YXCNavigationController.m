//
//  YXCNavigationController.m
//  Runner
//
//  Created by guogt on 2022/6/8.
//

#import "YXCNavigationController.h"

@interface YXCNavigationController ()

@end

@implementation YXCNavigationController

/// 刷新UI
- (void)injected {

}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self setupConstraints];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    [super pushViewController:viewController
                     animated:animated];
    NSLog(@"当前导航控制器所拥有的控制器:%@", self.viewControllers);
}

- (void)dealloc {

}


#pragma mark - Custom Accessors (Setter 与 Getter 方法)


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol


#pragma mark - UI

- (void)setupUI {


}


#pragma mark - Constraints

- (void)setupConstraints {


}


#pragma mark - Lazy


@end
