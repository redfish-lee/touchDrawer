//
//  Drawing.m
//  Drawer
//
//  Created by Leo Lee on 4/11/16.
//  Copyright © 2016 Leo Lee. All rights reserved.
//

#import "Drawing.h"

@implementation Drawing

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.pathDetail = [[NSMutableArray alloc]init];
    self.pathArr    = [[NSMutableArray alloc]init];
    self.pathColor  = [[NSMutableArray alloc]init];
    self.pathSize   = [[NSMutableArray alloc]init];
    self.curBrushColor = [UIColor blackColor];
    self.brushSize = 15.0;
    [self.pathDetail addObject:self.pathArr];
    [self.pathDetail addObject:self.pathColor];
    [self.pathDetail addObject:self.pathSize];
    
    return self;
}

-(void)setColorA{ self.curBrushColor = [UIColor redColor];    }
-(void)setColorB{ self.curBrushColor = [UIColor yellowColor]; }
-(void)setColorC{ self.curBrushColor = [UIColor grayColor];   }
-(void)setErase { self.curBrushColor = self.backgroundColor;  }
-(void)setClear {
    [self setBackgroundColor:[UIColor clearColor]];
    [self.pathArr removeAllObjects];
    [self.pathColor removeAllObjects];
    [self.pathSize  removeAllObjects];
    [self setNeedsDisplay];
}

-(void)setUndo{
    [self.pathArr removeLastObject];
    [self.pathColor removeLastObject];
    [self.pathSize  removeLastObject];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    // Draw the path
    
    UIColor *thisColor;
    NSInteger thisSize = 15.0;
    NSInteger count = 0;
    
    for (UIBezierPath *path in self.pathArr) {
        thisSize = [[[self.pathDetail objectAtIndex:2]objectAtIndex:count] integerValue];
        thisColor = [[self.pathDetail objectAtIndex:1] objectAtIndex:count];
        NSLog(@"%lu", (unsigned long)thisSize);
        
        [path  setLineWidth:thisSize];
        [thisColor setStroke];
        [path stroke];
        count++;
    }
    
    //[_curBrushColor setStroke];
    //[path stroke];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UIBezierPath *path = [UIBezierPath bezierPath];
    //path.lineWidth = _brushSize;
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineCapStyle:kCGLineCapRound];
    
    UITouch *touch = [touches anyObject];
    CGPoint oriLocation = [touch locationInView:self];
    // NSLog(@"%f, %f, %ld", oriLocation.x, oriLocation.y, _brushSize);
    
    [path moveToPoint: oriLocation];
    [self.pathSize  addObject:[NSNumber numberWithInteger:self.brushSize]];
    NSLog(@"%ld", _brushSize);
    [self.pathArr   addObject:path];
    [self.pathColor addObject:self.curBrushColor];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //...
    UITouch *touch = [touches anyObject];
    CGPoint curLocation = [touch locationInView: self];
    // NSLog(@"%f, %f, %ld", curLocation.x, curLocation.y, _brushSize);
    
    UIBezierPath *curPath = [self.pathArr lastObject];
    [curPath addLineToPoint:curLocation];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addLineToPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
    /*
    for(UITouch *touch in touches){
        if(touch.tapCount >= 2){
            NSLog(@"%lu", (unsigned long)touch.tapCount);
            [self setBackgroundColor:[UIColor blueColor]];
        }
    }
    */
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   [self touchesMoved:touches withEvent:event];
}

@end
