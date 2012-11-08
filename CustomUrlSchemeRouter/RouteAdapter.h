//
// Created by grichards on 11/8/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Router.h"

@class Route;


@interface RouteAdapter : NSObject<RouterAdapterProtocol>

- (id) adaptUrl:(NSURL *)url forRoute:(Route *)route;


@end