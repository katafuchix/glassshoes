//
//  fitResultController.m
//  glassshoes
//
//  Created by james Lee on 11/08/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "fitResultController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "glassShoes.h"
#import "profile.h"
#import "myGlassController.h"
#import "aboutMutiQues.h"


@implementation fitResultController

@synthesize m_helpCtrl;
@synthesize m_leftShoes;
@synthesize m_rightShoes;

@synthesize m_bkImg;

@synthesize m_leftName;
@synthesize m_rightName;
@synthesize m_fittingPer;

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
		self.m_helpCtrl = nil;
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
	
	[self closeHelpPage];
	
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
	
	[m_leftName release];
	[m_rightName release];
	[m_fittingPer release];
	
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
-(void)setInfo:(NSInteger)left right:(NSInteger)right{
	
	m_nLeft = left;
	m_nRight = right;
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_leftShoes = mg;
	[mg release];
	
	profile* l = [gs.m_mutiLists objectAtIndex:left];
	[m_leftShoes setInfo:[l isMan] color:left data:l.m_quesLists type:5 left:true];
	
	NSString* str = [[NSString alloc] initWithFormat:@"%@さん", l.m_name];

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
	m_leftName.text = [record componentsJoinedByString:@"\r"];
	m_leftName.font = font;
	[record removeAllObjects];
	[record release];
	[str release];
	
	if ( left == 0 )// 紫
		m_leftName.textColor = [UIColor colorWithRed:174.0f/255 green:89.0f/255 blue:253.0f/255 alpha:1.0];
	else if ( left == 1 )/// 赤
		m_leftName.textColor = [UIColor colorWithRed:212.0f/255 green:29.0f/255 blue:25.0f/255 alpha:1.0];
	else if ( left == 2 )/// オレンジ
		m_leftName.textColor = [UIColor colorWithRed:220.0f/255 green:136.0f/255 blue:20.0f/255 alpha:1.0];
	else if ( left == 3 )/// 緑
		m_leftName.textColor = [UIColor colorWithRed:19.0f/255 green:234.0f/255 blue:24.0f/255 alpha:1.0];
	else if ( left == 4 )/// グレー
		m_leftName.textColor = [UIColor colorWithRed:108.0f/255 green:110.0f/255 blue:112.0f/255 alpha:1.0];
	else if ( left == 5 )/// 青
		m_leftName.textColor = [UIColor colorWithRed:19.0f/255 green:24.0f/255 blue:234.0f/255 alpha:1.0];
	else if ( left == 6 )/// 黄色
		m_leftName.textColor = [UIColor colorWithRed:250.0f/255 green:253.0f/255 blue:4.0f/255 alpha:1.0];
	else if ( left == 7 )/// 茶色
		m_leftName.textColor = [UIColor colorWithRed:118.0f/255 green:46.0f/255 blue:2.0f/255 alpha:1.0];
	else if ( left == 8 )/// 黒
		m_leftName.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
	else if ( left == 9 )/// 白
		m_leftName.textColor = [UIColor colorWithRed:255.0f/255 green:136.0f/255 blue:143.0f/255 alpha:1.0];
	else if ( left == 10 )/// 肌色
		m_leftName.textColor = [UIColor colorWithRed:138.0f/255 green:142.0f/255 blue:255.0f/255 alpha:1.0];
	else if ( left == 11 )/// ピンク
		m_leftName.textColor = [UIColor colorWithRed:234.0f/255 green:120.0f/255 blue:234.0f/255 alpha:1.0];
	
	m_leftShoes.view.center = CGPointMake( 150, 167 );
	[self.view addSubview:[m_leftShoes view]];
	
	mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_rightShoes = mg;
	[mg release];
	
	profile* r = [gs.m_mutiLists objectAtIndex:right];
	[m_rightShoes setInfo:[r isMan] color:right data:r.m_quesLists type:5 left:false];
	
	str = [[NSString alloc] initWithFormat:@"%@さん", r.m_name];
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
	m_rightName.text = [record componentsJoinedByString:@"\r"];
	m_rightName.font = font;
	[record removeAllObjects];
	[record release];
	[str release];
	
	if ( right == 0 )// 紫
		m_rightName.textColor = [UIColor colorWithRed:174.0f/255 green:89.0f/255 blue:253.0f/255 alpha:1.0];
	else if ( right == 1 )/// 赤
		m_rightName.textColor = [UIColor colorWithRed:212.0f/255 green:29.0f/255 blue:25.0f/255 alpha:1.0];
	else if ( right == 2 )/// オレンジ
		m_rightName.textColor = [UIColor colorWithRed:220.0f/255 green:136.0f/255 blue:20.0f/255 alpha:1.0];
	else if ( right == 3 )/// 緑
		m_rightName.textColor = [UIColor colorWithRed:19.0f/255 green:234.0f/255 blue:24.0f/255 alpha:1.0];
	else if ( right == 4 )/// グレー
		m_rightName.textColor = [UIColor colorWithRed:108.0f/255 green:110.0f/255 blue:112.0f/255 alpha:1.0];
	else if ( right == 5 )/// 青
		m_rightName.textColor = [UIColor colorWithRed:19.0f/255 green:24.0f/255 blue:234.0f/255 alpha:1.0];
	else if ( right == 6 )/// 黄色
		m_rightName.textColor = [UIColor colorWithRed:250.0f/255 green:253.0f/255 blue:4.0f/255 alpha:1.0];
	else if ( right == 7 )/// 茶色
		m_rightName.textColor = [UIColor colorWithRed:118.0f/255 green:46.0f/255 blue:2.0f/255 alpha:1.0];
	else if ( right == 8 )/// 黒
		m_rightName.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
	else if ( right == 9 )/// 白
		m_rightName.textColor = [UIColor colorWithRed:255.0f/255 green:136.0f/255 blue:143.0f/255 alpha:1.0];
	else if ( right == 10 )/// 肌色
		m_rightName.textColor = [UIColor colorWithRed:138.0f/255 green:142.0f/255 blue:255.0f/255 alpha:1.0];
	else if ( right == 11 )/// ピンク
		m_rightName.textColor = [UIColor colorWithRed:234.0f/255 green:120.0f/255 blue:234.0f/255 alpha:1.0];
	
	m_rightShoes.view.center = CGPointMake( 150, 167 );
	//[self.view addSubview:[m_rightShoes view]];
	[self.view insertSubview:[m_rightShoes view] belowSubview:[m_leftShoes view]];	
	str = [[NSString alloc] initWithFormat:@"%d％", [gs checkMutiFit:l right:r]];
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


-(IBAction)selToSave:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 4;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showMutiFitSelPage];
	[appli.m_gpsCtrl closeMutiFitResultPage];
}

-(IBAction)selToHelp:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	[self showHelpPage];
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
	[appli.m_gpsCtrl closeMutiFitResultPage];
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
	[appli.m_gpsCtrl closeMutiFitResultPage];
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
	[appli.m_gpsCtrl closeMutiFitResultPage];
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
	[appli.m_gpsCtrl closeMutiFitResultPage];
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
	[appli.m_gpsCtrl closeMutiFitResultPage];
}


-(void)showHelpPage{
	
	aboutMutiQues* ctrl = [[aboutMutiQues alloc] initWithNibName:@"aboutMutiQues" bundle:[NSBundle mainBundle]];
	self.m_helpCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_helpCtrl view]];
	[m_helpCtrl setInfo:self left:m_nLeft right:m_nRight from:4];
}

-(void)closeHelpPage{
	
	if( m_helpCtrl != nil ){
		
		[[m_helpCtrl view] removeFromSuperview];
		[m_helpCtrl release];
		m_helpCtrl = nil;
	}
	
	m_mode = 0;
}

@end
