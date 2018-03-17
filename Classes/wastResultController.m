//
//  wastResultController.m
//  glassshoes
//
//  Created by james Lee on 11/08/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "wastResultController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "glassShoes.h"
#import "profile.h"
#import "myGlassController.h"
#import "aboutMutiQues.h"


@implementation wastResultController

@synthesize m_helpCtrl;
@synthesize	m_scrollView;

@synthesize m_leftShoesLists;
@synthesize m_rightShoesLists;
@synthesize m_leftNameLists;
@synthesize m_rightNameLists;
@synthesize m_cursorLists;

@synthesize m_bkImg;

@synthesize m_fittingPer;

@synthesize m_helpBtn;
@synthesize m_saveBtn;
@synthesize m_backBtn;

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
		self.m_leftShoesLists = [[NSMutableArray alloc] init];
		self.m_rightShoesLists = [[NSMutableArray alloc] init];
		self.m_leftNameLists = [[NSMutableArray alloc] init];
		self.m_rightNameLists = [[NSMutableArray alloc] init];
		self.m_cursorLists = [[NSMutableArray alloc] init];
		self.m_helpCtrl = nil;
		m_mode = 0;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	glassShoes *gs = [glassShoes sharedInstance];
	
	NSInteger count = [gs getMinFitCnt];
	
	m_scrollView.pagingEnabled = YES;
	m_scrollView.contentSize = CGSizeMake( 320*count, 214 );
	m_scrollView.showsVerticalScrollIndicator = NO;
	m_scrollView.showsHorizontalScrollIndicator = NO;
	m_scrollView.scrollsToTop = NO;
	
	if( count == 1 ){
		
		m_scrollView.scrollEnabled = NO;
	}
	
	for ( int i= 0; i< count; i++) {
		
		NSInteger right_no = [gs getMinFitWoman:i];
		profile* r = [gs.m_mutiLists objectAtIndex:right_no];
		
		myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
		[mg setInfo:[r isMan] color:right_no data:r.m_quesLists type:5 left:false];
		[m_leftShoesLists addObject:mg];
		[m_scrollView addSubview:mg.view];
		mg.view.center = CGPointMake( 150+ 320*i, 97 );
		
		NSString* str = [[NSString alloc] initWithFormat:@"%@さん", r.m_name];
		NSInteger fontSize = 24;
		NSInteger len = [str length];
		if( len > 10 )
			fontSize = 14;
		else if( len > 8 )
			fontSize = 16;
		else if( len > 6 )
			fontSize = 18;
		
		UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
		
		UILabel* rightLabel = [[UILabel alloc] initWithFrame:CGRectMake( 320*i+274, 0, 24, 214)];
		rightLabel.font = font;
		rightLabel.backgroundColor = [UIColor clearColor];
		rightLabel.textAlignment = UITextAlignmentCenter;
		
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
		rightLabel.text = [record componentsJoinedByString:@"\r"];
		[record removeAllObjects];
		[record release];
		[str release];
		
		rightLabel.numberOfLines = [str length];
		
		if ( right_no == 0 )// 紫
			rightLabel.textColor = [UIColor colorWithRed:174.0f/255 green:89.0f/255 blue:253.0f/255 alpha:1.0];
		else if ( right_no == 1 )/// 赤
			rightLabel.textColor = [UIColor colorWithRed:212.0f/255 green:29.0f/255 blue:25.0f/255 alpha:1.0];
		else if ( right_no == 2 )/// オレンジ
			rightLabel.textColor = [UIColor colorWithRed:220.0f/255 green:136.0f/255 blue:20.0f/255 alpha:1.0];
		else if ( right_no == 3 )/// 緑
			rightLabel.textColor = [UIColor colorWithRed:19.0f/255 green:234.0f/255 blue:24.0f/255 alpha:1.0];
		else if ( right_no == 4 )/// グレー
			rightLabel.textColor = [UIColor colorWithRed:108.0f/255 green:110.0f/255 blue:112.0f/255 alpha:1.0];
		else if ( right_no == 5 )/// 青
			rightLabel.textColor = [UIColor colorWithRed:19.0f/255 green:24.0f/255 blue:234.0f/255 alpha:1.0];
		else if ( right_no == 6 )/// 黄色
			rightLabel.textColor = [UIColor colorWithRed:250.0f/255 green:253.0f/255 blue:4.0f/255 alpha:1.0];
		else if ( right_no == 7 )/// 茶色
			rightLabel.textColor = [UIColor colorWithRed:118.0f/255 green:46.0f/255 blue:2.0f/255 alpha:1.0];
		else if ( right_no == 8 )/// 黒
			rightLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
		else if ( right_no == 9 )/// 白
			rightLabel.textColor = [UIColor colorWithRed:255.0f/255 green:136.0f/255 blue:143.0f/255 alpha:1.0];
		else if ( right_no == 10 )/// 肌色
			rightLabel.textColor = [UIColor colorWithRed:138.0f/255 green:142.0f/255 blue:255.0f/255 alpha:1.0];
		else if ( right_no == 11 )/// ピンク
			rightLabel.textColor = [UIColor colorWithRed:234.0f/255 green:120.0f/255 blue:234.0f/255 alpha:1.0];
		
		[m_scrollView addSubview:rightLabel];
		
		NSInteger left_no = [gs getMinFitMan:i];
		profile* l = [gs.m_mutiLists objectAtIndex:left_no];
		
		mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
		[mg setInfo:[l isMan] color:left_no data:l.m_quesLists type:5 left:true];
		[m_leftShoesLists addObject:mg];
		[m_scrollView addSubview:mg.view];
		mg.view.center = CGPointMake( 150+ 320*i, 97 );
		
		str = [[NSString alloc] initWithFormat:@"%@さん", l.m_name];
		fontSize = 24;
		len = [str length];
		if( len > 10 )
			fontSize = 14;
		else if( len > 8 )
			fontSize = 16;
		else if( len > 6 )
			fontSize = 18;
		
		font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
		
		UILabel* leftLabel = [[UILabel alloc] initWithFrame:CGRectMake( 320*i+20, 0, 24, 214)];
		leftLabel.font = font;
		leftLabel.backgroundColor = [UIColor clearColor];
		leftLabel.textAlignment = UITextAlignmentCenter;
		
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
		leftLabel.text = [record componentsJoinedByString:@"\r"];
		[record removeAllObjects];
		[record release];
		leftLabel.numberOfLines = [str length];
		
		if ( left_no == 0 )// 紫
			leftLabel.textColor = [UIColor colorWithRed:174.0f/255 green:89.0f/255 blue:253.0f/255 alpha:1.0];
		else if ( left_no == 1 )/// 赤
			leftLabel.textColor = [UIColor colorWithRed:212.0f/255 green:29.0f/255 blue:25.0f/255 alpha:1.0];
		else if ( left_no == 2 )/// オレンジ
			leftLabel.textColor = [UIColor colorWithRed:220.0f/255 green:136.0f/255 blue:20.0f/255 alpha:1.0];
		else if ( left_no == 3 )/// 緑
			leftLabel.textColor = [UIColor colorWithRed:19.0f/255 green:234.0f/255 blue:24.0f/255 alpha:1.0];
		else if ( left_no == 4 )/// グレー
			leftLabel.textColor = [UIColor colorWithRed:108.0f/255 green:110.0f/255 blue:112.0f/255 alpha:1.0];
		else if ( left_no == 5 )/// 青
			leftLabel.textColor = [UIColor colorWithRed:19.0f/255 green:24.0f/255 blue:234.0f/255 alpha:1.0];
		else if ( left_no == 6 )/// 黄色
			leftLabel.textColor = [UIColor colorWithRed:250.0f/255 green:253.0f/255 blue:4.0f/255 alpha:1.0];
		else if ( left_no == 7 )/// 茶色
			leftLabel.textColor = [UIColor colorWithRed:118.0f/255 green:46.0f/255 blue:2.0f/255 alpha:1.0];
		else if ( left_no == 8 )/// 黒
			leftLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
		else if ( left_no == 9 )/// 白
			leftLabel.textColor = [UIColor colorWithRed:255.0f/255 green:136.0f/255 blue:143.0f/255 alpha:1.0];
		else if ( left_no == 10 )/// 肌色
			leftLabel.textColor = [UIColor colorWithRed:138.0f/255 green:142.0f/255 blue:255.0f/255 alpha:1.0];
		else if ( left_no == 11 )/// ピンク
			leftLabel.textColor = [UIColor colorWithRed:234.0f/255 green:120.0f/255 blue:234.0f/255 alpha:1.0];
		
		[m_scrollView addSubview:leftLabel];

		if ( i != 0 ) {
			
			UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"x_left" ofType:@"png"]];
			UIImageView* v = [[UIImageView alloc] initWithImage:img];
			[img release];
			v.frame = CGRectMake( i*320, 95, 20, 24 );
			[m_scrollView addSubview:v];
			[m_cursorLists addObject:v];
		}
		
		if ( i != count-1 ) {
			
			UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"x_right" ofType:@"png"]];
			UIImageView* v = [[UIImageView alloc] initWithImage:img];
			[img release];
			v.frame = CGRectMake( i*320+300, 95, 20, 24 );
			[m_scrollView addSubview:v];
			[m_cursorLists addObject:v];
		}
	}
	
	NSString* str = [[NSString alloc] initWithFormat:@"%d％", [gs getMinFit]];
	m_fittingPer.text = str;
	[str release];
	
	if( count > 1 ){
		
		m_cnt = 0;
		[NSTimer scheduledTimerWithTimeInterval:1.0
										 target:self
									   selector:@selector(startTimeOut:)
									   userInfo:nil
										repeats:NO];
	}
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
	
	if ( m_cursorLists != nil ){
		
		for ( int i= 0; i< [m_cursorLists count]; i++) {
			
			UIImageView* m = [m_cursorLists objectAtIndex:i];
			
			if( m_cnt%2 == 0 ){
				m.hidden = NO;
			}
			else {
				m.hidden = YES;
			}
		}
	}
	
	m_cnt++;
	if ( m_cnt < 11 ) {
		
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
	
	[self closeHelpPage];
	
	if ( m_leftShoesLists != nil ){
		
		for ( int i= 0; i< [m_leftShoesLists count]; i++) {
			
			myGlassController* m = [m_leftShoesLists lastObject];
			[m_leftShoesLists removeLastObject];
			[m.view removeFromSuperview];
			[m release];
			m = nil;
		}
		
		[m_leftShoesLists release];
		m_leftShoesLists = nil;
	}
	
	if ( m_rightShoesLists != nil ){
		
		for ( int i= 0; i< [m_rightShoesLists count]; i++) {
			
			myGlassController* m = [m_rightShoesLists lastObject];
			[m_rightShoesLists removeLastObject];
			[m.view removeFromSuperview];
			[m release];
			m = nil;
		}
		
		[m_rightShoesLists release];
		m_rightShoesLists = nil;
	}
	
	if ( m_leftNameLists != nil ){
		
		for ( int i= 0; i< [m_leftNameLists count]; i++) {
			
			UILabel* m = [m_leftNameLists lastObject];
			[m_leftNameLists removeLastObject];
			[m removeFromSuperview];
			[m release];
			m = nil;
		}
		
		[m_leftNameLists release];
		m_leftNameLists = nil;
	}
	
	if ( m_rightNameLists != nil ){
		
		for ( int i= 0; i< [m_rightNameLists count]; i++) {
			
			UILabel* m = [m_rightNameLists lastObject];
			[m_rightNameLists removeLastObject];
			[m removeFromSuperview];
			[m release];
			m = nil;
		}
		
		[m_rightNameLists release];
		m_rightNameLists = nil;
	}
	
	if ( m_cursorLists != nil ){
		
		for ( int i= 0; i< [m_cursorLists count]; i++) {
			
			UIImageView* m = [m_cursorLists lastObject];
			[m_cursorLists removeLastObject];
			[m removeFromSuperview];
			[m release];
			m = nil;
		}
		
		[m_cursorLists release];
		m_cursorLists = nil;
	}
	
	[m_scrollView release];
	
	[m_bkImg release];	
	[m_fittingPer release];
	
	[m_saveBtn release];
	[m_helpBtn release];
	[m_backBtn release];
	
	[m_tabBar release];	
	[m_top release];	
	[m_profile release];	
	[m_history release];	
	[m_search release];
	[m_setting release];	

    [super dealloc];
}

-(IBAction)selToSave:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 3;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showMutiFitSelPage];
	[appli.m_gpsCtrl closeWastFitPage];
}

-(IBAction)selToHelp:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 4;
	
	[self showHelpPage];
}

-(IBAction)selToBack:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showBestFitPage];
	[appli.m_gpsCtrl closeWastFitPage];
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
	[appli.m_gpsCtrl closeWastFitPage];
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
	[appli.m_gpsCtrl closeWastFitPage];
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
	[appli.m_gpsCtrl closeWastFitPage];
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
	[appli.m_gpsCtrl closeWastFitPage];
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
	[appli.m_gpsCtrl closeWastFitPage];
}


-(void)showHelpPage{
	
	NSInteger cnt = m_scrollView.contentOffset.x/320;
	
	glassShoes *gs = [glassShoes sharedInstance];
	aboutMutiQues* ctrl = [[aboutMutiQues alloc] initWithNibName:@"aboutMutiQues" bundle:[NSBundle mainBundle]];
	self.m_helpCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_helpCtrl view]];
	[m_helpCtrl setInfo:self left:[gs getMinFitMan:cnt] right:[gs getMinFitWoman:cnt] from:2];
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
