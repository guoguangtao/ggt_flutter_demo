//
//  YXCMainController.m
//  Runner
//
//  Created by guogt on 2022/4/24.
//

#import "YXCMainController.h"
#import "FlutterMethodHandler.h"

@interface YXCMainController ()

@end

@implementation YXCMainController

/// 刷新UI
- (void)injected {
    
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self setupConstraints];
    [FlutterMethodHandler registerWithRegistry:self];
}

- (void)dealloc {

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES];
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
