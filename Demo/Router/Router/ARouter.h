//
//  ARouter.h
//  Router
//
//  Created by 刘科 on 2018/6/24.
//  Copyright © 2018 刘科. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 基本的Router功能，
 */
@interface ARouter : NSObject


/**
 判断是否可以处理url
 @param url 可以带scheme协议,http协议或者系统协议
 @return YES表示可以处理，NO表示不能处理
 */
+ (BOOL) canOpenURL:(NSString*)url;


/**
 打开一个url
 @param url 可以带scheme协议,http协议或者系统协议
 @return YES表示可以处理，NO表示不能处理
 */
+ (BOOL) openURL:(NSString*)url;
+ (BOOL) openURL:(NSString*)url parameter:(NSDictionary *)parameter;
/**
 * 打开一个 scheme 字符串，传递参数并支持回调
 * @param url schema 字符串
 * @param parameter 参数
 * @param callback 这个回调，需要由具体的 ViewController 来支持
 * @return YES表示可以处理，NO表示不能处理
 */
+ (BOOL) openURL:(NSString*)url parameter:(NSDictionary *)parameter callback:(void(^)(NSDictionary *))callback;
/**
 * 注册 schema,具体处理由注册者来完成
 * @param scheme schema 协议
 * @param handler 处理回调
 */
+ (void) register:(NSString *)scheme handler:(void(^)(NSDictionary *, void(^)(NSDictionary *)))handler;

@end
