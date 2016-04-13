//
//  Drawing.h
//  Drawer
//
//  Created by Leo Lee on 4/11/16.
//  Copyright © 2016 Leo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Drawing : UIView{
    // UIBezierPath *path;
}
-(void)setColorA;
-(void)setColorB;
-(void)setColorC;
-(void)setErase;
-(void)setClear;
-(void)setUndo;
@property(strong, nonatomic) UIColor *curBrushColor;
@property(readwrite, nonatomic) NSInteger brushSize;
@property(strong, nonatomic) NSMutableArray *pathArr;
@property(readwrite, nonatomic) NSMutableArray *pathColor;
@property(readwrite, nonatomic) NSMutableArray *pathSize;
@property(readwrite, nonatomic) NSMutableArray *pathDetail;
@end

