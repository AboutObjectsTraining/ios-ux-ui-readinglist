#import "RELFileUtilitiies.h"
#import "UIImage+RELAdditions.h"

#import "RELReadingListController.h"
#import "RELCustomBookCell.h"

#import "RELViewBookController.h"
#import "RELEditBookController.h"
#import "RELAddBookController.h"

#import "ReadingList.h"
#import "Book.h"
#import "Author.h"


@interface RELReadingListController ()

@property (strong, nonatomic) NSMutableArray *books;

@end


@implementation RELReadingListController


- (IBAction)sort:(UISegmentedControl *)sender
{
    BOOL isAscending = sender.selectedSegmentIndex == 0;
    [self.books sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:isAscending]]];
    [self.tableView reloadData];
}



#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self loadReadingList];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier hasPrefix:@"View"])
    {
        RELViewBookController *controller = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        controller.book = self.books[indexPath.row];
    }
    else if ([segue.identifier hasPrefix:@"Add"])
    {
        // TODO: Do anything we need to do.
    }
}


#pragma mark - Unwind Segues

- (void)addBook:(UIStoryboardSegue *)segue
{
    RELAddBookController *addBookController = segue.sourceViewController;
    Book *newBook = addBookController.book;
    [self.books addObject:newBook];
    
    [self saveReadingList];
    
    NSInteger row = [self.books count] - 1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionMiddle
                                  animated:YES];
}

- (void)saveEdits:(UIStoryboardSegue *)segue
{
    [self saveReadingList];
    
    RELEditBookController *editBookController = segue.sourceViewController;
    NSInteger row = [self.books indexOfObject:editBookController.book];
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone];
}

- (void)cancel:(UIStoryboardSegue *)segue
{
    // Do nothing.
}


#pragma mark - Persistence
//
// TODO: Move persistence methods to a separate class.
//

- (void)loadReadingList
{
    NSString *path = RELPathForDocument(@"BooksAndAuthors", @"plist");
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if (dict == nil) {
        path = [[NSBundle mainBundle] pathForResource:@"BooksAndAuthors" ofType:@"plist"];
        dict = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    
    ReadingList *myReadingList = [ReadingList modelObjectWithDictionary:dict];
    
    self.title = myReadingList.title;
    self.books = [myReadingList.books mutableCopy];
    [self.books sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]];
}

- (void)saveReadingList
{
    ReadingList *newReadingList = [[ReadingList alloc] init];
    newReadingList.title = self.title;
    newReadingList.books = self.books;
    
    NSDictionary *dict = [newReadingList dictionaryRepresentation];
    NSLog(@"%@", dict);
    
    NSString *path = RELPathForDocument(@"BooksAndAuthors", @"plist");
    NSLog(@"%@", path);
    
    [dict writeToFile:path atomically:YES];
}

#pragma mark - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView
//  willDisplayCell:(RELCustomBookCell *)cell
//forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    cell.authorImageView.layer.cornerRadius = 22.0;
//}

#pragma mark - UITableViewDataSource

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // XXX: Theoretically, we should check the editing style first...
    
    [self.books removeObjectAtIndex:indexPath.row];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self saveReadingList];
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    Book *bookToBeMoved = self.books[sourceIndexPath.row];
    [self.books removeObjectAtIndex:sourceIndexPath.row];
    [self.books insertObject:bookToBeMoved atIndex:destinationIndexPath.row];
    
    [self saveReadingList];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RELCustomBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomBookCell"];
    [self populateCell:cell atIndexPath:indexPath];

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookSummary"];
//    cell.textLabel.text = book.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@  %@", book.year, book.author.fullName];
//    cell.imageView.image = [UIImage REL_imageNamed:book.author.lastName];
    
    return cell;
}

#pragma mark - Cell Population

- (void)populateCell:(RELCustomBookCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Book *book = self.books[indexPath.row];
    
    cell.bookTitleLabel.text = book.title;
    cell.bookInfoLabel.text = [NSString stringWithFormat:@"%@  %@", book.year, book.author.fullName];
    cell.authorImageView.image = [UIImage REL_imageNamed:book.author.lastName];
}


@end
