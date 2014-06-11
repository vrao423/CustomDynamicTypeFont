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
 Use this to set font
 
 @params textStyle Pass in 
 
 @return UIFont  
 */
+(UIFont *) customFontForTextStyle:(NSString *)textStyle;

@end
