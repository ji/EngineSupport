//
//  ParametersViewController.m
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParametersViewController.h"

#import "BoolParameterController.h"
#import "NumberParameterController.h"

@interface ParametersViewController ()

- (UIViewController *)parameterDetailViewControllerForParameter:(NSMutableDictionary *)_parameter;

@end

@implementation ParametersViewController

@synthesize tableView;
@synthesize searchField;

- (void)dealloc
{
    RELEASE_AND_NIL(tableView);
    RELEASE_AND_NIL(searchField);
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableView = nil;
    self.searchField = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDelegate methods.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Handle row selection and display details inside a navigation controller.
    NSMutableDictionary *parameter = [[[Parameters sharedInstance].parameters allValues] objectAtIndex:indexPath.row];
    UIViewController *vc = [self parameterDetailViewControllerForParameter:parameter];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource methods.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Parameters sharedInstance].parameters count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Engine parameters";
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ParameterCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
        NSArray *bundleResources = [[NSBundle mainBundle] loadNibNamed:@"ParameterCell" owner:nil options:nil];
        cell = [bundleResources objectAtIndex:0];
        NSDictionary *parameter = [[[Parameters sharedInstance].parameters allValues] objectAtIndex:indexPath.row];
        ((UILabel *)[cell viewWithTag:0]).text = [parameter parameterName]; 
    }
    
    return cell;
}

#pragma mark - Private category methods ()

- (UIViewController *)parameterDetailViewControllerForParameter:(NSMutableDictionary *)_parameter
{
    UIViewController *vc = nil;
    
    switch ([_parameter parameterType]) {
        case ParameterTypeBool:
            vc = [[[BoolParameterController alloc] initWithParameter:_parameter] 
                  autorelease];
            break;
        case ParameterTypeNumber:
            vc = [[[NumberParameterController alloc] initWithNibName:@"NumberParameterController" bundle:nil] 
                  autorelease];
            ((NumberParameterController *)vc).parameter = _parameter;
            break;
        default:
            break;
    }
    
    return vc;
}

@end
