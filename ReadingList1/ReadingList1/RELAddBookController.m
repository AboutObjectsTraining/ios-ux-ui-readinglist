#import "RELAddBookController.h"
#import "Book.h"
#import "Author.h"

@implementation RELAddBookController

- (Book *)book
{
    if (_book == nil) {
        self.book = [[Book alloc] init];
        self.book.author = [[Author alloc] init];
    }
    return _book;
}

- (void)populateBook
{
    self.book.title = self.titleField.text;
    self.book.year = self.yearField.text;
    self.book.author.firstName = self.firstNameField.text;
    self.book.author.lastName = self.lastNameField.text;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier hasPrefix:@"Add"]) {
        [self populateBook];
    }
}

@end
