//
// Created by grichards on 11/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Route : NSObject


@property(nonatomic, strong) NSString *regex;
@property(nonatomic, strong) NSString *adapterClassName;

@property(nonatomic, copy) void(^routingHandler)(NSURL *url, id adapterResult);

- (id)initWithRegex:(NSString *)regex adapterClassName:(NSString *)adapterClassName routingHandler:(void (^)(NSURL *, id))routingHandler;

+ (id)objectWithRegex:(NSString *)regex adapterClassName:(NSString *)adapterClassName routingHandler:(void (^)(NSURL *, id))routingHandler;

-(BOOL) matchesUrl:(NSURL *) url;


@end