//
//  RELReadingListController.h
//  ReadingList1
//
//  Created by Jonathan on 10/29/13.
//  Copyright (c) 2013 About Objects. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RELReadingListController : UITableViewController

- (IBAction)addBook:(UIStoryboardSegue *)segue;
- (IBAction)saveEdits:(UIStoryboardSegue *)segue;

- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
