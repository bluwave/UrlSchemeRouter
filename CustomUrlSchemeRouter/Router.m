//
// Created by grichards on 11/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Router.h"
#import "Route.h"


@implementation Router


- (id)init
{
    self = [super init];
    if (self)
    {
        _routes = [NSMutableArray array];
    }

    return self;
}


-(BOOL) openUrl:(NSURL *) url
{

    for(int i = 0; i < [_routes count]; i++)
    {
        Route *route = [_routes objectAtIndex:i];
        if ([route matchesUrl:url])
        {
            break;
        }
    }
    return NO;
}


@end