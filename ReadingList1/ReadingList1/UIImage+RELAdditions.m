//
//  UIImage+RELAdditions.m
//  ReadingList1
//
//  Created by Jonathan on 10/29/13.
//  Copyright (c) 2013 About Objects. All rights reserved.
//
#import "UIImage+RELAdditions.h"

NSString * const RELDefaultImageName = @"NoImage";

@implementation UIImage (RELAdditions)

+ (NSString *)REL_defaultImageName
{
    return RELDefaultImageName;
}

+ (UIImage *)REL_imageNamed:(NSString *)name
{
    UIImage *image = [self imageNamed:name];
    
    return (image ? image :
            [self imageNamed:[self REL_defaultImageName]]);
}

@end
