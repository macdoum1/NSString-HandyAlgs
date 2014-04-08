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
- (NSString *)palindromeWithMinInsertions;

// Determines if string is rotation of given string
- (BOOL)isRotationOfString:(NSString *)string;

// Determines if string is anagram of given string
- (BOOL)isAnagramOfString:(NSString *)string;

// Convert string to array (character by character)
- (NSArray *)convertToArray;

// Determines if word is in dictionary
- (BOOL)isInDictionary;

// Returns the first non-repeated character in a string
- (unichar)firstNonRepeatedCharacter;


@end
