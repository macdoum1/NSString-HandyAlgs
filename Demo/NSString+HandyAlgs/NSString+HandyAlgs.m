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

- (NSString *)makePalindrome
{
    return [self recursivePalidrome:self];
}

- (NSString *)recursivePalidrome:(NSString *)string
{
    if([string length] == 1 || ([string length] == 2 && [string characterAtIndex:0] == [string characterAtIndex:1]))
    {
        return string;
    }
    else
    {
        NSUInteger last = [string length] - 1;
        NSUInteger start = 0;
        for(int i = 0; i < last; i++)
        {
            if([string characterAtIndex:i] == [string characterAtIndex:last])
            {
                last--;
            }
            else
            {
                start = i + 1;
            }
        }
        NSString *prefix = [string substringWithRange:NSMakeRange(0, start)];
        NSString *reversedPrefix = [prefix reverseString];
        return [NSString stringWithFormat:@"%@%@",string,reversedPrefix];
    }
}

@end
