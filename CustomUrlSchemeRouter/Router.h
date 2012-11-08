//
// Created by grichards on 11/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@protocol RouterAdapterProtocol <NSObject>
-(id)adaptUrl:(NSURL *) url forRoute:(Route *) route;
@end

@interface Router : NSObject

@property(nonatomic, strong) NSMutableArray * routes;

-(BOOL) openUrl:(NSURL *) url;

@end