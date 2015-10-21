//
//  UIImage+RELAdditions.h
//  ReadingList1
//
//  Created by Jonathan on 10/29/13.
//  Copyright (c) 2013 About Objects. All rights reserved.
//
#import <UIKit/UIKit.h>

extern NSString * const RELDefaultImageName;

@interface UIImage (RELAdditions)

+ (NSString *)REL_defaultImageName;

+ (UIImage *)REL_imageNamed:(NSString *)name;

@end
