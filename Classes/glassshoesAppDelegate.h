//
//  glassshoesAppDelegate.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class openController;
@class myGPSController;

@interface glassshoesAppDelegate : NSObject <UIApplicationDelegate> {
    
	UIWindow *window;
	
	openController* m_openCtrl;
	myGPSController* m_gpsCtrl;
	
	//BOOL m_bFirst;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain)myGPSController* m_gpsCtrl;

@property (nonatomic, retain)openController* m_openCtrl;

- (void)showGPSPage;
- (void)setGPSPageShow;

-(void)showOpenPage;
-(void)closeOpenPage;

- (void)connectToServer:(NSInteger)type;

-(BOOL)canDoComm;
- (void) checkLocation;

@end

