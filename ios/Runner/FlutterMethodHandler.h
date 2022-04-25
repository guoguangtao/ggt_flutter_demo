//
//  FlutterMethodHandler.h
//  Runner
//
//  Created by guogt on 2022/4/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FlutterPluginRegistry;

@interface FlutterMethodHandler : NSObject

#pragma mark - Property


#pragma mark - Method

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry> *)registry;

@end

NS_ASSUME_NONNULL_END
