//
//  ViewController.h
//  Drawer
//
//  Created by Leo Lee on 4/11/16.
//  Copyright © 2016 Leo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(strong, nonatomic) NSString *workName;
@property(strong, nonatomic) IBOutlet UISlider *sliderValue;
@property(strong, nonatomic) IBOutlet UITextField *workNameText;
@property(strong, nonatomic) IBOutlet UIButton *btnA;
@property(strong, nonatomic) IBOutlet UIButton *btnB;
@property(strong, nonatomic) IBOutlet UIButton *btnC;

@end

// IBOutlet是對應到視窗物件指標的識別標籤，它目的是讓Controller存取此物件
// IBAction則是當某個動作被觸發時，用這個標籤告訴Interface Builder應該連結到的地方