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
    
    // Reverse Test
	NSString *toBeReversed = @"Hello World";
    NSLog(@"Original: %@\tReversed: %@",toBeReversed,[toBeReversed reverseString]);
    
    // Palidrome Detection
    NSString *palindrome = @"Mom";
    NSLog(@"Is %@ a palidrome: %@",palindrome,[palindrome isPalindrome] ? @"Yes" : @"No");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
