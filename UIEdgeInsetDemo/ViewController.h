//
//  ViewController.h
//  UIEdgeInsetDemo
//
//  Created by Pugetworks on 1/30/13.
//  Copyright (c) 2013 ELINEF. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TOP_VALUE_KEY           @"topValue"
#define LEFT_VALUE_KEY          @"leftValueKey"
#define RIGHT_VALUE_KEY         @"rightValueKey"
#define BOTTOM_VALUE_KEY        @"bottomValueKey"



@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


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
