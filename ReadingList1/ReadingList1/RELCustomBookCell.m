#import "RELCustomBookCell.h"

@interface RELCustomBookCell ()

@end



@implementation RELCustomBookCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.authorImageView.layer.cornerRadius = 5.0;
    self.authorImageView.layer.masksToBounds = YES;
}


@end
