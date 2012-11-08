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
            [self routeUrl:url withRoute:route];
            return YES;
        }
    }
    return NO;
}

-(void) routeUrl:(NSURL *)url withRoute:(Route *) route
{
    id params = nil;
    if(route.adapterClassName)
    {
        @try
        {
            id adapter = [[NSClassFromString(route.adapterClassName) alloc] init];
            if (adapter && [adapter respondsToSelector:@selector(adaptUrl:forRoute:)])
            {
                params = [adapter adaptUrl:url forRoute:route];
            }
            else
            {
                [NSException raise:NSInvalidArgumentException format:@"adapter class name '%@' does not specify a class that implements 'RouterAdapterProtocol'", route.adapterClassName];
            }
        }
        @catch (NSException *ex)
        {
            NSLog(@"%s ** Routing adapter exception: %@", __func__, [ex description]);
        }
    }

    if (route.routingHandler)
    {
        route.routingHandler(url, params);
    }
}


@end