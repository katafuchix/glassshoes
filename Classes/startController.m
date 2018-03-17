//
//  startController.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <AudioToolbox/AudioServices.h>

#import "startController.h"
#import "glassshoesAppDelegate.h"
#import "glassShoes.h"
#import "myGPSController.h"

@implementation startController

@synthesize m_chkOneBtn;
@synthesize m_chkMutiBtn;
@synthesize m_seachBtn;
@synthesize m_fittingBtn;
@synthesize m_helpBtn;
@synthesize m_bkImg;
@synthesize m_wakuImg;
@synthesize m_starImg;
@synthesize m_star2Img;
@synthesize m_star3Img;
@synthesize m_guider;
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

	m_cnt = 0;

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
	
	[m_bkImg release];
	[m_starImg release];
	[m_star2Img release];
	[m_star3Img release];
	
	[m_wakuImg release];
	[m_chkOneBtn release];
	[m_chkMutiBtn release];	
	[m_seachBtn release];	
	[m_fittingBtn release];	
	[m_helpBtn release];	
	[m_guider release];
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_setting release];
	[m_search release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(IBAction)selToChkOne:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 1;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showInputPage:true num:0];
	[appli.m_gpsCtrl closeStartPage];
}

-(IBAction)selToChkMuti:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 2;
	
	glassShoes *gs = [glassShoes sharedInstance];
	[gs resetMutiQuiz];
	[gs clearMutiProfiles];
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showInputPage:false num:0];
	[appli.m_gpsCtrl closeStartPage];
}

-(IBAction)selToFitting:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 4;

	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showFitTopPage];
	[appli.m_gpsCtrl closeStartPage];
}
	
-(IBAction)selToHelp:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHelpPage];
	[appli.m_gpsCtrl closeStartPage];
}

-(IBAction)selToTop:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	//AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
	
	//m_mode = 6;
}

-(IBAction)selToProfile:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeStartPage];
}

-(IBAction)selToHistory:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 8;

	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeStartPage];
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 9;

	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeStartPage];
}

-(IBAction)selToSetting:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 10;

	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeStartPage];
}


@end
