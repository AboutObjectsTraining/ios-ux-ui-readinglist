#import "RELEditBookController.h"
#import "Book.h"
#import "Author.h"

@implementation RELEditBookController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.titleField.text     = self.book.title;
    self.yearField.text      = self.book.year;
    self.firstNameField.text = self.book.author.firstName;
    self.lastNameField.text  = self.book.author.lastName;
    
    [self.titleField becomeFirstResponder];
    
    _titleField.delegate = self;
    _yearField.delegate = self;
    _firstNameField.delegate = self;
    _lastNameField.delegate = self;
    
}

- (IBAction)nextTextField:(UITextField *)textField
{
    NSInteger tag = textField.tag;
    tag += tag == 4 ? 0 : 1;  // FIXME: replace hard-coded max value.
    
    [[self.tableView viewWithTag:tag] becomeFirstResponder];
}

- (void)updateBook
{
    self.book.title = self.titleField.text;
    self.book.year = self.yearField.text;
    self.book.author.firstName = self.firstNameField.text;
    self.book.author.lastName = self.lastNameField.text;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier hasPrefix:@"Save"]) {
        [self updateBook];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

// NOTE: Delegation example.
//
//- (void)done
//{
//    [self updateBook];
//
//    if ([self.delegate respondsToSelector:@selector(editBookController:didSaveBook:)]) {
//        [self.delegate editBookController:self didSaveBook:self.book];
//    }
//}


@end
