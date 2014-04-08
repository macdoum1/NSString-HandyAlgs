//
//  ViewController.m
//  NSString+HandyAlgs
//
//  Created by Michael MacDougall on 4/8/14.
//  Copyright (c) 2014 Michael MacDougall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Reverse string test
	NSString *toBeReversed = @"Hello World";
    NSLog(@"Original: %@\tReversed: %@",toBeReversed,[toBeReversed reverseString]);
    
    // Reverse words in string
    NSString *wordsToBeReversed = @"This is a test sentence";
    NSLog(@"Original: %@\t Words Reversed:%@",wordsToBeReversed,[wordsToBeReversed reverseWordsWithDelimiter:@" "]);
    
    // Palidrome detection
    NSString *palindrome = @"Mom";
    NSLog(@"Is %@ a palidrome: %@",palindrome,[palindrome isPalindrome] ? @"Yes" : @"No");
    
    // Create palindrome with minimum insertions
    NSString *palStr = @"abda";
    NSLog(@"Original: %@\tPalidrome: %@",palStr,[palStr palindromeWithMinInsertions]);
    
    // Check if string is a rotation of given string
    NSString *rotString = @"RotatedString";
    NSString *rotStringTwo = @"StringRotated";
    NSLog(@"Is %@ a rotation of %@: %@",rotString,rotStringTwo,[rotString isRotationOfString:rotStringTwo] ? @"Yes" : @"No");
    
    // Check if string is an anagram of given string
    NSString *anaString = @"Silent";
    NSString *anaStringTwo = @"Listen";
    NSLog(@"Is \"%@\" an anagram of \"%@\": %@",anaString,anaStringTwo,[anaString isAnagramOfString:anaStringTwo] ? @"Yes" : @"No");
    
    // Convert string to array
    NSString *stringForArray = @"Array String";
    NSArray *characterArrayFromString = [stringForArray convertToArray];
    NSLog(@"String: %@\t ArrayofChars:%@",stringForArray,characterArrayFromString);
    
    // Check if word is in dictionary
    NSString *dictWord = @"Definitely";
    NSLog(@"Is %@ in dictionary: %@",dictWord,[dictWord isInDictionary] ? @"Yes" : @"No");
    
    // Find first non-repeated character
    NSString *repeatedCharacters = @"ababnexnetjtj";
    NSLog(@"First non-repeated character in %@ is %C",repeatedCharacters,[repeatedCharacters firstNonRepeatedCharacter]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
