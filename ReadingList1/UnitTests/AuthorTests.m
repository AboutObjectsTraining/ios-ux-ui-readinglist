#import "ModelStuff.h"

#import "AOITestCase.h"
#import "Author.h"

@interface AuthorTests : AOITestCase

@end



@implementation AuthorTests

- (void)testCreateAuthor
{
    Author *author = [[Author alloc] init];
    XCTAssertNotNil(author, @"Result of calling alloc/init on Author should not be nil");
}

- (void)testFullName
{
    Author *author = [Author modelObjectWithDictionary:@{RELAuthorFirstNameKey : RELAuthorFirstNameValue1,
                                                         RELAuthorLastNameKey : RELAuthorLastNameValue1}];
    NSString *actualValue = author.fullName;
    NSString *expectedValue = RELAuthorFullNameValue1;
    
    XCTAssertEqualObjects(actualValue, expectedValue, @"Full name of author should be last name first, separated by comma and space.");
}

- (void)testFullNameWithNoFirstName
{
    Author *author = [Author modelObjectWithDictionary:@{RELAuthorLastNameKey : RELAuthorLastNameValue1}];
    NSString *actualValue = author.fullName;
    NSString *expectedValue = RELAuthorFullNameValue1NoFirstName;
    
    XCTAssertEqualObjects(actualValue, expectedValue, @"Full name of author should be last name first, separated by comma and space.");
}

- (void)testFullNameWithNoLastName
{
    Author *author = [Author modelObjectWithDictionary:@{RELAuthorFirstNameKey : RELAuthorFirstNameValue1}];
    NSString *actualValue = author.fullName;
    NSString *expectedValue = RELAuthorFullNameValue1NoLastName;
    
    XCTAssertEqualObjects(actualValue, expectedValue, @"Full name of author should be last name first, separated by comma and space.");
}

- (void)testFullNameWithNoFirstOrLastName
{
    Author *author = [Author modelObjectWithDictionary:nil];
    NSString *actualValue = author.fullName;
    NSString *expectedValue = RELAuthorFullNameValue1NoFirstOrLastName;
    
    XCTAssertEqualObjects(actualValue, expectedValue, @"Full name of author should be last name first, separated by comma and space.");
}


@end
