//
//  UIFont+RSCustom.h
//  CustomFontTester
//
//  Created by Venkat Rao on 11/29/13.
//  Copyright (c) 2013 Rao Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (RSCustom)

/**
 
 Use this to get the custom font specified in customFont.plist.
 
 @params textStyle represents a particular text style for the font. See UIFontDescriptor.h for all text Styles
 
 @return UIFont returns a custom font with the font face specified in plist.
 
 */
+(UIFont *) customFontForTextStyle:(NSString *)textStyle;

@end
