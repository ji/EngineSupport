//
//  EngineSupportViewController.m
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EngineSupportViewController.h"
#import "ParametersViewController.h"

@interface EngineSupportViewController ()

- (IBAction)showParametersView:(id)_sender;
- (IBAction)hideParametersView:(id)_sender;

@property (nonatomic, retain) ParametersViewController *parametersViewController;
@property (nonatomic, retain) UINavigationController   *navigationController;

@end

@implementation EngineSupportViewController

@synthesize parametersViewController;
@synthesize navigationController;

- (void)dealloc
{
    RELEASE_AND_NIL(parametersViewController);
    RELEASE_AND_NIL(navigationController);
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Private category methods ()

- (IBAction)showParametersView:(id)_sender
{
    if (nil == self.parametersViewController) {
        self.parametersViewController = [[[ParametersViewController alloc] initWithNibName:@"ParametersViewController"
                                                                                    bundle:nil] autorelease];
    }
    
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:self.parametersViewController] 
                                 autorelease];
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
                                                                                    target:self
                                                                                    action:@selector(hideParametersView:)];
    self.parametersViewController.navigationItem.rightBarButtonItem = doneButtonItem;
    [doneButtonItem release];
    
    [self presentModalViewController:self.navigationController animated:YES];
}

- (IBAction)hideParametersView:(id)_sender
{
    [self dismissModalViewControllerAnimated:YES];
    RELEASE_AND_NIL(parametersViewController);
}


@end
