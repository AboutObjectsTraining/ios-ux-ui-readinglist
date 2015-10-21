#import <UIKit/UIKit.h>

@class Book;

@interface RELEditBookController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) Book *book;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

- (IBAction)nextTextField:(UITextField *)textField;

- (void)updateBook;

@end


//// ----- Delegation Example -----
//
//@class RELEditBookController;
//@protocol RELEditBookControllerDelegate <NSObject>
//
//@optional
//- (void)editBookController:(RELEditBookController *)controller didSaveBook:(Book *)book;
//- (void)editBookControllerDidCancel:(RELEditBookController *)controller;
//
//@end
//
//@interface RELEditBookController (DelegationExample)
//
//@property (weak, nonatomic) id<RELEditBookControllerDelegate> delegate;
//
//- (IBAction)done;
//- (IBAction)cancel;
//
//@end
