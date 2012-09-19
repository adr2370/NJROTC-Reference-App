    //
//  SplashViewController.m
//  NJROTC App
//
//  Created by Alexander Ramirez on 8/5/10.
//  Copyright 2010 Troy High School. All rights reserved.
//

#import "SplashViewController.h"

#define kDegreesToRadians(x) (M_PI * (x) / 180)

@implementation SplashViewController
@synthesize timer,splashImageView,splashImageViewRifle,viewController;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
 */
- (void)loadView {
	//Init the view
	CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	UIView *view = [[UIView alloc] initWithFrame:appFrame];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	self.view = view;
	[view release];
	
	splashImageViewRifle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rifle.png"]];
	splashImageViewRifle.frame = CGRectMake(0, 0, 90, 90);
	splashImageViewRifle.center = CGPointMake(200,230);
	splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
	splashImageView.frame = CGRectMake(0, 0, 320, 480);
	[self.view addSubview:splashImageViewRifle];
	[self.view addSubview:splashImageView];
	
	viewController = [[NJROTC_AppViewController alloc] initWithNibName:@"NJROTC_AppViewController" bundle:[NSBundle mainBundle]];
	viewController.view.alpha = 0.0;
	[self.view addSubview:viewController.view];
	/*
	for (int i=0; i<360*3; i++) {
		CGAffineTransform transform = CGAffineTransformMakeRotation(kDegreesToRadians(i*100));
		splashImageViewRifle.transform = transform;
	}
	*/
	timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(fadeScreen) userInfo:nil repeats:NO];
}

- (void)fadeScreen {
	[UIView beginAnimations:nil context:nil];							//begins animation block
	[UIView setAnimationDuration:0.75];									//sets animation duration
	[UIView setAnimationDelegate:self];									//sets delegate for this block
	[UIView setAnimationDidStopSelector:@selector(finishedFading)];		//calls the finishedFading
	self.view.alpha = 0.0;												//fades the alpha channel of this view to "0.0" over the animation
	[UIView commitAnimations];											//commits the animation block. This Block is done.
}

- (void)finishedFading {
	[UIView beginAnimations:nil context:nil];	//begins animation block
	[UIView setAnimationDuration:0.75];			//sets animation duration
	self.view.alpha = 1.0;						//fades the view to 1.0 alpha over 0.75 seconds
	viewController.view.alpha = 1.0;			
	[UIView commitAnimations];					//commits the animation block. This Block is done.
	[splashImageView removeFromSuperview];		
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
