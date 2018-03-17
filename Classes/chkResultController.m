//
//  chkResultController.m
//  glassshoes
//
//  Created by james Lee on 11/08/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "chkResultController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "glassshoes.h"
#import "myGlassController.h"

#import "chkHelpController.h"
#import "chkFitController.h"
#import "chkSaveController.h"
#import "aboutType.h"
#import "aboutProfile.h"
#import "chkReplaceController.h"
#import "chkOverController.h"

@implementation chkResultController

@synthesize m_shoes;

@synthesize m_typeCtrl;
@synthesize m_quesCtrl;
@synthesize m_helpCtrl;
@synthesize m_fitCtrl;
@synthesize m_saveCtrl;
@synthesize m_replaceCtrl;
@synthesize m_overCtrl;

@synthesize m_scrollView;
@synthesize m_helpBtn;
@synthesize m_fitBtn;
@synthesize m_saveBtn;
@synthesize m_downBtn;

@synthesize m_bkImg;
@synthesize m_nameLabel;
@synthesize m_wakuImg;
@synthesize m_typeImg;

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
		self.m_shoes = nil;
		self.m_helpCtrl = nil;
		self.m_fitCtrl = nil;
		self.m_saveCtrl = nil;
		self.m_typeCtrl = nil;
		self.m_quesCtrl = nil;
		m_mode = 0;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	glassShoes *gs = [glassShoes sharedInstance];
	NSInteger type = [gs checkSingleType];

	NSString* typeStr;
	BOOL bMan = [gs isMan];
	if ( bMan ) {
		typeStr = [[NSString alloc] initWithFormat:@"type_man%d", type];
	}
	else {
		typeStr = [[NSString alloc] initWithFormat:@"type_woman%d", type];
	}
	
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:typeStr ofType:@"png"]];
	UIImageView* ti = [[UIImageView alloc] initWithImage:img];
	self.m_typeImg = ti;
	[ti release];
	[img release];
	[typeStr release];
	
	m_typeImg.frame = CGRectMake( 15, 55, 278, 139);
	[self.view insertSubview:m_typeImg belowSubview:m_nameLabel];
	
	NSString* str = [[NSString alloc] initWithFormat:@"%@さんは", gs.m_name];
	m_nameLabel.text = str;
	[str release];

	myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_shoes = mg;
	[mg release];
	
	[m_scrollView addSubview:[m_shoes view]];
	[m_shoes setInfo:bMan color:0 data:gs.m_sQuesLists type:1 left:bMan];
	
	m_shoes.view.center = m_wakuImg.center;

	m_scrollView.pagingEnabled = NO;
	m_scrollView.contentSize = CGSizeMake( 256, 244 );
	m_scrollView.showsVerticalScrollIndicator = YES;
	m_scrollView.showsHorizontalScrollIndicator = NO;
	m_scrollView.scrollsToTop = YES;
	
	m_cnt = 0;
	[NSTimer scheduledTimerWithTimeInterval:1.0
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


-(void)startTimeOut:( NSTimer *)aTimer{
	
	if ( m_downBtn.hidden == YES ) {
		m_downBtn.hidden = NO;
	}
	else {
		m_downBtn.hidden = YES;
	}
	
	m_cnt++;
	if ( m_cnt == 10 ) {
		
		m_downBtn.hidden = NO;
	}
	else{
		
		[NSTimer scheduledTimerWithTimeInterval:1.0
										 target:self
									   selector:@selector(startTimeOut:)
									   userInfo:nil
										repeats:NO];
	}
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
	
	if( m_shoes != nil ){
		
		[[m_shoes view] removeFromSuperview];
		[m_shoes release];
		m_shoes = nil;
	}
	
	[self closeHelpSelPage];
	[self closeFitSelPage];
	[self closeSaveSelPage];
	[self closeTypeHelpPage];
	[self closeQuesHelpPage];
	
	[m_nameLabel release];
	
	[m_scrollView release];
	[m_helpBtn release];	
	[m_saveBtn release];
	[m_fitBtn release];	
	[m_downBtn release];
	
	[m_bkImg release];	
	[m_wakuImg release];	
	[m_typeImg release];	
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(void)showHelpSelPage{
	
	[self closeHelpSelPage];
	
	chkHelpController* ctrl = [[chkHelpController alloc] initWithNibName:@"chkHelpController" bundle:[NSBundle mainBundle]];
	self.m_helpCtrl = ctrl;
	[ctrl release];
	
	m_helpCtrl.view.frame = CGRectMake( 2, 310, 316, 170);
	[self.view addSubview:[m_helpCtrl view]];
	[m_helpCtrl setInfo:self from:true];
}

-(void)closeHelpSelPage{
	
	if( m_helpCtrl != nil ){
		
		[[m_helpCtrl view] removeFromSuperview];
		[m_helpCtrl release];
		m_helpCtrl = nil;
	}

	m_mode = 0;
}

-(void)showFitSelPage{
	
	chkFitController* ctrl = [[chkFitController alloc] initWithNibName:@"chkFitController" bundle:[NSBundle mainBundle]];
	self.m_fitCtrl = ctrl;
	[ctrl release];
	
	m_fitCtrl.view.frame = CGRectMake( 2, 310, 316, 170);
	[self.view addSubview:[m_fitCtrl view]];
	[m_fitCtrl setInfo:self profile:-1 from:false];
}

-(void)closeFitSelPage{
	
	if( m_fitCtrl != nil ){
		
		[[m_fitCtrl view] removeFromSuperview];
		[m_fitCtrl release];
		m_fitCtrl = nil;
	}

	m_mode = 0;
}

-(void)showSaveSelPage{
	
	chkSaveController* ctrl = [[chkSaveController alloc] initWithNibName:@"chkSaveController" bundle:[NSBundle mainBundle]];
	self.m_saveCtrl = ctrl;
	[ctrl release];
	
	m_saveCtrl.view.frame = CGRectMake( 2, 310, 316, 170);
	[self.view addSubview:[m_saveCtrl view]];
	[m_saveCtrl setInfo:self];
}

-(void)closeSaveSelPage{
	
	if( m_saveCtrl != nil ){
		
		[[m_saveCtrl view] removeFromSuperview];
		[m_saveCtrl release];
		m_saveCtrl = nil;
	}

	m_mode = 0;
}

-(void)showReplacePage{
	
	chkReplaceController* ctrl = [[chkReplaceController alloc] initWithNibName:@"chkReplaceController" bundle:[NSBundle mainBundle]];
	self.m_replaceCtrl = ctrl;
	[ctrl release];
	
	m_replaceCtrl.view.frame = CGRectMake( 2, 310, 316, 170);
	[self.view addSubview:[m_replaceCtrl view]];
	[m_replaceCtrl setInfo:self];
}

-(void)closeReplacePage{
	
	if( m_replaceCtrl != nil ){
		
		[[m_replaceCtrl view] removeFromSuperview];
		[m_replaceCtrl release];
		m_replaceCtrl = nil;
	}

	m_mode = 0;
}

-(void)showOverPage{
	
	chkOverController* ctrl = [[chkOverController alloc] initWithNibName:@"chkOverController" bundle:[NSBundle mainBundle]];
	self.m_overCtrl = ctrl;
	[ctrl release];
	
	m_overCtrl.view.frame = CGRectMake( 2, 310, 316, 170);
	[self.view addSubview:[m_overCtrl view]];
	[m_overCtrl setInfo:self];
}

-(void)closeOverPage{
	
	if( m_overCtrl != nil ){
		
		[[m_overCtrl view] removeFromSuperview];
		[m_overCtrl release];
		m_overCtrl = nil;
	}
	
	m_mode = 0;
}

-(IBAction)selToDown:(id)sender{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.2];	// 0.2秒でアニメーション
	
	m_scrollView.contentOffset = CGPointMake( 0, 46);
	
	[UIView commitAnimations];
}

-(IBAction)selToHelp:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 3;
	
	[self showHelpSelPage];
}

-(IBAction)selToFit:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 4;
	
	[self showFitSelPage];
}

-(IBAction)selToSave:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	[self showSaveSelPage];
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
	[appli.m_gpsCtrl closeChkResultPage];
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
	[appli.m_gpsCtrl closeChkResultPage];
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
	[appli.m_gpsCtrl closeChkResultPage];
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
	[appli.m_gpsCtrl closeChkResultPage];
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
	[appli.m_gpsCtrl closeChkResultPage];
}


-(void)showTypeHelpPage{
	
	aboutType* ctrl = [[aboutType alloc] initWithNibName:@"aboutType" bundle:[NSBundle mainBundle]];
	self.m_typeCtrl = ctrl;
	[ctrl release];
	
	m_typeCtrl.view.frame = CGRectMake( 0, 0, 320, 480);
	[self.view addSubview:[m_typeCtrl view]];
	[m_typeCtrl setInfo:self profile:-1 from:true];
}

-(void)closeTypeHelpPage{
	
	if( m_typeCtrl != nil ){
		
		[[m_typeCtrl view] removeFromSuperview];
		[m_typeCtrl release];
		m_typeCtrl = nil;
	}
}

-(void)showQuesHelpPage{

	aboutProfile* ctrl = [[aboutProfile alloc] initWithNibName:@"aboutProfile" bundle:[NSBundle mainBundle]];
	self.m_quesCtrl = ctrl;
	[ctrl release];
	
	m_quesCtrl.view.frame = CGRectMake( 0, 0, 320, 480);
	[self.view addSubview:[m_quesCtrl view]];
	[m_quesCtrl setInfo:self profile:-1 right:-1 from:true single:true];
}

-(void)closeQuesHelpPage{
	
	if( m_quesCtrl != nil ){
		
		[[m_quesCtrl view] removeFromSuperview];
		[m_quesCtrl release];
		m_quesCtrl = nil;
	}
}

@end
