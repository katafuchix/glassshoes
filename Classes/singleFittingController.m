//
//  singleFittingController.m
//  glassshoes
//
//  Created by james Lee on 11/09/07.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "singleFittingController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "glassShoes.h"
#import "profile.h"
#import "myGlassController.h"

@implementation singleFittingController

@synthesize m_leftShoes;
@synthesize m_rightShoes;

@synthesize m_bkImg;

@synthesize m_msg1Img;
@synthesize m_msg2Img;

@synthesize m_guideImg;
@synthesize m_guide2Img;
@synthesize m_guide3Img;

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
		self.m_leftShoes = nil;
		self.m_rightShoes = nil;
		self.m_msg1Img = nil;
		self.m_msg2Img = nil;
		self.m_guideImg = nil;
		self.m_guide2Img = nil;
		self.m_guide3Img = nil;
		m_mode = 0;
    }
    return self;
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
	
	if ( m_leftShoes != nil ){
		[m_leftShoes.view removeFromSuperview];
		[m_leftShoes release];
		m_leftShoes = nil;
	}
	
	if ( m_rightShoes != nil ) {
		[m_rightShoes.view removeFromSuperview];
		[m_rightShoes release];	
		m_rightShoes = nil;
	}
	
	[m_bkImg release];	
	
	if ( m_msg1Img != nil ) {
		[m_msg1Img release];	
		m_msg1Img = nil;
	}
	
	if ( m_msg2Img != nil ) {
		[m_msg2Img release];	
		m_msg2Img = nil;
	}
	
	if ( m_guideImg != nil ) {
		[m_guideImg release];	
		m_guideImg = nil;
	}
	
	if ( m_guide2Img != nil ) {
		[m_guide2Img release];	
		m_guide2Img = nil;
	}
	
	if ( m_guide3Img != nil ) {
		[m_guide3Img release];	
		m_guide3Img = nil;
	}
	
	[m_tabBar release];	
	[m_top release];	
	[m_profile release];	
	[m_history release];	
	[m_search release];
	[m_setting release];	
	
    [super dealloc];
}

// left = -1 : current 
//      = 0 : self
//      = 1+ : friends
-(void)setInfo:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft{
	
	m_nLeft = left;
	m_nRight = right;
	m_from = from;
	m_bLeft = bLeft;
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_rightShoes = mg;
	[mg release];
	
	if( m_nRight == -1 ){
		[m_rightShoes setInfo:[gs isMan] color:0 data:gs.m_sQuesLists type:1 left:false];
	}
	else if( m_nRight == 0 ){
		
		[m_rightShoes setInfo:[gs.m_myProfile isMan] color:0 data:gs.m_myProfile.m_quesLists type:1 left:false];
	}
	else {
		profile* p = [gs.m_friendLists objectAtIndex:(m_nRight-1)];
		[m_rightShoes setInfo:[p isMan] color:0 data:p.m_quesLists type:1 left:false];
	}
	
	m_rightShoes.view.frame = CGRectMake( 140, 97, 160, 160);
	[self.view addSubview:[m_rightShoes view]];
	
	mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_leftShoes = mg;
	[mg release];
	
	if( left == -1 ){
		[m_leftShoes setInfo:[gs isMan] color:0 data:gs.m_sQuesLists type:1 left:true];
	}
	else if( left == 0 ){
		
		[m_leftShoes setInfo:[gs.m_myProfile isMan] color:0 data:gs.m_myProfile.m_quesLists type:1 left:true];
	}
	else {
		profile* p = [gs.m_friendLists objectAtIndex:(left-1)];
		[m_leftShoes setInfo:[p isMan] color:0 data:p.m_quesLists type:1 left:true];
	}
	
	m_leftShoes.view.frame = CGRectMake( 20, 97, 160, 160);
	[self.view addSubview:[m_leftShoes view]];
	
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_f4" ofType:@"png"]];
	UIImageView* ti = [[UIImageView alloc] initWithImage:img];
	self.m_msg2Img = ti;
	[ti release];
	[img release];
	
	m_msg2Img.frame = CGRectMake( 6, 338, 227, 89);
	[self.view addSubview:m_msg2Img];
	m_msg2Img.hidden = YES;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_f3" ofType:@"png"]];
	ti = [[UIImageView alloc] initWithImage:img];
	self.m_msg1Img = ti;
	[ti release];
	[img release];
	
	m_msg1Img.frame = CGRectMake( 10, 342, 220, 81);
	[self.view addSubview:m_msg1Img];
	m_msg1Img.hidden = NO;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_g1" ofType:@"png"]];
	ti = [[UIImageView alloc] initWithImage:img];
	self.m_guideImg = ti;
	[ti release];
	[img release];
	
	m_guideImg.frame = CGRectMake( 221, 271, 93, 160);
	[self.view addSubview:m_guideImg];
	
	m_cnt = 8;
	
	[NSTimer scheduledTimerWithTimeInterval:0.5
									 target:self
								   selector:@selector(startTimeOut:)
								   userInfo:nil
									repeats:NO];	
	
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

- (void)startTimeOut:( NSTimer *)aTimer
{
	m_cnt++;
	
	if( m_cnt < 68 ) {//15
		
		m_leftShoes.view.frame = CGRectMake( 20+(m_cnt-8)*1, 97, 160, 160);
		m_rightShoes.view.frame = CGRectMake( 140-(m_cnt-8)*1, 97, 160, 160);
		
		if( m_cnt%4 < 2 ){
			
			m_msg1Img.hidden = NO;
			m_msg2Img.hidden = YES;
		}
		else {
			
			m_msg1Img.hidden = YES;
			m_msg2Img.hidden = NO;
		}
	}
	else if( m_cnt == 68 ){
		
		m_leftShoes.view.transform = CGAffineTransformMakeScale( 1.5, 1.5);
		m_rightShoes.view.transform = CGAffineTransformMakeScale( 1.5, 1.5);
		m_leftShoes.view.center = CGPointMake( 160, 177 );
		m_rightShoes.view.center = CGPointMake( 160, 177 );
		
		[m_msg1Img removeFromSuperview];
		//[m_msg1Img release];
		m_msg1Img = nil;
		[m_msg2Img removeFromSuperview];
		//[m_msg2Img release];
		m_msg2Img = nil;
		
		UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_f5" ofType:@"png"]];
		UIImageView* ti = [[UIImageView alloc] initWithImage:img];
		self.m_msg1Img = ti;
		[ti release];
		[img release];
		
		m_msg1Img.frame = CGRectMake( 13, 336, 193, 95);
		[self.view addSubview:m_msg1Img];
		m_msg1Img.hidden = NO;
		
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_g2" ofType:@"png"]];
		ti = [[UIImageView alloc] initWithImage:img];
		self.m_guide2Img = ti;
		[ti release];
		[img release];
		
		m_guide2Img.frame = CGRectMake( 221, 271, 93, 160);
		[self.view addSubview:m_guide2Img];
		m_guide2Img.hidden = YES;
		
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_g3" ofType:@"png"]];
		ti = [[UIImageView alloc] initWithImage:img];
		self.m_guide3Img = ti;
		[ti release];
		[img release];
		
		m_guide3Img.frame = CGRectMake( 221, 271, 93, 160);
		[self.view addSubview:m_guide3Img];
		m_guide3Img.hidden = YES;
	}
	else if( m_cnt == 87 ){
		
		glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
		[appli.m_gpsCtrl showResultPage:m_nLeft right:m_nRight from:m_from bLeft:m_bLeft];
		[appli.m_gpsCtrl closeFittingPage];
		return;
	}
	else {
		
		if ( m_cnt%6 < 2 ) {
			
			m_guideImg.hidden = YES;
			m_guide2Img.hidden = NO;
			m_guide3Img.hidden = YES;
		}
		else if ( m_cnt%6 < 4 ) {
			
			m_guideImg.hidden = YES;
			m_guide2Img.hidden = NO;
			m_guide3Img.hidden = YES;
		}
		else{
			
			m_guideImg.hidden = YES;
			m_guide2Img.hidden = YES;
			m_guide3Img.hidden = NO;
		}
	}
	
	//NSLog( @"cnt = %d", m_cnt );
	
	[NSTimer scheduledTimerWithTimeInterval:0.25
									 target:self
								   selector:@selector(startTimeOut:)
								   userInfo:nil
									repeats:NO];	
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:1];
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	[appli.m_gpsCtrl closeSingleFittingPage];
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:2];
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeSingleFittingPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:3];
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeSingleFittingPage];
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:4];
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeSingleFittingPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:5];
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeSingleFittingPage];
}


@end
