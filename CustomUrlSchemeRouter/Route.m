//
// Created by grichards on 11/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Route.h"


@implementation Route

- (id)initWithRegex:(NSString *)regex adapterClassName:(NSString *)adapterClassName destinationViewControllerName:(NSString *)destinationViewControllerName
{
    self = [super init];
    if (self)
    {
        _regex = regex;
        _adapters = [[NSMutableArray alloc] init];
        [_adapters addObject:adapterClassName];
        _destinationViewControllerName = destinationViewControllerName;
    }

    return self;
}


- (id)initWithRegex:(NSString *)regex adapters:(NSArray *)adapters destinationViewControllerName:(NSString *)destinationViewControllerName
{
    self = [super init];
    if (self)
    {
        _regex = regex;
        _adapters = [[NSMutableArray alloc] initWithArray:adapters];
        _destinationViewControllerName = destinationViewControllerName;
    }

    return self;
}


+ (id)routeWithRegex:(NSString *)regex adapterClassName:(NSString *)adapterClassName destinationViewControllerName:(NSString *)destinationViewControllerName
{
    return [[Route alloc] initWithRegex:regex adapterClassName:adapterClassName destinationViewControllerName:destinationViewControllerName];
}

-(BOOL) matchesUrl:(NSURL *) url;
{
    return NO;
}


@end