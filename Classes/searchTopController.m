//
//  searchTopController.m
//  glassshoes
//
//  Created by james Lee on 11/08/27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "searchTopController.h"
#import "glassshoesAppDelegate.h"
#import "glassShoes.h"
#import "searchingController.h"
#import "myGPSController.h"
#import "nearController.h"
#import "worldController.h"

@implementation searchTopController

@synthesize m_searchCtrl;
@synthesize m_nearCtrl;
@synthesize m_worldCtrl;

@synthesize m_bkImg;
@synthesize m_wakuImg;
@synthesize m_starImg;
@synthesize m_star2Img;
@synthesize m_star3Img;
@synthesize m_nearBtn;
@synthesize m_worldBtn;

@synthesize m_tabBar;
@synthesize m_top;
@synthesize m_profile;
@synthesize m_history;
@synthesize m_search;
@synthesize m_setting;
@synthesize m_badgeImg;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.m_badgeImg = nil;
		self.m_searchCtrl = nil;
		self.m_nearCtrl = nil;
		self.m_worldCtrl = nil;
		m_mode = 0;
		m_starImg.alpha = 1.0;
		m_star2Img.alpha = 0;
		m_star3Img.alpha = 0;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	[self showStart1];
	[self showBadge];
}

-(void)showBadge{
	
	if ( m_badgeImg != nil ) {
		
		[m_badgeImg removeFromSuperview];
		[m_badgeImg release];
		m_badgeImg = nil;
	}
	
	glassShoes *gs = [glassShoes sharedInstance];
	NSInteger nBadge = [gs getBadge];
	
	if ( nBadge > 99 ) {
		nBadge = 99;
	}
	
	if( nBadge > 0 ){
		
		CGRect rect;
		if ( nBadge > 9 ) {
			
			rect = CGRectMake(164, 431, 28, 23);
		}
		else {
			
			rect = CGRectMake(168, 431, 23, 23);
		}
		
		NSString* name = [[NSString alloc] initWithFormat:@"b%d", nBadge];
		NSString *path= [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
		UIImage* img= [[UIImage alloc] initWithContentsOfFile:path];
		[name release];
		
		UIImageView* v = [[UIImageView alloc] initWithImage:img];
		self.m_badgeImg = v;
		[v release];
		
		[img release];
		[self.view addSubview:m_badgeImg];
		
		m_badgeImg.frame = rect;
	}
}

- (void)showStart1{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(showStart2)];
	[UIView setAnimationDuration:5.0];	// 0.2秒でアニメーション
	m_starImg.alpha = 0;
	m_star2Img.alpha = 1;
	[UIView commitAnimations];
}

- (void)showStart2{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(showStart3)];
	[UIView setAnimationDuration:5.0];	// 0.2秒でアニメーション
	m_star2Img.alpha = 0;
	m_star3Img.alpha = 1;
	[UIView commitAnimations];
}

- (void)showStart3{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(showStart1)];
	[UIView setAnimationDuration:5.0];	// 0.2秒でアニメーション
	m_star3Img.alpha = 0;
	m_starImg.alpha = 1;
	[UIView commitAnimations];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	if ( m_badgeImg != nil ) {
		
		[m_badgeImg removeFromSuperview];
		[m_badgeImg release];
		m_badgeImg = nil;
	}
	
	[self closeSearchingPage];
	[self closeNearPage];
	[self closeWorldPage];
	
	[m_bkImg release];	
	[m_starImg release];
	[m_star2Img release];
	[m_star3Img release];
	
	[m_wakuImg release];
	
	[m_nearBtn release];	
	[m_worldBtn release];	
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(IBAction)selToNear:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}

	m_mode = 4;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
//	glassShoes *gs = [glassShoes sharedInstance];
//	BOOL canToken = [gs checkToken];
//	BOOL canLocation = [gs checkLocation];
	BOOL canComm = [appli canDoComm];
	
	if ( !canComm ) {
		
		// アラートビューを作成する
		UIAlertView *alert;
		alert = [[UIAlertView alloc] initWithTitle:@""
										   message:@"インターネットがオフラインのようです。設定を確認してください。"
										  delegate:nil
								 cancelButtonTitle:@"OK"
								 otherButtonTitles:nil];
		
		// アラートビューを表示する
		[alert show];
		
		// 解放
		[alert release];
		m_mode = 0;
		return;
	}

/*	
	if ( !canToken || !canLocation ) {
		
		// アラートビューを作成する
		UIAlertView *alert;
		alert = [[UIAlertView alloc] initWithTitle:@""
										   message:@"電波状況を確認してください。"
										  delegate:nil
								 cancelButtonTitle:@"OK"
								 otherButtonTitles:nil];
		
		// アラートビューを表示する
		[alert show];
		
		// 解放
		[alert release];
		m_mode = 0;
		return;
	}
*/	
	//glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	//[appli.m_gpsCtrl connectToServer:2];
	
	[self showSearchingPage:true];
}

-(IBAction)selToWorld:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
//	glassShoes *gs = [glassShoes sharedInstance];
//	BOOL canToken = [gs checkToken];
//	BOOL canLocation = [gs checkLocation];
	BOOL canComm = [appli canDoComm];
	
	if ( !canComm ) {
		
		// アラートビューを作成する
		UIAlertView *alert;
		alert = [[UIAlertView alloc] initWithTitle:@""
										   message:@"インターネットがオフラインのようです。設定を確認してください。"
										  delegate:nil
								 cancelButtonTitle:@"OK"
								 otherButtonTitles:nil];
		
		// アラートビューを表示する
		[alert show];
		
		// 解放
		[alert release];
		m_mode = 0;
		return;
	}

/*	
	if ( !canToken || !canLocation ) {
		
		// アラートビューを作成する
		UIAlertView *alert;
		alert = [[UIAlertView alloc] initWithTitle:@""
										   message:@"電波状況を確認してください。"
										  delegate:nil
								 cancelButtonTitle:@"OK"
								 otherButtonTitles:nil];
		
		// アラートビューを表示する
		[alert show];
		
		// 解放
		[alert release];
		m_mode = 0;
		return;
	}
*/	
	//glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	//[appli.m_gpsCtrl connectToServer:3];

	[self showSearchingPage:false];
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	[appli.m_gpsCtrl closeSearchPage];
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeSearchPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeSearchPage];
}

-(IBAction)selToSearch:(id)sender{
	
	[self closeSearchingPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeSearchPage];
}

-(void)showSearchingPage:(BOOL)bNear{
	
	searchingController* ctrl = [[searchingController alloc] initWithNibName:@"searchingController" bundle:[NSBundle mainBundle]];
	self.m_searchCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_searchCtrl view]];
	[m_searchCtrl setInfo:self near:bNear];
}

-(void)closeSearchingPage{
	
	if( m_searchCtrl != nil ){
		
		[[m_searchCtrl view] removeFromSuperview];
		[m_searchCtrl release];
		m_searchCtrl = nil;
	}
	
	m_mode = 0;
}

-(void)stopTimeout{
	
	if( m_searchCtrl != nil ){
	
		[m_searchCtrl stopTimer];
	}
}

-(void)showNearPage{
	
	nearController* ctrl = [[nearController alloc] initWithNibName:@"nearController" bundle:[NSBundle mainBundle]];
	self.m_nearCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_nearCtrl view]];
}

-(void)closeNearPage{
	
	if( m_nearCtrl != nil ){
		
		[[m_nearCtrl view] removeFromSuperview];
		[m_nearCtrl release];
		m_nearCtrl = nil;
	}
	
	m_mode = 0;
}

-(void)showWorldPage{
	
	worldController* ctrl = [[worldController alloc] initWithNibName:@"worldController" bundle:[NSBundle mainBundle]];
	self.m_worldCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_worldCtrl view]];
}

-(void)closeWorldPage{
	
	if( m_worldCtrl != nil ){
		
		[[m_worldCtrl view] removeFromSuperview];
		[m_worldCtrl release];
		m_worldCtrl = nil;
	}
	
	m_mode = 0;
}


@end
