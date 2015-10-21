#import "ModelStuff.h"

#import "AOITestCase.h"
#import "Book.h"
#import "Author.h"

@interface BookTests : AOITestCase

@end


@implementation BookTests


- (void)testKVCSetValueForAuthorKeyWithDictionary
{
    Book *book = [[Book alloc] init];
    NSDictionary *authorDict = @{ RELAuthorFirstNameKey : RELAuthorFirstNameValue2,
                                  RELAuthorLastNameKey  : RELAuthorLastNameValue2 };
    
    XCTAssertNoThrow([book setValue:authorDict forKey:RELBookAuthorKey],
                     @"Using KVC to set author property should work for both NSDictionary and Author classes");
}

- (void)testKVCSetValueForAuthorKeyWithAuthor
{
    Book *book = [[Book alloc] init];
    Author *author = [Author modelObjectWithDictionary:@{ RELAuthorFirstNameKey : RELAuthorFirstNameValue2,
                                                          RELAuthorLastNameKey  : RELAuthorLastNameValue2 }];
    
    XCTAssertNoThrow([book setValue:author forKey:RELBookAuthorKey],
                     @"Using KVC to set author property should work for both NSDictionary and Author classes");
}


// QUESTION: Is this just testing Apple's KVC implementation?
//
- (void)testKVCSetValueForAuthorKeyWithInvalidInstanceType
{
    Book *book = [[Book alloc] init];
    
    [book setValue:@"Foo" forKey:RELBookAuthorKey];
    
    XCTAssertThrows(book.author.firstName, @"We abused KVC to slam an NSString into the author property");
}


- (void)testDictionaryRepresentationWithNilAuthor
{
    Book *book = [Book modelObjectWithDictionary:@{ RELBookTitleKey : RELBookTitleValue2,
                                                    RELBookYearKey  : RELBookYearValue2 }];
    
    NSLog(@"%@", book);
    
    XCTAssertNoThrow([book dictionaryRepresentation], @"");
}

// QUESTION: Is this just testing Apple's KVC implementation?
//
//- (void)testKVCSetValueForAuthorKeyWithInvalidKey
//{
//    Book *book = [[Book alloc] init];
//    
//    XCTAssertThrows([book setValue:nil forKey:@"foo"], @"Using KVC with an invalid key should throw.");
//}

// NOTE: Lifecycle cleanup can be tricky to test.
//
- (void)testBookDeallocatesAuthor
{
    __weak Author *author = nil;
    
    @autoreleasepool {
        Book *book = [Book modelObjectWithDictionary:
                      @{ RELBookTitleKey  : RELBookTitleValue2,
                         RELBookYearKey   : RELBookYearValue2,
                         RELBookAuthorKey : @{ RELAuthorFirstNameKey : RELAuthorFirstNameValue2,
                                               RELAuthorLastNameKey  : RELAuthorLastNameValue2 }}];
        author = book.author;
        book = nil;
    }
    
    XCTAssertNil(author, @"Author instance should have been released in dealloc.");
}

@end
