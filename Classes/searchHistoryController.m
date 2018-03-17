//
//  searchHistoryController.m
//  glassshoes
//
//  Created by james Lee on 11/09/21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "searchHistoryController.h"
#import "glassShoes.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"

@implementation searchHistoryController

@synthesize m_tableView;
@synthesize m_endBtn;
@synthesize m_editBtn;

@synthesize m_bkImg;
@synthesize m_line1Img;
@synthesize m_line2Img;
@synthesize m_cover;

@synthesize m_time;
@synthesize m_worldNum;
@synthesize m_distance;
@synthesize m_near;

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
		m_mode = 0;
		m_inMove = false;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	m_endBtn.hidden = YES;
	m_editBtn.hidden = NO;
	
	NSInteger count = 0;
	glassShoes *gs = [glassShoes sharedInstance];
	if ( gs.m_searchLists != nil ) {
		count = [gs.m_searchLists count];
	}
	
	if ( count < 1 ) {
		m_line1Img.hidden = YES;
	}
	
	if ( count < 2 ) {
		m_line2Img.hidden = YES;
	}
	
	[m_tableView reloadData];
	
	if ( gs.m_worldSearchTime != nil ) {
		NSString* str = [[NSString alloc] initWithFormat:@"%@", gs.m_worldSearchTime];
		self.m_time.text = str;
		[str release];
	}
	else {
		self.m_time.text = @"";
	}

	if ( gs.m_worldSearchNum != nil ) {
		NSString* str = [[NSString alloc] initWithFormat:@"%@人", gs.m_worldSearchNum];
		self.m_worldNum.text = str;
		[str release];
	}
	else {
		self.m_worldNum.text = @"0人";
	}
	
	if ( gs.m_worldSearchNear != nil ) {
		NSString* str = [[NSString alloc] initWithFormat:@"%@", gs.m_worldSearchNear];
		self.m_near.text = str;
		[str release];
	}
	else {
		self.m_near.text = @"";
	}
	
	if ( gs.m_worldSearchDistance != nil ) {
		NSString* str = [[NSString alloc] initWithFormat:@"%@", gs.m_worldSearchDistance];
		self.m_distance.text = str;
		[str release];
	}
	else {
		self.m_distance.text = @"";
	}
	
	//glassShoes *gs = [glassShoes sharedInstance];
	[gs clearBadge];
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
	
	[m_tableView release];
	[m_endBtn release];
	[m_editBtn release];
	
	[m_time release];
	[m_worldNum release];	
	[m_distance release];	
	[m_near release];
	
	[m_bkImg release];	
	[m_line1Img release];
	[m_line2Img release];
	[m_cover release];
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(IBAction)selToEdit:(id)sender{
	
	m_cover.hidden = YES;
	m_endBtn.hidden = NO;
	m_editBtn.hidden = YES;
	[m_tableView setEditing:true animated:YES];
}

-(IBAction)selToEnd:(id)sender{
	
	m_cover.hidden = NO;
	m_endBtn.hidden = YES;
	m_editBtn.hidden = NO;
	[m_tableView setEditing:false animated:YES];
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	[appli.m_gpsCtrl closeSearchHistoryPage];
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeSearchHistoryPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeSearchHistoryPage];
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeSearchHistoryPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeSearchHistoryPage];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
    return nil; //ビルド警告回避用
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	glassShoes *gs = [glassShoes sharedInstance];
	if ( gs.m_searchLists == nil ) {
		return 0;
	}
	
	return [gs.m_searchLists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	glassShoes *gs = [glassShoes sharedInstance];
	UITableViewCell* cell;
	
	cell = (UITableViewCell*)[m_tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	if ( cell == nil ) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"] autorelease];			
	}
	
	NSArray *items = [[gs.m_searchLists objectAtIndex:indexPath.row] componentsSeparatedByString:@"&"];
	
	NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:0]];
	cell.textLabel.text = str;
	cell.textLabel.adjustsFontSizeToFitWidth = true;
	[str release];
	
	str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:1]];
	cell.detailTextLabel.text = str;
	[str release];
	
	cell.accessoryType = UITableViewCellAccessoryNone;
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除をします。
}

// commitEditingStyleはEdit呼ばれた時に削除モードになるように呼ばれるメソッドっぽい？
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if(editingStyle == UITableViewCellEditingStyleDelete){
		
		glassShoes *gs = [glassShoes sharedInstance];
		[gs delSearchHistory:indexPath.row];
		
		NSInteger count = 0;
		if ( gs.m_searchLists != nil ) {
			count = [gs.m_searchLists count];
		}
		
		if ( count < 1 ) {
			m_line1Img.hidden = YES;
		}
		
		if ( count < 2 ) {
			m_line2Img.hidden = YES;
		}
		
		[m_tableView reloadData];
	}
}

- (NSInteger)getTextsHeight:(NSString*)str cx:(NSInteger)cx font:(UIFont*)font{
	
	// 最大の表示領域CGSize。このCGSize以上は文字列長がこのサイズを超える場合はすべて表示されない
	CGSize bounds = CGSizeMake(cx, 10000);
	
	// 表示に必要なCGSize
	CGSize size = [str sizeWithFont:font constrainedToSize:bounds lineBreakMode:UILineBreakModeTailTruncation];
	
	return size.height;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if( m_inMove )
		return;
	
    // Enumerates through all touch object
    for (UITouch *touch in touches){
		
		m_startPt = [touch locationInView:[self view]];
	}		
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if( m_inMove )
		return;
	
    // Enumerates through all touch object
    for (UITouch *touch in touches){
		
		CGPoint endPt = [touch locationInView:[self view]];
		// 横スクロール
		if ( abs(m_startPt.x - endPt.x) > 30 ) {
			
			// prev
			if(m_startPt.x < endPt.x){
				
				m_inMove = true;
				glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
				[appli.m_gpsCtrl showFitHistoryPage:false];
				
				[UIView beginAnimations:nil context:nil];
				[UIView setAnimationDelegate:self];
				[UIView setAnimationDidStopSelector:@selector(moveEnded)];
				[UIView setAnimationDuration:1.5];	// 0.2秒でアニメーション
				
				[appli.m_gpsCtrl moveFitHistoryPage:1];
				[appli.m_gpsCtrl moveSearchHistoryPage:0];
				
				[UIView commitAnimations];
			}
			
			m_startPt = endPt;
		}
	}		
}

- (void)moveEnded{
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl closeSearchHistoryPage];
	m_inMove = false;
}

@end
