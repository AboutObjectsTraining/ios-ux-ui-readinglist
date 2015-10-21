#import "RELFileUtilitiies.h"


NSString *RELDocumentsDirectoryPath(void)
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return paths[0];
}

NSString *RELPathForDocument(NSString *name, NSString *type)
{
    NSString *path = RELDocumentsDirectoryPath();
    
    return [[path stringByAppendingPathComponent:name] stringByAppendingPathExtension:type];
}
