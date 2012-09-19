//
//  NJROTC_AppAppDelegate.h
//  NJROTC App
//
//  Created by Alexander Ramirez on 8/2/10.
//  Copyright Tryad 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NJROTC_AppViewController;

@interface NJROTC_AppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NJROTC_AppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NJROTC_AppViewController *viewController;

@end

