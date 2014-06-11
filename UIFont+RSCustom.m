//
//  UIFont+RSCustom.m
//  CustomFontTester
//
//  Created by Venkat Rao on 11/29/13.
//  Copyright (c) 2013 Rao Studios. All rights reserved.
//

#import "UIFont+RSCustom.h"

@implementation UIFont (RSCustom)

+(UIFont *) customFontForTextStyle:(NSString *)textStyle {

    NSString * contentSize = [[UIApplication sharedApplication] preferredContentSizeCategory];

    if (![[UIFont fontCache]objectForKey:contentSize]) {
        [[UIFont fontCache] setObject:[[NSCache alloc] init] forKey:contentSize];
    }

    if(![[[UIFont fontCache] objectForKey:contentSize] objectForKey:textStyle]) {
        NSString * contentSize = [[UIApplication sharedApplication] preferredContentSizeCategory];

        UIFont *preferred = [UIFont preferredFontForTextStyle:textStyle];

        UIFontDescriptor * description = [UIFontDescriptor fontDescriptorWithName:[UIFont customFontFaceForTextStyle:textStyle] size:preferred.pointSize];

        [[[UIFont fontCache] objectForKey:contentSize] setObject:[UIFont fontWithDescriptor:description size:preferred.pointSize] forKey:textStyle];
    }

    return [[[UIFont fontCache] objectForKey:contentSize] objectForKey:textStyle];
}

+(NSString *) customFontFaceForTextStyle:(NSString *) textStyle {
    return self.contentProperties[textStyle][@"Font Face"];
}

+(NSDictionary *) contentProperties {

    static NSDictionary *contentProperties;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"customFont" ofType:@"plist"];
        contentProperties = [NSDictionary dictionaryWithContentsOfFile:path];
    });

    return contentProperties;
}

+(NSCache *) fontCache {
    static NSCache * _fontCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _fontCache = [[NSCache alloc] init];
    });
    return _fontCache;
}

@end
