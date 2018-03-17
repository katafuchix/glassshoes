//
//  worldController.m
//  glassshoes
//
//  Created by james Lee on 11/09/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "worldController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "searchTopController.h"
#import "glassshoes.h"

@implementation worldController

@synthesize m_parent;

@synthesize m_scrollView;
@synthesize m_numLabel;
@synthesize m_bestLabel;
@synthesize m_goodLabel;
@synthesize m_saveBtn;
@synthesize m_searchTime;

@synthesize m_bkImg;
@synthesize m_starImg;
@synthesize m_star2Img;
@synthesize m_star3Img;

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
		m_starImg.alpha = 1.0;
		m_star2Img.alpha = 0;
		m_star3Img.alpha = 0;
		m_mode = 0;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self showStart1];
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
	
	[m_scrollView release];	
	[m_numLabel release];	
	[m_bestLabel release];	
	[m_goodLabel release];	
	[m_searchTime release];
	
	[m_bkImg release];	
	[m_starImg release];
	[m_star2Img release];
	[m_star3Img release];
	
	[m_saveBtn release];
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(void)setInfo:(NSString*)data{
	
	NSDate *now = [[NSDate alloc] init];
	self.m_searchTime = now;
	[now release];
	
	NSArray *items = [data componentsSeparatedByString:@"&"];
	if ( [items count] == 3 ) {

		NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:0] ];
		m_numLabel.text = str;
		[str release];
		
		str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:1] ];
		NSArray *sub = [str componentsSeparatedByString:@","];
		if ( [sub count] == 5 ) {

			if ( [[sub objectAtIndex:0] isEqualToString:@"JP"] == true ){			
				
				NSString* place = [[NSString alloc] initWithFormat:@"%@%@%@", [sub objectAtIndex:2], [sub objectAtIndex:3], [sub objectAtIndex:4]];
				m_bestLabel.text = place;
				[place release];
			}
			else {
				NSString* place = [[NSString alloc] initWithFormat:@"%@%@%@", [sub objectAtIndex:1], [sub objectAtIndex:2], [sub objectAtIndex:3]];
				m_bestLabel.text = place;
				[place release];
			}
		}
		[str release];
		
		str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:2]];
		NSArray *good = [str componentsSeparatedByString:@","];
		if ( [good count] == 5 ) {
			
			if ( [[good objectAtIndex:0] isEqualToString:@"JP"] == true ){			
				
				NSString* place = [[NSString alloc] initWithFormat:@"%@%@%@", [good objectAtIndex:2], [good objectAtIndex:3], [good objectAtIndex:4]];
				m_goodLabel.text = place;
				[place release];
			}
			else {
				NSString* place = [[NSString alloc] initWithFormat:@"%@%@%@", [good objectAtIndex:1], [good objectAtIndex:2], [good objectAtIndex:3]];
				m_goodLabel.text = place;
				[place release];
			}
		}
		
		[str release];
	}
	
	m_scrollView.pagingEnabled = NO;
	m_scrollView.contentSize = CGSizeMake( 320, 461 );
	m_scrollView.showsVerticalScrollIndicator = YES;
	m_scrollView.showsHorizontalScrollIndicator = NO;
	m_scrollView.scrollsToTop = YES;
	
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
	
	m_mode = 5;
	
	glassShoes *gs = [glassShoes sharedInstance];

	if ( gs.m_worldSearchTime != nil ) {
		[gs.m_worldSearchTime release];
	}
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateFormat  = @"yyyy/MM/dd";
	
	NSString* str = [[NSString alloc] initWithFormat:@"%@", [df stringFromDate:m_searchTime] ];
	gs.m_worldSearchTime = str;
	[str release];
	
	if ( gs.m_worldSearchNum != nil ) {
		[gs.m_worldSearchNum release];
	}
	
	str = [[NSString alloc] initWithFormat:@"%@", m_numLabel.text ];
	gs.m_worldSearchNum = str;
	[str release];

	if ( gs.m_worldSearchNear != nil ) {
		[gs.m_worldSearchNear release];
	}
	
	str = [[NSString alloc] initWithFormat:@"%@", m_bestLabel.text ];
	gs.m_worldSearchNear = str;
	[str release];

	if ( gs.m_worldSearchDistance != nil ) {
		[gs.m_worldSearchDistance release];
	}
	
	str = [[NSString alloc] initWithFormat:@"%@", m_goodLabel.text];
	gs.m_worldSearchDistance = str;
	[str release];
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchHistoryPage:true];
	[appli.m_gpsCtrl closeWorldPage];
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
	[appli.m_gpsCtrl closeWorldPage];
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
	[appli.m_gpsCtrl closeWorldPage];
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
	[appli.m_gpsCtrl closeWorldPage];
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
	[appli.m_gpsCtrl closeWorldPage];
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
	[appli.m_gpsCtrl closeWorldPage];
}

@end
