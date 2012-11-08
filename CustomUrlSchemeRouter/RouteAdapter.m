//
// Created by grichards on 11/8/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "RouteAdapter.h"
#import "Route.h"


@implementation RouteAdapter

- (id) adaptUrl:(NSURL *)url forRoute:(Route *)route
{
     NSString * query = url.query;
    return [query componentsSeparatedByString:@"&"];
}


@end