//
//  ViewController.h
//  RegularExpressionValidation
//
//  Created by Paulo Carvalho on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

-(IBAction)validateWithNSPredicate:(id)sender;
-(IBAction)dismissKeyboard:(id)sender;
-(IBAction)launchURL:(id)sender;

@end
