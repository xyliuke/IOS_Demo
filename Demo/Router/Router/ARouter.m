//
//  ARouter.m
//  Router
//
//  Created by 刘科 on 2018/6/24.
//  Copyright © 2018 刘科. All rights reserved.
//

#import "ARouter.h"

static NSMutableDictionary<NSString*, void(^)(NSDictionary *, void(^)(NSDictionary *))> *data;

@implementation ARouter

+ (void)initialize {
    [super initialize];
    data = [[NSMutableDictionary alloc] initWithCapacity:20];
}

+ (BOOL) canOpenURL:(NSString *)url {
    if (url && [url isKindOfClass:[NSString class]]) {
        NSString *scheme = nil;
        NSRange range = [url rangeOfString:@"?"];
        if (range.location != NSNotFound) {
            scheme = [url substringToIndex:range.location];
        } else {
            scheme = url;
        };
        void(^handler)(NSDictionary *, void(^)(NSDictionary *)) = data[scheme];
        if (handler) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL) openURL:(NSString *)url {
    return [ARouter openURL:url parameter:nil];
}

+ (BOOL) openURL:(NSString *)url parameter:(NSDictionary *)parameter {
    return [ARouter openURL:url parameter:parameter callback:nil];
}

+ (BOOL)openURL:(NSString *)url parameter:(NSDictionary *)parameter callback:(void (^)(NSDictionary *))callback {
    if (url && [url isKindOfClass:[NSString class]]) {
        NSURLComponents* urlCom = [[NSURLComponents alloc]initWithString:url];
        if (urlCom) {
            NSArray<NSURLQueryItem*> *query = urlCom.queryItems;
            NSString* scheme = nil;

            NSMutableDictionary* p = [[NSMutableDictionary alloc]initWithCapacity: 20];
            if (parameter) {
                [p addEntriesFromDictionary:parameter];
            }
            if (query && query.count > 0) {
                for (NSURLQueryItem* item in query) {
                    p[item.name] = item.value;
                }
            }
            NSRange range = [url rangeOfString:@"?"];
            if (range.location != NSNotFound) {
                scheme = [url substringToIndex:range.location];
            } else {
                scheme = url;
            }

            void(^handler)(NSDictionary *, void(^)(NSDictionary *)) = data[scheme];
            NSAssert(handler, @"没有找到对应的scheme");
            if (handler) {
                handler(p, callback);
                return YES;
            }
        }
    }
    return NO;
}

+ (void)register:(NSString *)scheme handler:(void (^)(NSDictionary *, void(^)(NSDictionary *)))handler {
    if (scheme && handler) {
        data[scheme] = handler;
    }
}


@end
