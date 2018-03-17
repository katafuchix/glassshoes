//
//  fittingSelController.m
//  glassshoes
//
//  Created by james Lee on 11/08/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "fittingSelController.h"
#import "glassShoes.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "profile.h"
#import "aboutMutiQues.h"

@implementation fittingSelController

@synthesize m_helpCtrl;
@synthesize m_bkImg;
@synthesize m_manImg;
@synthesize m_womanImg;

@synthesize m_manTableView;
@synthesize m_womanTableView;

@synthesize m_helpBtn;
@synthesize m_fitBtn;
@synthesize m_backBtn;

@synthesize m_tabBar;

@synthesize m_top;
@synthesize m_profile;
@synthesize m_history;
@synthesize m_search;
@synthesize m_setting;
@synthesize m_badgeImg;

@synthesize m_manLists;
@synthesize m_womanLists;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.m_badgeImg = nil;
		self.m_manLists = nil;
		self.m_womanLists = nil;
		self.m_helpCtrl = nil;
		m_mode = 0;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	m_manLists = [[NSMutableArray alloc] init];
	m_womanLists = [[NSMutableArray alloc] init];
	
	glassShoes *gs = [glassShoes sharedInstance];
	for ( int i= 0; i < [gs.m_mutiLists count]; i++ ) {

		profile* p = [gs.m_mutiLists objectAtIndex:i];
		NSString* str = [[NSString alloc] initWithFormat:@"%@&%d", p.m_name, i];
		
		if ( [p isMan]  ) {

			if ( [m_manLists count] == 0 ) {
				m_selMan = i;
			}
			
			[m_manLists addObject:str];
		}
		else {

			if ( [m_womanLists count] == 0 ) {
				m_selWoman = i;
			}
			
			[m_womanLists addObject:str];
		}
	}
	
	[m_manTableView reloadData];
	[m_womanTableView reloadData];
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
	
	[self closeHelpPage];
	
	if ( m_manLists != nil ) {
		
		[m_manLists removeAllObjects];
		[m_manLists release];
		m_manLists = nil;
	}

	if ( m_womanLists != nil ) {
		
		[m_womanLists removeAllObjects];
		[m_womanLists release];
		m_womanLists = nil;
	}
	
	[m_bkImg release];	
	[m_manImg release];
	[m_womanImg release];

	[m_manTableView release];
	[m_womanTableView release];
	
	[m_fitBtn release];
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

-(IBAction)selToFit:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 3;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showMutiFittingPage:m_selMan right:m_selWoman];
	[appli.m_gpsCtrl closeFitSelPage];
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
	[appli.m_gpsCtrl showWastFitPage];
	[appli.m_gpsCtrl closeFitSelPage];
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
	[appli.m_gpsCtrl closeFitSelPage];
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
	[appli.m_gpsCtrl closeFitSelPage];
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
	[appli.m_gpsCtrl closeFitSelPage];
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
	[appli.m_gpsCtrl closeFitSelPage];
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
	[appli.m_gpsCtrl closeFitSelPage];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
    return nil; //ビルド警告回避用
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if ( tableView == m_womanTableView ) {

		return [m_womanLists count];
	}

	return [m_manLists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell* cell;
	
	if ( tableView == m_womanTableView ) {
		
		cell = (UITableViewCell*)[m_womanTableView dequeueReusableCellWithIdentifier:@"Cell"];
	}
	else {
		cell = (UITableViewCell*)[m_manTableView dequeueReusableCellWithIdentifier:@"Cell"];
	}
	
	if ( cell == nil ) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"] autorelease];			
	}

	NSArray *items = nil;
	if ( tableView == m_womanTableView ) {

		items = [[m_womanLists objectAtIndex:indexPath.row] componentsSeparatedByString:@"&"];
	}
	else {

		items = [[m_manLists objectAtIndex:indexPath.row] componentsSeparatedByString:@"&"];
	}

	NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:0]];
	cell.textLabel.text = str;
	cell.textLabel.adjustsFontSizeToFitWidth = true;
	cell.textLabel.minimumFontSize = 4;
	[str release];
	
	cell.accessoryType = UITableViewCellAccessoryNone;

	if ( indexPath.row == 0 ) {

		[tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
	}
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 20.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
	
	NSArray *items = nil;
	if ( tableView == m_womanTableView ) {
		
		items = [[m_womanLists objectAtIndex:indexPath.row] componentsSeparatedByString:@"&"];
		m_selWoman = [[items objectAtIndex:1] intValue];
	}
	else {
		
		items = [[m_manLists objectAtIndex:indexPath.row] componentsSeparatedByString:@"&"];
		m_selMan = [[items objectAtIndex:1] intValue];
	}
}

-(void)showHelpPage{
	
	aboutMutiQues* ctrl = [[aboutMutiQues alloc] initWithNibName:@"aboutMutiQues" bundle:[NSBundle mainBundle]];
	self.m_helpCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_helpCtrl view]];
	[m_helpCtrl setInfo:self left:m_selMan right:m_selWoman from:3];
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
