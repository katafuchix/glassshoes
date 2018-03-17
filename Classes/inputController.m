//
//  inputController.m
//  glassshoes
//
//  Created by james Lee on 11/08/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "inputController.h"
#import "glassshoesAppDelegate.h"
#import "glassShoes.h"
#import "myGPSController.h"

@implementation inputController

@synthesize m_inputImg;
@synthesize m_nameInp;
@synthesize m_manBtn;
@synthesize m_womanBtn;
@synthesize m_bkImg;
@synthesize m_starImg;
@synthesize m_star2Img;
@synthesize m_star3Img;
@synthesize m_wakuImg;
@synthesize m_titleImg;
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
	
	[m_inputImg release];
	[m_nameInp release];
	[m_manBtn release];	
	[m_womanBtn release];	
	
	[m_bkImg release];
	[m_starImg release];
	[m_star2Img release];
	[m_star3Img release];
	
	[m_titleImg release];
	[m_wakuImg release];
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(void)setInfo:(BOOL)bSingle num:(NSInteger)num{

	m_bSingle = bSingle;
	m_number = num;
	
	UIImage* img;
	if( m_bSingle ){
		//img = [UIImage imageNamed:@"seibetu_137_94.png"];
		NSString *path= [[NSBundle mainBundle] pathForResource:@"seibetu_137_94" ofType:@"png"];
		img= [[UIImage alloc] initWithContentsOfFile:path];
	}
	else {
		
		NSString* name = [[NSString alloc] initWithFormat:@"no_%d_150_75", (num+1)];
		NSString *path= [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
		img= [[UIImage alloc] initWithContentsOfFile:path];
		[name release];
	}

	UIImageView* v = [[UIImageView alloc] initWithImage:img];
	self.m_titleImg = v;
	[v release];
	
	[img release];
	
	[self.view addSubview:m_titleImg];
	if( m_bSingle ){
		m_titleImg.frame = CGRectMake( 69, 47, 192, 47 );
	}
	else {
		m_titleImg.frame = CGRectMake( 75, 28, 175, 70 );
	}

}

-(IBAction)selBeMan:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [m_nameInp.text length] == 0 ) {

		return;
	}
	
	m_mode = 4;
	
	glassShoes *gs = [glassShoes sharedInstance];
	[gs setName:m_nameInp.text];
	[gs setSex:true single:m_bSingle];

	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showQuizPage:0 single:m_bSingle num:m_number];
	[appli.m_gpsCtrl closeInputPage];
}

-(IBAction)selBeWoman:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [m_nameInp.text length] == 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	glassShoes *gs = [glassShoes sharedInstance];
	[gs setName:m_nameInp.text];
	[gs setSex:false single:m_bSingle];
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showQuizPage:0 single:m_bSingle num:m_number];
	[appli.m_gpsCtrl closeInputPage];
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( !m_bSingle && m_number != 0 && [super isAsked] == false ) {
		
		[super showMoveConfPage:1];
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	[appli.m_gpsCtrl closeInputPage];
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( !m_bSingle && m_number != 0 && [super isAsked] == false ) {
		
		[super showMoveConfPage:2];
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeInputPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( !m_bSingle && m_number != 0 && [super isAsked] == false ) {
		
		[super showMoveConfPage:3];
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeInputPage];
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}

	if ( !m_bSingle && m_number != 0 && [super isAsked] == false ) {
		
		[super showMoveConfPage:4];
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeInputPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( !m_bSingle && m_number != 0 && [super isAsked] == false ) {
		
		[super showMoveConfPage:5];
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeInputPage];
}

- (IBAction)startInpText:(id)sender{
	
	m_inputImg.hidden = YES;
}

- (IBAction)changeTexted:(id)sender{
	
	NSString *a = m_nameInp.text;
	a=[a stringByReplacingOccurrencesOfString:@" " withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"'" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"`" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"_" withString:@""]; 	
	a=[a stringByReplacingOccurrencesOfString:@"*" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"+" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"(" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@")" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"[" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"]" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"{" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"}" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"," withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"^" withString:@""]; 	
	a=[a stringByReplacingOccurrencesOfString:@"、" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"。" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"?" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@"!" withString:@""]; 
    a=[a stringByReplacingOccurrencesOfString:@":" withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"..." withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"$" withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"#" withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"&" withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"=" withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"|" withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"¥" withString:@""]; 	
    a=[a stringByReplacingOccurrencesOfString:@"%" withString:@""]; 	
	m_nameInp.text = a;
	
	if ( [a length] == 0 ) {

		m_inputImg.hidden = NO;
	}
	
	[sender resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	int maxLength = 10;
	NSMutableString *text = [[textField.text mutableCopy] autorelease];
	[text replaceCharactersInRange:range withString:string];
	return [text length] <= maxLength;	
	/*
	BOOL change = NO;

	if( textField == m_nameInp ){
		if( range.location + range.length + [string length]< MAX_NAME_LENGTH ){
			change = YES;
		}
	}
	return change;
	*/ 
}

@end
