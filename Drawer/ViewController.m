//
//  ViewController.m
//  Drawer
//
//  Created by Leo Lee on 4/11/16.
//  Copyright © 2016 Leo Lee. All rights reserved.
//

#import "ViewController.h"
#import "Drawing.h"
#import "GuessViewController.h"

@interface ViewController ()

@end

@implementation ViewController
Drawing *mydraw;

- (void)viewDidLoad {
    [super viewDidLoad];
    // 152 is Upper(20+44) + Buttom(44+44)
    mydraw =[[Drawing alloc]initWithFrame:
             CGRectMake(0, 64, self.view.frame.size.width , self.view.frame.size.height - 152)];
    
    [mydraw setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview: mydraw];
    self.workNameText.placeholder = @"Give it a name!";
    
    // Initialize Color Buttons
     _btnA.backgroundColor = [UIColor redColor];
    [_btnA setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     _btnB.backgroundColor = [UIColor yellowColor];
    [_btnB setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     _btnC.backgroundColor = [UIColor grayColor];
    [_btnC setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    // Initialize slider range
    _sliderValue.minimumValue =  5.0;
    _sliderValue.maximumValue = 35.0;
    
}

-(void)viewWillAppear:(BOOL)animated{
    _sliderValue.value = 10.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)changeBackground:(id)sender {
    // Randomly change background colors
    NSArray *colorList = [[NSArray alloc] initWithObjects: [UIColor lightGrayColor], [UIColor grayColor],
        [UIColor yellowColor], [UIColor darkGrayColor], [UIColor whiteColor], [UIColor blackColor], nil];
    
    mydraw.backgroundColor = [colorList objectAtIndex:arc4random_uniform((int)colorList.count)];
}

-(IBAction)setBrushColorA:(id)sender { [mydraw setColorA]; }
-(IBAction)setBrushColorB:(id)sender { [mydraw setColorB]; }
-(IBAction)setBrushColorC:(id)sender { [mydraw setColorC]; }
-(IBAction)setBrushErase: (id)sender { [mydraw setErase];  }
-(IBAction)setLineSize:(UISlider*)sender { mydraw.brushSize = sender.value; }
-(IBAction)clearAll:(id)sender{ [mydraw setClear]; }
-(IBAction)undoOnePath:(id)sender{ [mydraw setUndo]; }

-(IBAction)saveAll:(id)sender{
    if (![_workName isEqual: @""])
        _workName = _workNameText.text;
}

// Transfer Data
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"To Guess"]) {
        GuessViewController *vc = segue.destinationViewController;
        vc.title = @"Guess";
        vc.answer = self.workNameText.text;
        vc.pathDetail = mydraw.pathDetail;
        vc.backColor = mydraw.backgroundColor;
    }
}

@end
