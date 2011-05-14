//
//  NumberParameterController.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NumberParameterController : UIViewController 
                                       <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> 
{
    UITableView *tableView;
    NSMutableDictionary *parameter;
    UITextField *textField;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) NSMutableDictionary  *parameter;

@end
