//
//  YXCWebController.h
//  Runner
//
//  Created by guogt on 2022/4/24.
//

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXCWebController : UIViewController

#pragma mark - Property


#pragma mark - Method

/// 加载本地文件
/// @param localPath 本地文件路径
- (instancetype)initWithLocalPath:(NSString *)localPath;

@end

NS_ASSUME_NONNULL_END
