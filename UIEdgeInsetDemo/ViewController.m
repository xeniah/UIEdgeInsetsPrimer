//
//  ViewController.m
//  UIEdgeInsetDemo
//
//  Created by Pugetworks on 1/30/13.
//  Copyright (c) 2013 ELINEF. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollView, topSlider, leftSlider, bottomSlider, rightSlider, imageView, smallImageView;
@synthesize topCapView, leftCapView, bottomCapView, rightCapView, segmentedControl;

- (void)viewDidLoad
{
    [super viewDidLoad];

    /*
    self.bottomSlider.transform = CGAffineTransformMakeRotation(M_PI * -0.5);
    self.topSlider.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    self.rightSlider.transform = CGAffineTransformMakeRotation(M_PI * -1.0);
    */
   // UIImage *image = [UIImage imageNamed:@"Callout_clip_art_small.png"];
 //   self.bottomSlider.transform = CGAffineTransformMakeRotation(M_PI * -1);
   // self.leftSlider.transform = CGAffineTransformMakeRotation(M_PI * -1.0);
    
    self.topSlider.maximumValue = self.smallImageView.frame.size.height/2;
    self.bottomSlider.maximumValue = self.smallImageView.frame.size.height/2;
    self.leftSlider.maximumValue = self.smallImageView.frame.size.width/2;
    self.rightSlider.maximumValue = self.smallImageView.frame.size.width/2;
    
    self.topSlider.minimumValue = 0.0;
    self.leftSlider.minimumValue = 0.0;
    self.rightSlider.minimumValue = 0.0;
    self.bottomSlider.minimumValue = 0.0;
    
    self.topSlider.value = self.topSlider.maximumValue/2;
    self.leftSlider.value = self.leftSlider.maximumValue/2;
    self.rightSlider.value = self.rightSlider.maximumValue/2;
    self.bottomSlider.value = self.bottomSlider.maximumValue/2;
    

    /*
    CGRect bFrame = bottomSlider.frame;
    bFrame.size.height = self.smallImageView.frame.size.height/2;
    bFrame.size.width = 3.0;
    bFrame.origin.x = self.smallImageView.frame.origin.x + self.smallImageView.frame.size.width - 30;
    bFrame.origin.y = self.smallImageView.frame.origin.y + self.smallImageView.frame.size.height - bFrame.size.height;
    bottomSlider.frame = bFrame;
	*/
     
    #define INITIAL_OFFSET  30
    
    CGRect tcFrame = self.topCapView.frame;
    tcFrame.size.height = self.smallImageView.frame.size.height/2-INITIAL_OFFSET;
    tcFrame.size.width  = self.smallImageView.frame.size.width;
    tcFrame.origin.x    = self.smallImageView.frame.origin.x;
    tcFrame.origin.y    = self.smallImageView.frame.origin.y;
    self.topCapView.frame = tcFrame;
    
    
    CGRect lcFrame = self.leftCapView.frame;
    lcFrame.size.height = self.smallImageView.frame.size.height;
    lcFrame.size.width  = self.smallImageView.frame.size.width/2-INITIAL_OFFSET;
    lcFrame.origin.x    = self.smallImageView.frame.origin.x;
    lcFrame.origin.y    = self.smallImageView.frame.origin.y;
    self.leftCapView.frame = lcFrame;
    
    
    CGRect bcFrame = self.bottomCapView.frame;
    bcFrame.size.height = self.smallImageView.frame.size.height/2-INITIAL_OFFSET;
    bcFrame.size.width  = self.smallImageView.frame.size.width;
    bcFrame.origin.x    = self.smallImageView.frame.origin.x;
    bcFrame.origin.y    = self.smallImageView.frame.origin.y + self.smallImageView.frame.size.height/2+INITIAL_OFFSET;
    self.bottomCapView.frame = bcFrame;
    
    
    CGRect rcFrame = self.rightCapView.frame;
    rcFrame.size.height = self.smallImageView.frame.size.height;
    rcFrame.size.width  = self.smallImageView.frame.size.width/2-INITIAL_OFFSET;
    rcFrame.origin.x    = self.smallImageView.frame.origin.x + INITIAL_OFFSET + self.smallImageView.frame.size.width/2;
    rcFrame.origin.y    = self.smallImageView.frame.origin.y;
    self.rightCapView.frame = rcFrame;
    
    
}

- (void)saveSliderValues
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithFloat:topSlider.value] forKey:TOP_VALUE_KEY];
    [defaults setObject:[NSNumber numberWithFloat:leftSlider.value] forKey:LEFT_VALUE_KEY];
    [defaults setObject:[NSNumber numberWithFloat:bottomSlider.value] forKey:BOTTOM_VALUE_KEY];
    [defaults setObject:[NSNumber numberWithFloat:rightSlider.value] forKey:RIGHT_VALUE_KEY];
}

-(IBAction)resizeImage:(id)sender
{
    /*
    You use this method to add cap insets to an image or to change the existing cap insets of an image. In both cases, you get back a new image and the original image remains untouched.
    
    During scaling or resizing of the image, areas covered by a cap are not scaled or resized. Instead, the pixel area not covered by the cap in each direction is tiled, left-to-right and top-to-bottom, to resize the image. This technique is often used to create variable-width buttons, which retain the same rounded corners but whose center region grows or shrinks as needed. For best performance, use a tiled area that is a 1x1 pixel area in size.
    */
    
    [self saveSliderValues];

    self.imageView.contentMode = UIViewContentModeScaleToFill;
    UIImage *image = [UIImage imageNamed:@"Callout_clip_art_small.png"];
 //   self.imageView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(topSlider.value, leftSlider.value, bottomSlider.maximumValue-bottomSlider.value, rightSlider.maximumValue-rightSlider.value)];
    UIImageResizingMode resizingMode = UIImageResizingModeTile;
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        resizingMode = UIImageResizingModeStretch;
    }
    UIEdgeInsets myInsets = UIEdgeInsetsMake(-topSlider.value, -leftSlider.value, -(bottomSlider.maximumValue-bottomSlider.value), -(rightSlider.maximumValue-rightSlider.value));
    self.imageView.image = [image resizableImageWithCapInsets:myInsets resizingMode:resizingMode];
    NSLog(@"Cap insets: top: %f, left: %f, bottom: %f, right: %f", myInsets.top, myInsets.left, myInsets.bottom, myInsets.right);
    
}

-(IBAction) changeTopView:(id)sender
{
    CGRect tcFrame = self.topCapView.frame;
    tcFrame.size.height = self.topSlider.value;
    tcFrame.size.width  = self.smallImageView.frame.size.width;
    tcFrame.origin.x    = self.smallImageView.frame.origin.x;
    tcFrame.origin.y    = self.smallImageView.frame.origin.y;
    self.topCapView.frame = tcFrame;
    NSLog(@"Top value: %f", self.topSlider.value);
    
}

-(IBAction) changeLeftView:(id)sender
{
    CGRect lcFrame = self.leftCapView.frame;
    lcFrame.size.height = self.smallImageView.frame.size.height;
    lcFrame.size.width  = self.leftSlider.value;
    lcFrame.origin.x    = self.smallImageView.frame.origin.x;
    lcFrame.origin.y    = self.smallImageView.frame.origin.y;
    self.leftCapView.frame = lcFrame;
    NSLog(@"Left value: %f", self.leftSlider.value);

    
}
-(IBAction) changeBottomView:(id)sender
{
    CGRect bcFrame = self.bottomCapView.frame;
    bcFrame.size.height = self.smallImageView.frame.size.height/2 - self.bottomSlider.value;
    bcFrame.size.width  = self.smallImageView.frame.size.width;
    bcFrame.origin.x    = self.smallImageView.frame.origin.x;
    bcFrame.origin.y    = self.smallImageView.frame.origin.y + self.smallImageView.frame.size.height/2 + self.bottomSlider.value;
    self.bottomCapView.frame = bcFrame;
    NSLog(@"Bottom value: %f", self.bottomSlider.maximumValue-self.bottomSlider.value);
    
}

-(IBAction) changeRightView:(id)sender
{
    CGRect rcFrame = self.rightCapView.frame;
    rcFrame.size.height = self.smallImageView.frame.size.height;
    rcFrame.size.width  = self.smallImageView.frame.size.width/2 - self.rightSlider.value;
    rcFrame.origin.x    = self.smallImageView.frame.origin.x + self.rightSlider.value + self.smallImageView.frame.size.width/2;
    rcFrame.origin.y    = self.smallImageView.frame.origin.y;
    self.rightCapView.frame = rcFrame;
    NSLog(@"Right value: %f", rightSlider.maximumValue-rightSlider.value);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
