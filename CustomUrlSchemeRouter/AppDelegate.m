//
//  AppDelegate.m
//  CustomUrlSchemeRouter
//
//  Created by Garrett Richards on 11/7/12.
//
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "Router.h"
#import "Route.h"

@interface AppDelegate()

@property(nonatomic, strong) Router *urlSchemeRouter;


@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;

    self.urlSchemeRouter = [[Router alloc] init];

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [_urlSchemeRouter openUrl:url];
}

-(void) setupRoutes
{
//    foo://actionA?srch=foobar
    Route * routeA = [Route objectWithRegex:@"foo://(actionA)" adapterClassName:nil routingHandler:nil];
    Route * routeB = [Route objectWithRegex:@"foo://(actionB)" adapterClassName:nil routingHandler:nil];
    Route * routeC = [Route objectWithRegex:@"foo://(actionC)" adapterClassName:@"RouteAdapter" routingHandler:^(NSURL * url, id params){
        NSLog(@"%s parsed params from adapter: %@",__func__, params);

        [[[UIAlertView alloc] initWithTitle:@"route c chosen" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];

    [_urlSchemeRouter.routes addObject:routeA];

    [_urlSchemeRouter.routes addObject:routeB];

    [_urlSchemeRouter.routes addObject:routeC];
}



@end
