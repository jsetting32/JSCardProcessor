//
//  JSViewController.m
<<<<<<< HEAD
//  JSCardProcessor
//
//  Created by John Setting on 10/25/2016.
=======
//  JSUtility
//
//  Created by John Setting on 10/11/2016.
>>>>>>> 6ae239243ac6e845364ddc8c7b5e096e3fb81d22
//  Copyright (c) 2016 John Setting. All rights reserved.
//

#import "JSViewController.h"
<<<<<<< HEAD

@interface JSViewController ()

=======
#import <JSCardProcessor/JSCardProcessor.h>

@interface JSViewController ()
@property (weak, nonatomic) IBOutlet JSTextFieldCardNumber *textField;
>>>>>>> 6ae239243ac6e845364ddc8c7b5e096e3fb81d22
@end

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
=======

    [self.textField setCardNumberText:@"4111111111111111"];
    [self.textField setShowCardImage:NO];
    [self.textField setErrorType:kJSTextFieldCardNumberErrorTypeNever];
>>>>>>> 6ae239243ac6e845364ddc8c7b5e096e3fb81d22
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
