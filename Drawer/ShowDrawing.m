//
//  ShowDrawing.m
//  Drawer
//
//  Created by Leo Lee on 4/12/16.
//  Copyright © 2016 Leo Lee. All rights reserved.
//

#import "ShowDrawing.h"

@implementation ShowDrawing

- (void)drawRect:(CGRect)rect {
    // Drawing code

    UIColor *thisColor;
    NSInteger thisSize = 15.0;
    NSInteger count = 0;
    
    // index 0 is pathArr
    for (UIBezierPath *path in [self.pathDetail objectAtIndex:0]) {
        NSLog(@"IN");
        thisColor = [[self.pathDetail objectAtIndex:1] objectAtIndex:count];
        thisSize = [[[self.pathDetail objectAtIndex:2] objectAtIndex:count] integerValue];
        NSLog(@"%lu", (unsigned long)thisSize);
        
        [path  setLineWidth:thisSize];
        [thisColor setStroke];
        [path stroke];
        count++;
    }
}

@end
