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
@synthesize topCapView, leftCapView, bottomCapView, rightCapView;

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

-(IBAction)resizeImage:(id)sender
{
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    UIImage *image = [UIImage imageNamed:@"Callout_clip_art_small.png"];
    self.imageView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(topSlider.value, leftSlider.value, bottomSlider.maximumValue-bottomSlider.value, rightSlider.maximumValue-rightSlider.value)];
 
 //   self.imageView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(topSlider.value, leftSlider.value, bottomSlider.value, rightSlider.value) resizingMode:UIImageResizingModeStretch];
    NSLog(@"Cap insets: top: %f, left: %f, bottom: %f, right: %f",topSlider.value, leftSlider.value, bottomSlider.maximumValue-bottomSlider.value, rightSlider.maximumValue-rightSlider.value);
    
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
