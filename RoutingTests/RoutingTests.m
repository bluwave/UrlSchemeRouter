//
//  RoutingTests.m
//  RoutingTests
//
//  Created by Garrett Richards on 11/7/12.
//
//

#import "RoutingTests.h"
#import "Route.h"
#import "Router.h"



@implementation RoutingTests

- (void)setUp
{
    [super setUp];


}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    id foo = nil;
    BOOL respondsToSelector = [foo respondsToSelector:@selector(description)];
    STAssertFalse(respondsToSelector, @"");

}

-(void) testRouteRegex
{
    Route * r = [[Route alloc] initWithRegex:@"^foo://(actionA)" adapterClassName:nil routingHandler:nil];

    NSURL * testUrl = [NSURL URLWithString:@"foobar://actionA?query=foobar"];
    STAssertFalse([r matchesUrl:testUrl], @"testUrl should not match regex: %@ != %@", r.regex, [testUrl absoluteString]);

    testUrl = [NSURL URLWithString:@"foo://actionA?foo=bar"];
    STAssertTrue([r matchesUrl:testUrl], @"testUrl should match regex: %@ != %@", r.regex, [testUrl absoluteString]);


    r.regex = @"^foo://(actionA|actionB)";

    testUrl = [NSURL URLWithString:@"foo://actionC?foo=bar"];
    STAssertFalse([r matchesUrl:testUrl], @"testUrl should not match regex: %@ != %@", r.regex, [testUrl absoluteString]);


    testUrl = [NSURL URLWithString:@"foo://actionB?foo=bar"];
    STAssertTrue([r matchesUrl:testUrl], @"testUrl should match regex: %@ != %@", r.regex, [testUrl absoluteString]);

    r.regex = @"^foo://actionX";
    testUrl = [NSURL URLWithString:@"foo://actionX/?hello=world&foobar=barfoo"];
    STAssertTrue([r matchesUrl:testUrl], @"testUrl should match regex: %@ != %@", r.regex, [testUrl absoluteString]);

}

-(void) testRouter
{
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);


    Route * r = [[Route alloc] initWithRegex:@"^foo://(actionA)" adapterClassName:@"RouteAdapter" routingHandler:^(NSURL * url_ , id params)
    {
        STAssertNotNil(params, @"params nil");
        STAssertEqualObjects( [params objectAtIndex:0],@"query=foobar",nil);
        dispatch_semaphore_signal(sema);
    }];

    NSURL * testUrl = [NSURL URLWithString:@"foo://actionA?query=foobar"];

    Router *router = [Router new];

    [router.routes addObject:r];

    [router openUrl:testUrl];

    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);

}



@end
