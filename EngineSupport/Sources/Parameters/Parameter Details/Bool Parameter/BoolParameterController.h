//
//  BoolParameter.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BoolParameterController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView     *tableView;
    NSMutableDictionary    *parameter;
    UISwitch        *parameterSwitch;
}

- (id)initWithParameter:(NSMutableDictionary *)_parameter;
- (IBAction)valueChanged;

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UISwitch    *parameterSwitch;

@property (nonatomic, retain) NSMutableDictionary *parameter;

@end
