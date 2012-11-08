//
// Created by grichards on 11/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Router : NSObject


@property(nonatomic, strong) NSMutableArray * routes;

-(BOOL) openUrl:(NSURL *) url;

@end