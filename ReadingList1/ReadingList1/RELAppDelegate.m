#import "RELAppDelegate.h"
#import "RELCustomBookCell.h"
#import "RELTitleLabel.h"

@implementation RELAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configureTableViewCells];
    [self configureNavigationBar];
    [self configureToolBar];
    
    return YES;
}

- (void)configureTableViewCells
{
    [[UITableViewCell appearance] setBackgroundColor:[UIColor colorWithRed:1.0 green:.99 blue:.95 alpha:1.0]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UITableViewCell class]]] setFont:[UIFont fontWithName:@"Papyrus" size:13]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[RELCustomBookCell class]]] setFont:[UIFont fontWithName:@"Palatino" size:13]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[RELCustomBookCell class]]] setTextColor:[UIColor colorWithRed:0.4 green:0.2 blue:0.1 alpha:1.0]];
    [[RELTitleLabel appearanceWhenContainedInInstancesOfClasses:@[[RELCustomBookCell class]]] setFont:[UIFont fontWithName:@"Copperplate" size:17]];

}

- (void)configureNavigationBar
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.95 green:0.9 blue:0.8 alpha:0]];
    
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setFont:[UIFont fontWithName:@"Copperplate-Bold" size:13]];
    
    NSDictionary *barTitleTextAttributes = @{ NSFontAttributeName            : [UIFont fontWithName:@"Zapfino" size:17.0],
                                              NSForegroundColorAttributeName : [UIColor redColor]};
    
    NSDictionary *barItemTextAttributes = @{ NSFontAttributeName            : [UIFont fontWithName:@"Zapfino" size:13.0],
                                             NSForegroundColorAttributeName : [UIColor redColor] };
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:barItemTextAttributes forState:UIControlStateNormal];
    [[UINavigationBar appearance] setTitleTextAttributes:barTitleTextAttributes];
}

- (void)configureToolBar
{
    [[UIToolbar appearance] setTintColor:[UIColor orangeColor]];
    [[UIToolbar appearance] setBarTintColor:[UIColor colorWithRed:.95 green:.90 blue:.80 alpha:1.0]];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
