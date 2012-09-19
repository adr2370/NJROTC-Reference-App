//
//  SplashViewController.h
//  NJROTC App
//
//  Created by Alexander Ramirez on 8/5/10.
//  Copyright 2010 Troy High School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJROTC_AppViewController.h"

@interface SplashViewController : UIViewController {
	NSTimer *timer;
	UIImageView *splashImageView;
	UIImageView *splashImageViewRifle;
	
	NJROTC_AppViewController *viewController;
}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;
@property(nonatomic,retain) UIImageView *splashImageViewRifle;
@property(nonatomic,retain) NJROTC_AppViewController *viewController;

@end
