//
//  ParametersViewController.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ParametersViewController : UIViewController 
                                      <
                                        UITableViewDataSource, 
                                        UITableViewDelegate,
                                        UITextFieldDelegate
                                      >
{
}

@property (nonatomic, retain) IBOutlet UITextField *searchField;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
