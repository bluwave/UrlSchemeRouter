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
    
    // Set-up code here.
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
    Route * r = [[Route alloc] initWithRegex:@"^foo://(actionA)" adapterClassName:nil destinationViewControllerName:nil];

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

@end
