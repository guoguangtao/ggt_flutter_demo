//
//  YXCWebController.m
//  Runner
//
//  Created by guogt on 2022/4/24.
//

#import "YXCWebController.h"
#import <WebKit/WebKit.h>

@interface YXCWebController ()

@property (nonatomic, copy) NSString *localPath; /**< 本地文件路径 */
@property (nonatomic, strong) UIButton *castButton; /**< 投屏按钮 */
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation YXCWebController

/// 刷新UI
- (void)injected {

}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self setupConstraints];

    if (self.localPath != nil && self.localPath.length) {
        [self loadLocalFile:self.localPath];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.navigationController setNavigationBarHidden:YES];
}

- (void)dealloc {

}


#pragma mark - Custom Accessors (Setter 与 Getter 方法)


#pragma mark - IBActions


#pragma mark - Public

- (instancetype)initWithLocalPath:(NSString *)localPath {

    if (self = [super init]) {
        self.localPath = localPath;
    }

    return self;
}

- (void)loadLocalFile:(NSString *)path {

    NSURL *fileURL = [NSURL fileURLWithPath:path];
    NSString *fileType = [[fileURL lastPathComponent] lowercaseString];
    if ([fileType hasSuffix:@".txt"] || [fileType hasSuffix:@".log"]) {
        NSData *data = [NSData dataWithContentsOfURL:fileURL];
        // 第一种方法，用了过期的 API，但是效果比较好，有排版
        NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
        NSURLResponse *response = nil;
        [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        if (response.MIMEType) {
            [self.webView loadData:data MIMEType:response.MIMEType characterEncodingName:@"UTF-8" baseURL:fileURL];
        }

        // 第二种方法，虽然没有使用过期的 API ，但是效果没有第一种好，没有排版
//        [self.webView loadData:data MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:fileURL];

        // 第三种方式，效果跟第二种方式差不多
//        NSString *body = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:nil];
//        if (!body) {
//            NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//            body = [NSString stringWithContentsOfURL:fileURL encoding:enc error:nil];
//        }
//        [self.webView loadHTMLString:body baseURL:nil];
    } else {
        [self.webView loadFileURL:fileURL allowingReadAccessToURL:fileURL];
    }
}


#pragma mark - Private


#pragma mark - Protocol


#pragma mark - UI

- (void)setupUI {

    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
    self.webView.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:self.webView];

    self.castButton = [UIButton new];
    [self.castButton setTitle:@"投屏" forState:UIControlStateNormal];
    self.castButton.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:self.castButton];
    CGFloat centerX = self.view.center.x;
    CGFloat centerY = CGRectGetHeight(self.view.frame) - 100;
    self.castButton.frame = CGRectMake(0, 0, 100, 30);
    self.castButton.center = CGPointMake(centerX, centerY);
}


#pragma mark - Constraints

- (void)setupConstraints {

}


#pragma mark - Lazy


@end
