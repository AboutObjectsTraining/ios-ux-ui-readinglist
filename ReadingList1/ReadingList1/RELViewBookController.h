#import <UIKit/UIKit.h>

@class Book;

@interface RELViewBookController : UITableViewController

@property (strong, nonatomic) Book *book;

@property (weak, nonatomic) IBOutlet UITableViewCell *titleCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *yearCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *firstNameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *lastNameCell;

@property (weak, nonatomic) IBOutlet UIImageView *authorImageView;

@end
