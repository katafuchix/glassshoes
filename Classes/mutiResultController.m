//
//  mutiResultController.m
//  glassshoes
//
//  Created by james Lee on 11/08/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "mutiResultController.h"
#import "glassshoesAppDelegate.h"
#import "glassshoes.h"
#import "myGlassController.h"
#import "myGPSController.h"


@implementation mutiResultController

@synthesize m_shoes;

@synthesize m_nextBtn;
@synthesize m_fitBtn;

@synthesize m_bkImg;
@synthesize m_paperImg;
@synthesize m_nameImg;
@synthesize m_wakuImg;
@synthesize m_nameLabel;

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
		m_mode = 0;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	glassShoes *gs = [glassShoes sharedInstance];
	
	NSString* str = [[NSString alloc] initWithFormat:@"%@さんの", gs.m_name];
	m_nameLabel.text = str;
	[str release];
	
	NSInteger number = [gs getMutiNumber];
	if ( number == 0 )// 紫
		m_nameLabel.textColor = [UIColor colorWithRed:174.0f/255 green:89.0f/255 blue:253.0f/255 alpha:1.0];
	else if ( number == 1 )// 赤
		m_nameLabel.textColor = [UIColor colorWithRed:212.0f/255 green:29.0f/255 blue:25.0f/255 alpha:1.0];
	else if ( number == 2 )// オレンジ
		m_nameLabel.textColor = [UIColor colorWithRed:220.0f/255 green:136.0f/255 blue:20.0f/255 alpha:1.0];
	else if ( number == 3 )// 緑
		m_nameLabel.textColor = [UIColor colorWithRed:19.0f/255 green:234.0f/255 blue:24.0f/255 alpha:1.0];
	else if ( number == 4 )// グレー
		m_nameLabel.textColor = [UIColor colorWithRed:108.0f/255 green:110.0f/255 blue:112.0f/255 alpha:1.0];
	else if ( number == 5 )// 青
		m_nameLabel.textColor = [UIColor colorWithRed:19.0f/255 green:24.0f/255 blue:234.0f/255 alpha:1.0];
	else if ( number == 6 )// 黄色
		m_nameLabel.textColor = [UIColor colorWithRed:250.0f/255 green:253.0f/255 blue:4.0f/255 alpha:1.0];
	else if ( number == 7 )// 茶色
		m_nameLabel.textColor = [UIColor colorWithRed:118.0f/255 green:46.0f/255 blue:2.0f/255 alpha:1.0];
	else if ( number == 8 )// 黒
		m_nameLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
	else if ( number == 9 )// 白
		m_nameLabel.textColor = [UIColor colorWithRed:255.0f/255 green:136.0f/255 blue:143.0f/255 alpha:1.0];
	else if ( number == 10 )// 肌色
		m_nameLabel.textColor = [UIColor colorWithRed:138.0f/255 green:142.0f/255 blue:255.0f/255 alpha:1.0];
	else if ( number == 11 )// ピンク
		m_nameLabel.textColor = [UIColor colorWithRed:234.0f/255 green:120.0f/255 blue:234.0f/255 alpha:1.0];
	
	myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_shoes = mg;
	[mg release];
	
	[self.view addSubview:[m_shoes view]];
	[m_shoes setInfo:[gs isMan] color:number data:gs.m_mQuesLists type:3 left:[gs isMan]];
	
	m_shoes.view.center = CGPointMake( 160, 242 );

	if( [gs haveTwoSex] == false ){

		m_fitBtn.hidden = YES;
	}
	
	if ( [gs getMutiNumber] == 11 ) {
		
		m_nextBtn.hidden = YES;
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
	
	[m_nameLabel release];
	
	[m_nextBtn release];	
	[m_fitBtn release];	
	
	[m_bkImg release];	
	[m_paperImg release];	
	[m_nameImg release];	
	[m_wakuImg release];	
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(IBAction)selToFit:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 4;
	
	glassShoes *gs = [glassShoes sharedInstance];
	[gs addMutiProfile];
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showMutiChkPage];
	[appli.m_gpsCtrl closeMutiChkResultPage];
}

-(IBAction)selToNext:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	glassShoes *gs = [glassShoes sharedInstance];
	[gs addMutiProfile];
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showInputPage:false num:[gs getMutiNumber]];
	[appli.m_gpsCtrl closeMutiChkResultPage];
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	[appli.m_gpsCtrl closeMutiChkResultPage];
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeMutiChkResultPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeMutiChkResultPage];
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeMutiChkResultPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeMutiChkResultPage];
}

@end
