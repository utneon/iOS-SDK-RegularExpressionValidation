//
//  ViewController.m
//  RegularExpressionValidation
//
//  Created by Paulo Carvalho on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize phoneNumberTextField;
@synthesize statusLabel;

//NSPredicate Regex Validation
-(IBAction)validateWithNSPredicate:(id)sender {
    NSLog(@"validateWithNSPredicate function was called...");
    
    //check if the TextField has a value
    if ([phoneNumberTextField hasText] == false) {
        
        //set the statusLabel with the error message
        [statusLabel setText:@"TextField has no value!"];
        
        //also create an alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please insert a value first!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        NSLog(@"phoneNumberTextField has no value...");
    }
    else {
        //create a string with the Regex Rule
        NSString *vodafoneNumber = @"(\\+351|00351)?91\\d{7}";
        
        //create a NSPredicate object
        NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", vodafoneNumber];
        
        //try to match the regex
        BOOL matches = [test evaluateWithObject:[phoneNumberTextField text]];
        if (matches) {
            [statusLabel setText:@"The number is valid =)"];
        }
        else {
            [statusLabel setText:@"The number is not valid. Try again!"];
        }
    
    }
    //clear the TextField
    [phoneNumberTextField setText:nil];
    //set resignFirstResponder to dismiss the keyboard on this action
    [phoneNumberTextField resignFirstResponder]; 
}

//dismiss the Keyboard from the TextField
-(IBAction)dismissKeyboard:(id)sender {
    [phoneNumberTextField resignFirstResponder];
}

//use this method to dismiss the keyboard with delegation
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//launch url
-(IBAction)launchURL:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://github.com/utneon"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //change the keyboard type for the TextField programatically
    [phoneNumberTextField setKeyboardType:UIKeyboardTypePhonePad];
}

- (void)viewDidUnload
{
    [self setPhoneNumberTextField:nil];
    [self setStatusLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
