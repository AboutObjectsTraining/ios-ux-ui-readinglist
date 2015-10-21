#import <UIKit/UIKit.h>

@class Book;

@interface RELAddBookController : UITableViewController

@property (strong, nonatomic) Book *book;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;


@end
