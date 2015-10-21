#import "UIImage+RELAdditions.h"

#import "RELViewBookController.h"
#import "RELEditBookController.h"
#import "Book.h"
#import "Author.h"

@implementation RELViewBookController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.titleCell.detailTextLabel.text = self.book.title;
    self.yearCell.detailTextLabel.text = self.book.year;
    self.firstNameCell.detailTextLabel.text = self.book.author.firstName;
    self.lastNameCell.detailTextLabel.text = self.book.author.lastName;
    
    self.authorImageView.image = [UIImage REL_imageNamed:self.book.author.lastName];
    
    self.navigationController.toolbarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.toolbarHidden = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // XXX: If we add another segue, we'll need to use identifiers here.
    
    UINavigationController *navController = segue.destinationViewController;
    RELEditBookController *editBookController = navController.viewControllers[0];
    editBookController.book = self.book;
}

@end
