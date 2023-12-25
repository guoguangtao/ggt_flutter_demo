//
//  FlutterMethodHandler.m
//  Runner
//
//  Created by guogt on 2022/4/24.
//

#import "FlutterMethodHandler.h"
#import <Flutter/Flutter.h>
#import "GeneratedPluginRegistrant.h"
#import "YXCWebController.h"
#import "YXCNativeController.h"

@interface FlutterMethodHandler ()

@property (nonatomic, strong) FlutterMethodChannel *methodChannel; /**< 方法对象 */
@property (nonatomic, strong) NSMutableDictionary *flutterResults; /**< Flutter 调用 OC 方法回调 */
@property (nonatomic, weak) FlutterViewController *mainController;

@end

@implementation FlutterMethodHandler


#pragma mark - Lifecycle

static FlutterMethodHandler *_instance;
static NSString *channelName = @"com.lebo.channel";

+ (instancetype)shareInstance {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    });
    
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });

    return _instance;
}

- (void)dealloc {

}


#pragma mark - Custom Accessors (Setter 方法)


#pragma mark - Public

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry> *)registry {

    [[self shareInstance] initMethodChannel:(FlutterViewController *)registry];
    [GeneratedPluginRegistrant registerWithRegistry:registry];
}


#pragma mark - Private

- (void)initMethodChannel:(FlutterViewController *)controller {

    if (controller == nil) {
        NSLog(@"获取到根控制器为空");
        return;
    }
    self.mainController = controller;
    _instance.flutterResults = [NSMutableDictionary dictionary];
    _instance.methodChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:controller.binaryMessenger];
    [_instance.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSLog(@"接收到 Flutter 调用 %@ 方法", call.method);
        NSString *methoName = call.method;
        NSDictionary *arguments = (NSDictionary *)call.arguments;
        [_instance.flutterResults setValue:result forKey:methoName];
        if ([methoName isEqualToString:@"openLocalFile"]) {
            [_instance openLocalFile:arguments];
            result(@0);
        } else if ([methoName isEqualToString:@"jumpNativeView"]) {
            [_instance jumpNativeView];
            result(@0);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
}

- (void)openLocalFile:(NSDictionary *)parameter {
    NSString *path = parameter[@"path"];
    if (path == nil || path.length == 0) return;
    YXCWebController *controller = [[YXCWebController alloc] initWithLocalPath:path];
    [self pushViewController:controller];
    [self.flutterResults removeObjectForKey:@"openLocalFile"];
}

/// 跳转原生界面
- (void)jumpNativeView {

    YXCNativeController *controller_01 = [YXCNativeController new];
    controller_01.view.backgroundColor = UIColor.orangeColor;
    controller_01.title = @"第一个控制器";
    [self pushViewController:controller_01];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        YXCNativeController *controller_02 = [YXCNativeController new];
        controller_02.view.backgroundColor = UIColor.redColor;
        controller_02.title = @"第二个控制器";
        [self pushViewController:controller_02];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mainController pushRoute:@"/UseTimer"];
    });
}

- (void)pushViewController:(UIViewController *)controller {

    UIViewController *rootController = [FlutterMethodHandler getRootViewController];
    if ([rootController isKindOfClass:[UINavigationController class]]) {
        [((UINavigationController *)rootController) pushViewController:controller animated:YES];
    } else {
        UINavigationController *navigationController = rootController.navigationController;
        if (navigationController) {
            [rootController.navigationController pushViewController:controller animated:YES];
        } else {
            [rootController presentViewController:controller animated:YES completion:nil];
        }
    }
}

+ (UIViewController *)getRootViewController {
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    if (window == nil) {
        NSLog(@"获取到 window 为空");
        return nil;
    }
    UIViewController *controller = window.rootViewController;
    return controller;
}

#pragma mark - Protocol


#pragma mark - Lazy


@end
