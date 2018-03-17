//
//  glassshoesAppDelegate.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <SystemConfiguration/SystemConfiguration.h>

#import "glassshoesAppDelegate.h"
#import "glassshoes.h"
#import "openController.h"
#import "myGpsController.h"
#import "Reachability.h"


@implementation glassshoesAppDelegate

@synthesize window;
@synthesize m_gpsCtrl;

@synthesize m_openCtrl;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
	
	glassShoes *gs = [glassShoes sharedInstance];
	//[gs loadUserData];
	if ( [UIApplication sharedApplication].applicationIconBadgeNumber > 0 ) {
		[gs addBadge:[UIApplication sharedApplication].applicationIconBadgeNumber];
		[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
	}
	
    // Override point for customization after application launch.
	self.m_openCtrl = nil;
	self.m_gpsCtrl = nil;

	[self showGPSPage];
	[self showOpenPage];

	NSDictionary* userInfo = [launchOptions objectForKey:@"UIApplicationLaunchOptionsRemoteNotificationKey"];
	if ( userInfo != nil ) {
		
		[m_gpsCtrl didReceiveRemoteNotification:userInfo show:false];
	}
    
    [self.window setRootViewController: self.m_gpsCtrl];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)showGPSPage{
	
	myGPSController* ctrl = [[myGPSController alloc] initWithNibName:@"myGPSController" bundle:[NSBundle mainBundle]];
	self.m_gpsCtrl = ctrl;
	[ctrl release];
	
	m_gpsCtrl.view.alpha = 0;
	[self.window addSubview:[m_gpsCtrl view]];
}

- (void)setGPSPageShow{

	m_gpsCtrl.view.alpha = 1.0;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	[[UIApplication sharedApplication] setKeepAliveTimeout:300.0 handler:^{[self checkLocation];}];
}

- (void) checkLocation{
 
	if( m_gpsCtrl != nil ){
		
		if ( [self canDoComm] ) {
			
			glassShoes *gs = [glassShoes sharedInstance];
			BOOL canToken = [gs checkToken];
			
			if ( canToken ) {
				
				[gs setCanLocation:false];
				[m_gpsCtrl prepareGPS];
			}
		}
	}
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
	glassShoes *gs = [glassShoes sharedInstance];
	//[gs loadUserData];
	
	if ( [UIApplication sharedApplication].applicationIconBadgeNumber > 0 ) {
		[gs addBadge:[UIApplication sharedApplication].applicationIconBadgeNumber];
		[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
	}
	
	if( m_gpsCtrl != nil ){

		if ( [self canDoComm] ) {

			BOOL canToken = [gs checkToken];
			
			if ( !canToken ) {
			
				[m_gpsCtrl registDevice];
			}
			else{
			
				[gs setCanLocation:false];
				[m_gpsCtrl prepareGPS];
			}
		}
	}
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	
	if( m_gpsCtrl != nil ){
		
		[[m_gpsCtrl view] removeFromSuperview];
		[m_gpsCtrl release];
		m_gpsCtrl = nil;
	}
	
	[self closeOpenPage];
	
    [window release];
    [super dealloc];
}

-(void)showOpenPage{
	
	openController* ctrl= [[openController alloc] initWithNibName:@"openController" bundle:[NSBundle mainBundle]]; 
	self.m_openCtrl = ctrl;
	[ctrl release];
	
	[self.window addSubview:[m_openCtrl view]];
}

-(void)closeOpenPage{
	
	if( m_openCtrl != nil ){
		
		[[m_openCtrl view] removeFromSuperview];
		[m_openCtrl release];
		m_openCtrl = nil;
	}
}

// type 1:	register
//		2:	nearSearch
//		3:	worldSearch
//		4:	bump me
//		5:	bump current
//		6+:	bump friend
- (void)connectToServer:(NSInteger)type{

	[m_gpsCtrl connectToServer:type];
}

// APNsにデバイスを登録できたときに呼ばれるメソッド
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [m_gpsCtrl didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

// APNsにデバイスを登録できなかったときに呼ばれるメソッド
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [m_gpsCtrl didFailToRegisterForRemoteNotificationsWithError:error];
}

// プッシュ通知を受け取ったときに呼ばれるメソッド
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [m_gpsCtrl didReceiveRemoteNotification:userInfo show:true];
}

-(BOOL)canDoComm{

	Reachability *curReach = [Reachability reachabilityForInternetConnection];
	NetworkStatus netStatus = [curReach currentReachabilityStatus];
	switch (netStatus) {
		case NotReachable:
			break;
			
		case ReachableViaWWAN:
			return true;

		case ReachableViaWiFi:
			return true;
	}	
	
	return false;
}

@end
