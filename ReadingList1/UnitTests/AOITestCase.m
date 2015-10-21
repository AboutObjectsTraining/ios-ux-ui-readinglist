#import "AOITestCase.h"

@implementation AOITestCase


- (void) invokeTest
{
    NSString *methodName = NSStringFromSelector([[self invocation] selector]);
    printf("\n******  %s  ******\n\n", [methodName UTF8String]);
    
    [super invokeTest];
    
    putchar('\n');
    
    
    extern void __gcov_flush(void);
    __gcov_flush();
}

@end
