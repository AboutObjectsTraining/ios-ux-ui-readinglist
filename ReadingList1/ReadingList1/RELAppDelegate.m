#import "RELAppDelegate.h"

@implementation RELAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configureAppearance];
    return YES;
}


- (void)configureAppearance
{
//    self.window.tintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.1 alpha:1.0];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.99 green:0.98 blue:0.96 alpha:0]];
//    [[UIToolbar appearance] setTintColor:[UIColor purpleColor]];
    [[UITableView appearance] setBackgroundColor:[UIColor grayColor]];
}

@end
