//
// Created by grichards on 11/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Route : NSObject

@property(nonatomic, strong) NSString *regex;
@property(nonatomic, strong) NSMutableArray * adapters;
@property(nonatomic, strong) NSString *destinationViewControllerName;

- (id)initWithRegex:(NSString *)regex adapterClassName:(NSString *)adapterClassName destinationViewControllerName:(NSString *)destinationViewControllerName;

- (id)initWithRegex:(NSString *)regex adapters:(NSArray *)adapters destinationViewControllerName:(NSString *)destinationViewControllerName;

+ (id)routeWithRegex:(NSString *)regex adapterClassName:(NSString *)adapterClassName destinationViewControllerName:(NSString *)destinationViewControllerName;

-(BOOL) matchesUrl:(NSURL *) url;


@end