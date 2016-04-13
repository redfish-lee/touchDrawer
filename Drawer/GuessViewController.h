//
//  GuessViewController.h
//  Drawer
//
//  Created by Leo Lee on 4/12/16.
//  Copyright © 2016 Leo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuessViewController.h"

@interface GuessViewController : UIViewController
@property(strong, nonatomic) IBOutlet UITextField *input;
@property(strong, nonatomic) NSString *answer;
@property(readwrite, nonatomic) NSMutableArray *pathDetail;
@property(strong, nonatomic) UIColor *backColor;
@end
