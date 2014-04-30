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

- (NSString *)palindromeWithMinInsertions
{
    if([self length] == 1 || ([self length] == 2 && [self characterAtIndex:0] == [self characterAtIndex:1]))
    {
        return self;
    }
    else
    {
        NSUInteger last = [self length] - 1;
        NSUInteger start = 0;
        for(int i = 0; i < last; i++)
        {
            if([self characterAtIndex:i] == [self characterAtIndex:last])
            {
                last--;
            }
            else
            {
                start = i + 1;
            }
        }
        NSString *prefix = [self substringWithRange:NSMakeRange(0, start)];
        NSString *reversedPrefix = [prefix reverseString];
        NSString *lastCharRemoved = [self substringToIndex:[self length] -1];
        return [NSString stringWithFormat:@"%@%@",lastCharRemoved,reversedPrefix];
    }
}

- (BOOL)isRotationOfString:(NSString *)string
{
    if([self length] == [string length])
    {
        NSString *concatString = [NSString stringWithFormat:@"%@%@",self,self];

        if([[concatString lowercaseString] rangeOfString:[string lowercaseString]].location != NSNotFound)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}

- (BOOL)isAnagramOfString:(NSString *)string
{
    if([self length] != [string length])
    {
        return false;
    }
    NSString *lhsString = [self lowercaseString];
    NSString *rhsString = [string lowercaseString];
    NSArray *lhsArray = [lhsString convertToArray];
    NSArray *rhsArray = [rhsString convertToArray];
    lhsArray = [lhsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    rhsArray = [rhsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return [lhsArray isEqualToArray:rhsArray];
}

- (NSArray *)convertToArray
{
    NSMutableArray *characterArray = [[NSMutableArray alloc]init];
    NSUInteger i = 0;
    while(i < [self length])
    {
        NSRange characterRange = [self rangeOfComposedCharacterSequenceAtIndex:i];
        NSString *character = [self substringWithRange:characterRange];
        [characterArray addObject:character];
        i = i + characterRange.length;
    }
    return characterArray;
}

- (BOOL)isInDictionary
{
    UITextChecker *dictionaryCheck = [[UITextChecker alloc]init];
    NSString *language = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
    NSRange rangeOfMisspelling = [dictionaryCheck rangeOfMisspelledWordInString:self range:NSMakeRange(0, [self length]) startingAt:0 wrap:NO language:language];
    return rangeOfMisspelling.location == NSNotFound;
                    
}

- (unichar)firstNonRepeatedCharacter
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    for(int i=0;i<[self length];i++)
    {
        NSString *characterKey = [NSString stringWithFormat:@"%C",[self characterAtIndex:i]];
        NSNumber *value = [NSNumber numberWithInt:[[dictionary objectForKey:characterKey]integerValue] + 1];
        [dictionary setObject:value forKey:characterKey];
    }
    
    for(NSString *key in dictionary)
    {
        if([(NSNumber*)[dictionary objectForKey:key] isEqualToNumber:[NSNumber numberWithInt:1]])
        {
            return [key characterAtIndex:0];
        }
    }
    return 0;
}

@end
