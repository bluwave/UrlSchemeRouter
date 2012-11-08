//
// Created by grichards on 11/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Route.h"

@interface Route()
@end


@implementation Route

- (id)initWithRegex:(NSString *)regex adapterClassName:(NSString *)adapterClassName routingHandler:(void (^)(NSURL *, id))routingHandler
{
    self = [super init];
    if (self)
    {
        _regex = regex;
        _adapterClassName = adapterClassName;
        self.routingHandler = routingHandler;
    }

    return self;
}

+ (id)objectWithRegex:(NSString *)regex adapterClassName:(NSString *)adapterClassName routingHandler:(void (^)(NSURL *, id))routingHandler
{
    return [[Route alloc] initWithRegex:regex adapterClassName:adapterClassName routingHandler:routingHandler];
}

-(BOOL) matchesUrl:(NSURL *) url_;
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:_regex options:NSRegularExpressionCaseInsensitive error:nil];

    NSString * url  = [url_ absoluteString];

    NSRange range = NSMakeRange(0, [url length]);

    int matches = [regex numberOfMatchesInString:url options:0 range:range];

//    [regex enumerateMatchesInString:url options:0 range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop)
//    {
//        for(int i = 1; i < [result numberOfRanges]; i++)
//        {
//
//            NSString *match = [url substringWithRange:[result rangeAtIndex:i]];
//            NSLog(@"%s %d) %@",__func__, i, match);
//
//        }
//    }];

    return matches > 0;
}


@end