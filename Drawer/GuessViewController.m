//
//  GuessViewController.m
//  Drawer
//
//  Created by Leo Lee on 4/12/16.
//  Copyright © 2016 Leo Lee. All rights reserved.
//

#import "GuessViewController.h"
#import "ShowDrawing.h"
@interface GuessViewController ()

@end

@implementation GuessViewController
ShowDrawing *thisView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    thisView = [[ShowDrawing alloc]initWithFrame:
                CGRectMake(0, 64, self.view.frame.size.width , self.view.frame.size.height - 108)];
    [thisView setBackgroundColor:_backColor];
    [self.view addSubview:thisView];
    thisView.pathDetail = self.pathDetail;
    self.input.placeholder = @"Guess it!";
    if ([_answer isEqualToString:@""])
        _answer = @"Not Specified!";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)submit:(id)sender{
    NSString *guessStr = self.input.text;
    
    if([guessStr isEqualToString: _answer]){
        UIAlertController *alertController =
                [UIAlertController alertControllerWithTitle:@"Bingo!" message:_answer preferredStyle: UIAlertControllerStyleAlert];
    
        UIAlertAction *confirmAction =
            [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [self.navigationController popViewControllerAnimated:YES];
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
    
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil]; 
    
    }
    
    else {
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Wrong! The answer is" message:_answer preferredStyle: UIAlertControllerStyleAlert];
            
        UIAlertAction *confirmAction =
            [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [self.navigationController popViewControllerAnimated:YES];
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
        
        [alertController addAction:confirmAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
