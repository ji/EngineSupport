//
//  BoolParameter.m
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BoolParameterController.h"

#define PARAMETER_NAME_LABEL_TAG        10
#define PARAMETER_DESCRIPTION_VIEW_TAG  20

@interface BoolParameterController ()

- (UITableViewCell *)loadParameterCell;
- (UITableViewCell *)loadDescriptionCell;

@end

@implementation BoolParameterController

@synthesize tableView;
@synthesize parameter;
@synthesize parameterSwitch;

- (id)initWithParameter:(NSMutableDictionary *)_parameter
{
    self = [super initWithNibName:@"BoolParameterController" bundle:nil];
    if (self) {
        self.parameter = _parameter;
        
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    RELEASE_AND_NIL(tableView);
    RELEASE_AND_NIL(parameter);
    RELEASE_AND_NIL(parameterSwitch);
    
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.parameterSwitch.on = [[self.parameter valueForKey:KEY_PARAMETER_VALUE] boolValue];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableView = nil;
    self.parameterSwitch = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Parameter";
            break;
        case 1:
            return @"Parameter description";
            break;
        default:
            break;
    }
    
    return @"Unknown section";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
            cell = [self loadParameterCell];
            break;
        case 1:
            cell = [self loadDescriptionCell];
            break;
        default:
            cell = nil;
            break;
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 44.0f;
            break;
        case 1:
            return 280.0f;
            break;
        default:
            return 0.0f;
            break;
    }
}

#pragma mark - UISwitch actions

- (IBAction)valueChanged
{
    [self.parameter setValue:[NSNumber numberWithBool:self.parameterSwitch.on] forKey:KEY_PARAMETER_VALUE];
}

#pragma mark - Private category methods

- (UITableViewCell *)loadParameterCell
{
    NSArray *bundleResources = [[NSBundle mainBundle] loadNibNamed:@"BoolParameterCell" 
                                                             owner:self 
                                                           options:nil];
    UITableViewCell *cell = (UITableViewCell *)[bundleResources objectAtIndex:0];
    
    UILabel *parameterNameLabel = (UILabel *)[cell viewWithTag:PARAMETER_NAME_LABEL_TAG];
    parameterNameLabel.text = [parameter valueForKey:KEY_PARAMETER_NAME];
    
    return cell;
}

- (UITableViewCell *)loadDescriptionCell
{
    NSArray *bundleResources = [[NSBundle mainBundle] loadNibNamed:@"BoolParameterDescriptionCell" 
                                                                             owner:nil 
                                                                           options:nil];
    UITableViewCell *cell = (UITableViewCell *)[bundleResources objectAtIndex:0];
    
    UITextView *parameterDescriptionView = (UITextView *)[cell viewWithTag:PARAMETER_DESCRIPTION_VIEW_TAG];
    parameterDescriptionView.text = [parameter valueForKey:KEY_PARAMETER_DESCRIPTION];
    
    return cell;
}

@end
