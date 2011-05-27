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

#import "ParametersViewController.h"

#import "BoolParameterController.h"
#import "NumberParameterController.h"

@interface ParametersViewController ()

- (UIViewController *)parameterDetailViewControllerForParameter:(ESParameter *)_parameter;

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
    ESParameter *parameter = [[[Parameters sharedInstance].parameters allValues] objectAtIndex:indexPath.row];
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
        ESParameter *parameter = [[[Parameters sharedInstance].parameters allValues] objectAtIndex:indexPath.row];
        ((UILabel *)[cell viewWithTag:0]).text = [parameter parameterName]; 
    }
    
    return cell;
}

#pragma mark - Private category methods ()

- (UIViewController *)parameterDetailViewControllerForParameter:(ESParameter *)_parameter
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
