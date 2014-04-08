//
//  NSString+HandyAlgs.m
//  NSString+HandyAlgs
//
//  Created by Michael MacDougall on 4/8/14.
//  Copyright (c) 2014 Michael MacDougall. All rights reserved.
//

#import "NSString+HandyAlgs.h"

@implementation NSString (HandyAlgs)

- (NSString *)reverseString
{
    NSMutableString *reverseString = [NSMutableString string];
    NSInteger stringLength = [self length];
    while(stringLength > 0)
    {
        stringLength--;
        [reverseString appendString:[self substringWithRange:NSMakeRange(stringLength, 1)]];
    }
    return reverseString;
}

- (NSString *)reverseWordsWithDelimiter:(NSString *)delimiter
{
    NSArray *words = [self componentsSeparatedByString:delimiter];
    NSMutableString *reversedWords = [NSMutableString string];
    for(NSString *word in [words reverseObjectEnumerator])
    {
        [reversedWords appendFormat:@"%@ ",word];
    }
    return reversedWords;
}
- (BOOL)isPalindrome
{
    return [self caseInsensitiveCompare:[self reverseString]] == NSOrderedSame;
}

@end
