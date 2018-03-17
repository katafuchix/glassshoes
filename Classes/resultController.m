//
//  resultController.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "resultController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "glassShoes.h"
#import "profile.h"
#import "myGlassController.h"
#import "aboutProfile.h"

@implementation resultController

@synthesize m_leftShoes;
@synthesize m_rightShoes;
@synthesize m_quesCtrl;

@synthesize m_bkImg;
@synthesize m_guideImg;

@synthesize m_leftName;
@synthesize m_rightName;
@synthesize m_fittingPer;

@synthesize m_backBtn;
@synthesize m_helpBtn;
@synthesize m_saveBtn;

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
		self.m_quesCtrl = nil;
		m_bSaved = false;
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
	
	[self closeQuesHelpPage];
	[m_bkImg release];	
	[m_guideImg release];	

	[m_leftName release];
	[m_rightName release];
	[m_fittingPer release];
	
	[m_backBtn release];
	[m_saveBtn release];
	[m_helpBtn release];
	
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

	/*
	NSString* log = [[NSString alloc] initWithFormat:@"l = %d, r = %d", m_nLeft, m_nRight ];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BUMP完了"
													message:log
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	[log release];
	return;
	*/
	 
	glassShoes *gs = [glassShoes sharedInstance];
	
	myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_rightShoes = mg;
	[mg release];
	
	NSString* str;
	if( m_nRight == -1 ){
		
		[m_rightShoes setInfo:[gs isMan] color:0 data:gs.m_sQuesLists type:11 left:false];
		
		str = [[NSString alloc] initWithFormat:@"%@さん", gs.m_name];
	}
	else if( m_nRight == -2 ){
		
		[m_rightShoes setInfo:[gs.m_guestProfile isMan] color:0 data:gs.m_guestProfile.m_quesLists type:11 left:false];
		
		str = [[NSString alloc] initWithFormat:@"%@さん", gs.m_guestProfile.m_name];
	}
	else if( m_nRight == 0 ){
		
		[m_rightShoes setInfo:[gs.m_myProfile isMan] color:0 data:gs.m_myProfile.m_quesLists type:11 left:false];
		
		str = [[NSString alloc] initWithFormat:@"%@さん", gs.m_myProfile.m_name];
	}
	else {
		profile* p = [gs.m_friendLists objectAtIndex:(m_nRight-1)];
		[m_rightShoes setInfo:[p isMan] color:0 data:p.m_quesLists type:11 left:false];
		
		str = [[NSString alloc] initWithFormat:@"%@さん", p.m_name];
	}
	
	NSInteger fontSize = 24;
	NSInteger len = [str length];
	if( len > 10 )
		fontSize = 14;
	else if( len > 8 )
		fontSize = 16;
	else if( len > 6 )
		fontSize = 18;
	
	UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
	
	NSMutableArray* record = [[NSMutableArray alloc] init];
	for ( int i= 0; i< [str length]; i++) {
		
		NSString* sub = [str substringWithRange:NSMakeRange(i, 1)];
		//NSLog( @"sub = %@", sub);
		
		if ( [sub isEqualToString:@"—"] == true ){			
			
			[record addObject:@"|"];
		}
		else if ( [sub isEqualToString:@"ー"] == true ){			
			
			[record addObject:@"|"];
		}
		else {
			[record addObject:sub];
		}
	}
	m_rightName.text = [record componentsJoinedByString:@"\r"];
	m_rightName.font = font;
	[record removeAllObjects];
	[record release];
	[str release];
	
	m_rightShoes.view.frame = CGRectMake( 70, 88, 180, 180 );
	[self.view addSubview:[m_rightShoes view]];
	
	mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_leftShoes = mg;
	[mg release];
	
	if( left == -1 ){
		[m_leftShoes setInfo:[gs isMan] color:0 data:gs.m_sQuesLists type:11 left:true];
		
		str = [[NSString alloc] initWithFormat:@"%@さん", gs.m_name];
	}
	else if( left == -2 ){
	
		[m_leftShoes setInfo:[gs.m_guestProfile isMan] color:0 data:gs.m_guestProfile.m_quesLists type:11 left:true];
		
		str = [[NSString alloc] initWithFormat:@"%@さん", gs.m_guestProfile.m_name];
	}
	else if( left == 0 ){
		
		[m_leftShoes setInfo:[gs.m_myProfile isMan] color:0 data:gs.m_myProfile.m_quesLists type:11 left:true];

		str = [[NSString alloc] initWithFormat:@"%@さん", gs.m_myProfile.m_name];
	}
	else {
		profile* p = [gs.m_friendLists objectAtIndex:(left-1)];
		[m_leftShoes setInfo:[p isMan] color:0 data:p.m_quesLists type:11 left:true];

		str = [[NSString alloc] initWithFormat:@"%@さん", p.m_name];
	}

	fontSize = 24;
	len = [str length];
	if( len > 10 )
		fontSize = 14;
	else if( len > 8 )
		fontSize = 16;
	else if( len > 6 )
		fontSize = 18;
	
	font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
	
	record = [[NSMutableArray alloc] init];
	for ( int i= 0; i< [str length]; i++) {
		
		NSString* sub = [str substringWithRange:NSMakeRange(i, 1)];
		//NSLog( @"sub = %@", sub);
		
		if ( [sub isEqualToString:@"—"] == true ){			
			
			[record addObject:@"|"];
		}
		else if ( [sub isEqualToString:@"ー"] == true ){			
			
			[record addObject:@"|"];
		}
		else {
			[record addObject:sub];
		}
	}
	m_leftName.text = [record componentsJoinedByString:@"\r"];
	m_leftName.font = font;
	
	[record removeAllObjects];
	[record release];
	[str release];
	
	m_leftShoes.view.frame = CGRectMake( 70, 88, 180, 180 );
	[self.view addSubview:[m_leftShoes view]];
	
	str = [[NSString alloc] initWithFormat:@"%d％", [gs checkFit:left right:right]];
	m_fittingPer.text = str;
	[str release];
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


-(void)showQuesHelpPage{
	
	aboutProfile* ctrl = [[aboutProfile alloc] initWithNibName:@"aboutProfile" bundle:[NSBundle mainBundle]];
	self.m_quesCtrl = ctrl;
	[ctrl release];
	
	m_quesCtrl.view.frame = CGRectMake( 0, 0, 320, 480);
	[self.view addSubview:[m_quesCtrl view]];
	[m_quesCtrl setInfo:self profile:m_nLeft right:m_nRight from:false single:true];
}

-(void)closeQuesHelpPage{
	
	if( m_quesCtrl != nil ){
		
		[[m_quesCtrl view] removeFromSuperview];
		[m_quesCtrl release];
		m_quesCtrl = nil;
	}
	
	m_mode = 0;
}

-(IBAction)selToBack:(id)sender{

	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];

	if( m_nLeft == -1 || m_nRight == -1 ){
		[appli.m_gpsCtrl showChkResultPage];
	}
	else if( m_bLeft ){
		
		[appli.m_gpsCtrl showProfilePage:m_nLeft from:m_from];
	}
	else {
		
		[appli.m_gpsCtrl showProfilePage:m_nRight from:m_from];
	}

	[appli.m_gpsCtrl closeResultPage];
}

-(IBAction)selToSave:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( m_bSaved ) {
		
		return;
	}
	
	m_mode = 4;

	glassShoes *gs = [glassShoes sharedInstance];
	
	NSString* str = nil;
	if( m_nLeft == -1 ){
		
		str = gs.m_name;
	}
	else if( m_nLeft == -2 ){
		
		str = gs.m_guestProfile.m_name;
	}
	else if( m_nLeft > 0 ){
		
		profile* p = [gs.m_friendLists objectAtIndex:(m_nLeft-1)];
		str = p.m_name;
	}
	
	NSString* rstr = nil;
	if( m_nRight == -1 ){
		
		rstr = gs.m_name;
	}
	else if( m_nRight == -2 ){
		
		rstr = gs.m_guestProfile.m_name;
	}
	else if( m_nRight > 0 ){
		
		profile* p = [gs.m_friendLists objectAtIndex:(m_nRight-1)];
		rstr = p.m_name;
	}
	
	[gs addFitHistory:str right:rstr per:[gs checkFit:m_nLeft right:m_nRight]];
	m_bSaved = true;
	m_mode = 0;
	
	m_saveBtn.hidden = YES;
	/*
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showFitHistoryPage:true];
	[appli.m_gpsCtrl closeResultPage];
	*/ 
}

-(IBAction)selToHelp:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	[self showQuesHelpPage];
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( !m_bSaved && [super isAsked] == false ) {
		
		[super showMoveConfPage:1];
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	[appli.m_gpsCtrl closeResultPage];
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}

	if ( !m_bSaved && [super isAsked] == false ) {
		
		[super showMoveConfPage:2];
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeResultPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( !m_bSaved && [super isAsked] == false ) {
		
		[super showMoveConfPage:3];
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeResultPage];
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( !m_bSaved && [super isAsked] == false ) {
		
		[super showMoveConfPage:4];
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeResultPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( !m_bSaved && [super isAsked] == false ) {
		
		[super showMoveConfPage:5];
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeResultPage];
}


@end
