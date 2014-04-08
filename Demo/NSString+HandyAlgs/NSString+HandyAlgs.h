//
//  NSString+HandyAlgs.h
//  NSString+HandyAlgs
//
//  Created by Michael MacDougall on 4/8/14.
//  Copyright (c) 2014 Michael MacDougall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HandyAlgs)

// Reverse String
- (NSString *)reverseString;

// Reverse words in string with given delimiter
- (NSString *)reverseWordsWithDelimiter:(NSString *)delimiter;

// Determines if string is palindrome (case insensitive)
- (BOOL)isPalindrome;

// Make palidrome with minimum number of insertions
- (NSString *)makePalindrome;


@end
