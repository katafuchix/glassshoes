//
//  fitSelController.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "fitSelController.h"
#import "glassshoesAppDelegate.h"
#import "glassShoes.h"
#import "typeCell.h"
#import "typeCellController.h"
#import "myGPSController.h"

@implementation fitSelController

@synthesize m_tableView;

@synthesize m_bkImg;

@synthesize m_endBtn;
@synthesize m_editBtn;
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
	
	[m_tableView release];
	
	[m_endBtn release];
	[m_editBtn release];
	[m_backBtn release];
	
	[m_bkImg release];	
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(void)setInfo:(BOOL)fromFit{

	m_mode = 0;
	m_bFromFit = fromFit;
	m_endBtn.hidden = YES;
	m_editBtn.hidden = NO;
	[m_tableView reloadData];
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


-(IBAction)selToEdit:(id)sender{
	
	m_endBtn.hidden = NO;
	m_editBtn.hidden = YES;
	[m_tableView setEditing:true animated:YES];
}

-(IBAction)selToEnd:(id)sender{
	
	m_endBtn.hidden = YES;
	m_editBtn.hidden = NO;
	[m_tableView setEditing:false animated:YES];
}

-(IBAction)selToBack:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	
	if ( m_bFromFit ) {
		
		[appli.m_gpsCtrl showFitTopPage];
	}
	else {
		
		[appli.m_gpsCtrl showProfileTopPage];
	}

	
	[appli.m_gpsCtrl closeFitSelPage];
}

-(IBAction)selToTop:(id)sender{

	if ( m_mode != 0 ) {
		
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
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeFitSelPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
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
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeFitSelPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
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
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	if ( gs.m_friendLists == nil ) {
		return 0;
	}

	return [gs.m_friendLists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	typeCell* cell = (typeCell*)[m_tableView dequeueReusableCellWithIdentifier:@"typeCell"];
	
	if ( cell == nil ) {
		
		typeCellController* vc = [[typeCellController alloc] initWithNibName:@"typeCell" bundle:[NSBundle mainBundle]];
		cell = (typeCell*)vc.view;
		[vc release];

		[cell setInfo:indexPath.row];
	}
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 70.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除をします。
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfilePage:(indexPath.row+1) from:m_bFromFit];
	[appli.m_gpsCtrl closeFitSelPage];
}

// commitEditingStyleはEdit呼ばれた時に削除モードになるように呼ばれるメソッドっぽい？
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if(editingStyle == UITableViewCellEditingStyleDelete){
		
		glassShoes *gs = [glassShoes sharedInstance];
		[gs delFriendProfile:indexPath.row];
		
		[m_tableView reloadData];
		/*
		glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
		[appli closeFitSelPage];
		[appli showFitSelPage:m_bFromFit];
		*/ 
	}
}

@end
