/************************************************************************************
 * Copyright (C) <2011> by <Yovoslav Ivanov>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ************************************************************************************/

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
