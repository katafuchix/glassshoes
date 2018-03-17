//
//  nearController.m
//  glassshoes
//
//  Created by james Lee on 11/09/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "nearController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "searchTopController.h"
#import "glassshoes.h"

@implementation nearController

@synthesize m_parent;
@synthesize m_bestLabel;
@synthesize m_goodLabel;
@synthesize m_saveBtn;

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
		m_starImg.alpha = 1.0;
		m_star2Img.alpha = 0;
		m_star3Img.alpha = 0;
		self.m_badgeImg = nil;
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
	
	[m_bestLabel release];	
	[m_goodLabel release];	
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

	/*
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NEAR SEARCH"
													message:data
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	*/
	
	NSArray *items = [data componentsSeparatedByString:@"&"];
	
	m_fitNum = 0;
	m_nearNum = 0;
	
	if ( [items count] == 2 ) {

		m_fitNum = [[items objectAtIndex:0] intValue];
		m_nearNum = [[items objectAtIndex:1] intValue]; 
	}
	
	NSString* str = [[NSString alloc] initWithFormat:@"%d", m_fitNum];
	m_bestLabel.text = str;
	[str release];
	
	str = [[NSString alloc] initWithFormat:@"%d", m_nearNum];
	m_goodLabel.text = str;
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
	
	m_mode = 5;

	//searchTopController* oya = (searchTopController*)m_parent;
	//[oya closeNearPage];
	glassShoes *gs = [glassShoes sharedInstance];
	[gs addSearchHistory:m_fitNum good:m_nearNum];
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchHistoryPage:true];
	[appli.m_gpsCtrl closeNearPage];
	
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
	[appli.m_gpsCtrl closeNearPage];
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
	[appli.m_gpsCtrl closeNearPage];
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
	[appli.m_gpsCtrl closeNearPage];
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
	[appli.m_gpsCtrl closeNearPage];
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
	[appli.m_gpsCtrl closeNearPage];
}


@end
