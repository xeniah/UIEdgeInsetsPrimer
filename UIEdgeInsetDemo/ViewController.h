//
//  ViewController.h
//  UIEdgeInsetDemo
//
//  Created by Pugetworks on 1/30/13.
//  Copyright (c) 2013 ELINEF. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface InsetsRepresentation : NSObject
{
    int top;
    int left;
    int bottom;
    int right;
}

@property (nonatomic, assign) int top;
@property (nonatomic, assign) int left;
@property (nonatomic, assign) int bottom;
@property (nonatomic, assign) int right;

- (id)initWithTop:(int)aTop left:(int)aLeft bottom:(int)aBottom right:(int)aRight;
@end

@implementation InsetsRepresentation
@synthesize top, bottom, left, right;
- (id) initWithTop:(int)aTop left:(int)aLeft bottom:(int)aBottom right:(int)aRight
{
    if (self = [super init]) {
        top = aTop;
        left = aLeft;
        bottom = aBottom;
        right = aRight;
    }
    return self;
}


@end

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@property (strong, nonatomic) IBOutlet UISlider *topSlider;
@property (strong, nonatomic) IBOutlet UISlider *leftSlider;
@property (strong, nonatomic) IBOutlet UISlider *bottomSlider;
@property (strong, nonatomic) IBOutlet UISlider *rightSlider;

@property (strong, nonatomic) IBOutlet UIView *topCapView;
@property (strong, nonatomic) IBOutlet UIView *leftCapView;
@property (strong, nonatomic) IBOutlet UIView *bottomCapView;
@property (strong, nonatomic) IBOutlet UIView *rightCapView;

@property (strong, nonatomic) IBOutlet UIImageView *smallImageView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

-(IBAction)resizeImage:(id)sender;

-(IBAction) changeTopView:(id)sender;
-(IBAction) changeLeftView:(id)sender;
-(IBAction) changeBottomView:(id)sender;
-(IBAction) changeRightView:(id)sender;


@end
