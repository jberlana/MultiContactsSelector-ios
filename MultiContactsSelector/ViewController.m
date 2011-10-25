//
//  ViewController.m
//  MultiContactsSelector
//
//  Created by Sergio on 25/10/11.
//  Copyright (c) 2011 Sergio. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)dealloc
{
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *showContacts = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showContacts.frame = CGRectMake(80, 100, 150, 50);
    [showContacts addTarget:self action:@selector(showContacts) forControlEvents:UIControlEventTouchUpInside];
    showContacts.titleLabel.textColor = [UIColor blackColor];
    showContacts.titleLabel.text = @"Show contacts";
    [self.view addSubview:showContacts];
}

- (void)showContacts
{
    SMContactsSelector *controller = [[SMContactsSelector alloc] initWithNibName:@"SMContactsSelector" bundle:nil];
	controller.delegate = self;
	[self presentModalViewController:controller animated:YES];
	[controller release];
}

#pragma -
#pragma SMContactsSelectorDelegate Methods

- (void)numberOfRowsSelected:(NSInteger)numberRows withTelephones:(NSArray *)telephones
{
	for (int i = 0; i < [telephones count]; i++)
	{
		NSString *str = [telephones objectAtIndex:i];
		
        str = [str reformatTelephone];
		
		NSLog(@"Telephone: %@", str);		
	}
}

@end
