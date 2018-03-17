//
//  helpController.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "helpController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "glassShoes.h"

@implementation helpController

@synthesize m_bkImg;
@synthesize m_wakuImg;

@synthesize m_topLayer;
@synthesize m_howLayer;
@synthesize m_jishiLayer;

@synthesize m_topView;
@synthesize m_howView;
@synthesize m_jishiView;
@synthesize m_topSView;
@synthesize m_howSView;
@synthesize m_jishiSView;
@synthesize m_topImg;
@synthesize m_topHelp;
@synthesize m_howImg;
@synthesize m_selfImg;
@synthesize m_selfHelp;
@synthesize m_mutiImg;
@synthesize m_mutiHelp;
@synthesize m_searchImg;
@synthesize m_searchHelp;
@synthesize m_fittingImg;
@synthesize m_fittingHelp;
@synthesize m_jishiImg;
@synthesize m_jishiHelp;

@synthesize m_leftCursor;
@synthesize m_rightCursor;

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
		self.m_topLayer = nil;
		self.m_howLayer = nil;
		self.m_jishiLayer = nil;
		m_inMove = false;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	m_mode = 0;

	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cursor_left" ofType:@"png"]];
	UIImageView* v = [[UIImageView alloc] initWithImage:img];
	self.m_leftCursor = v;
	[v release];
	[img release];
	[[self view] addSubview:m_leftCursor];
	m_leftCursor.frame = CGRectMake( 0, 199, 25, 32 );
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cusor_right" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_rightCursor = v;
	[v release];
	[img release];
	[[self view] addSubview:m_rightCursor];
	m_rightCursor.frame = CGRectMake( 295, 199, 25, 32 );
	
	[self prepareTopHelp:0];

	m_cnt = 0;
	[NSTimer scheduledTimerWithTimeInterval:1.0
									 target:self
								   selector:@selector(startTimeOut:)
								   userInfo:nil
									repeats:NO];
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

	if ( m_showMode != 0 ) {
		
		if ( m_leftCursor.hidden == YES ) {
			m_leftCursor.hidden = NO;
		}
		else {
			m_leftCursor.hidden = YES;
		}
	}
	
	if ( m_showMode != 2 ) {
		
		if ( m_rightCursor.hidden == YES ) {
			m_rightCursor.hidden = NO;
		}
		else {
			m_rightCursor.hidden = YES;
		}
	}

	m_cnt++;
	if ( m_cnt == 10 ) {
		
		if ( m_showMode != 0 ) {
			
			m_leftCursor.hidden = NO;
		}
		else {
			m_leftCursor.hidden = YES;
		}
		
		if ( m_showMode != 2 ) {
			
			m_rightCursor.hidden = NO;
		}
		else {
			m_rightCursor.hidden = YES;
		}
	}
	else{
		
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
	
	[self removeTop];
	[self removeHow];
	[self removeJishi];
	
	[m_leftCursor release];
	[m_rightCursor release];
	
	[m_bkImg release]; 
	[m_wakuImg release];
	
	[m_tabBar release];
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	
    [super dealloc];
}

- (void)removeTop{

	if ( m_topLayer != nil ) {
		[m_topLayer release];
		m_topLayer = nil;

		[m_topSView release];	
		[m_topView release];	
		[m_topImg release];	
		[m_topHelp release];	
	}
}

- (void)removeHow{
	
	if ( m_howLayer != nil ) {
		[m_howLayer release];
		m_howLayer = nil;

		[m_howSView release];	
		[m_howView release];	
		[m_howImg release];	
		[m_selfImg release];	
		[m_selfHelp release];	
		[m_mutiImg release];	
		[m_mutiHelp release];	
		[m_searchImg release];	
		[m_searchHelp release];	
		[m_fittingImg release];	
		[m_fittingHelp release];	
	}
}

- (void)removeJishi{
	
	if ( m_jishiLayer != nil ) {
		[m_jishiLayer release];
		m_jishiLayer = nil;

		[m_jishiSView release];	
		[m_jishiView release];	
		[m_jishiImg release];	
		[m_jishiHelp release];	
	}
}

- (NSInteger)getTextsHeight:(NSString*)str cx:(NSInteger)cx font:(UIFont*)font{
	
	// 最大の表示領域CGSize。このCGSize以上は文字列長がこのサイズを超える場合はすべて表示されない
	CGSize bounds = CGSizeMake(cx, 10000);
	
	// 表示に必要なCGSize
	CGSize size = [str sizeWithFont:font constrainedToSize:bounds lineBreakMode:UILineBreakModeTailTruncation];
	return size.height;
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	[appli.m_gpsCtrl closeHelpPage];
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeHelpPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeHelpPage];
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeHelpPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeHelpPage];
}

// place	-1 = left
//			0 = center
//			1 = right
- (void)prepareTopHelp:(NSInteger)place{

	m_leftCursor.hidden = YES;
	m_rightCursor.hidden = NO;
	
	NSInteger x = 0;
	if( place == -1 )
		x = -320;
	else if( place == 1 )
		x = 320;
	
	CGRect rect = CGRectMake( x, 0, 320, 431 );
	
	if ( m_topLayer != nil ) {

		m_maxY = -137;
		m_topLayer.frame = rect;
		m_showMode = 0;
		return;
	}
	
	UIView* tl = [[UIView alloc] initWithFrame:rect];
	self.m_topLayer = tl;
	[tl release];
	[self.view insertSubview:m_topLayer belowSubview:m_wakuImg];
	[m_topLayer setClipsToBounds:YES];
	
	// top
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setteigamen_67_111" ofType:@"png"]];
	UIImageView* v = [[UIImageView alloc] initWithImage:img];
	self.m_topImg = v;
	[v release];
	[img release];
	[m_topLayer addSubview:m_topImg];
	//m_topImg.frame = CGRectMake( 31, 24, 260, 91 );
	m_topImg.frame = CGRectMake( 56, 24, 208, 73 );

	m_topSView = [[UIView alloc] initWithFrame:CGRectMake(10, 122, 300, 295)];
	[m_topLayer addSubview:m_topSView];
	[m_topSView setClipsToBounds:YES];

	m_topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 295)];
	[m_topSView addSubview:m_topView];
	m_topView.autoresizesSubviews = false;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"monogatari" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_topHelp = v;
	[v release];
	[img release];
	[m_topView addSubview:m_topHelp];
	m_topHelp.frame = CGRectMake( 0, 0, 300, 332 );

	m_maxY = -137;
	
	m_showMode = 0;
}

// place	-1 = left
//			0 = center
//			1 = right
- (void)prepareHowHelp:(NSInteger)place{
	
	m_leftCursor.hidden = NO;
	m_rightCursor.hidden = NO;
	
	NSInteger x = 0;
	if( place == -1 )
		x = -320;
	else if( place == 1 )
		x = 320;
	
	CGRect rect = CGRectMake( x, 0, 320, 431 );
	
	if ( m_howLayer != nil ) {
		
		m_maxY = m_howHeight;
		m_howLayer.frame = rect;
		m_showMode = 1;
		return;
	}
	
	UIView* tl = [[UIView alloc] initWithFrame:rect];
	self.m_howLayer = tl;
	[tl release];
	[self.view insertSubview:m_howLayer belowSubview:m_wakuImg];
	[m_howLayer setClipsToBounds:YES];
	
	// how
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setumei_176_58" ofType:@"png"]];
	UIImageView* v = [[UIImageView alloc] initWithImage:img];
	self.m_howImg = v;
	[v release];
	[img release];
	[m_howLayer addSubview:m_howImg];
	m_howImg.frame = CGRectMake( 88, 29, 145, 45 );
	
	m_howSView = [[UIView alloc] initWithFrame:CGRectMake(10, 122, 300, 295)];
	[m_howLayer addSubview:m_howSView];
	[m_howSView setClipsToBounds:YES];

	m_howView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 295)];
	[m_howSView addSubview:m_howView];
	m_howView.autoresizesSubviews = false;
	
	NSInteger y = 0;
	NSInteger offy = 20;
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setumei_158_226" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_selfImg = v;
	[v release];
	[img release];
	[m_howView addSubview:m_selfImg];
	m_selfImg.frame = CGRectMake( 69, y, 166, 35 );
	y += 35+offy;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jibun" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_selfHelp = v;
	[v release];
	[img release];
	[m_howView addSubview:m_selfHelp];
	m_selfHelp.frame = CGRectMake( 0, y, 300, 226 );
	y += 332+offy;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setumei_154_377" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_mutiImg = v;
	[v release];
	[img release];
	[m_howView addSubview:m_mutiImg];
	m_mutiImg.frame = CGRectMake( 67, y, 169, 35 );
	y += 35+offy;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"minna" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_mutiHelp = v;
	[v release];
	[img release];
	[m_howView addSubview:m_mutiHelp];
	m_mutiHelp.frame = CGRectMake( 0, y, 300, 226 );
	y += 226+offy;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setumei_147_525" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_searchImg = v;
	[v release];
	[img release];
	[m_howView addSubview:m_searchImg];
	m_searchImg.frame = CGRectMake( 64, y, 174, 35 );
	y += 35+offy;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"search" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_searchHelp = v;
	[v release];
	[img release];
	[m_howView addSubview:m_searchHelp];
	m_searchHelp.frame = CGRectMake( 0, y, 300, 461 );
	y += 461+offy;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setumei_152_653" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_fittingImg = v;
	[v release];
	[img release];
	[m_howView addSubview:m_fittingImg];
	m_fittingImg.frame = CGRectMake( 66, y, 172, 38 );
	y += 38+offy;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_fittingHelp = v;
	[v release];
	[img release];
	[m_howView addSubview:m_fittingHelp];
	m_fittingHelp.frame = CGRectMake( 0, y, 300, 205 );
	y += 205;
	
	m_howHeight = 195- y;
	m_maxY = 195- y;
	
	m_showMode = 1;
}

// place	-1 = left
//			0 = center
//			1 = right
- (void)prepareSearchHelp:(NSInteger)place{
	
	m_leftCursor.hidden = NO;
	m_rightCursor.hidden = YES;
	
	NSInteger x = 0;
	if( place == -1 )
		x = -320;
	else if( place == 1 )
		x = 320;
	
	CGRect rect = CGRectMake( x, 0, 320, 431 );
	
	if ( m_jishiLayer != nil ) {
		
		m_maxY = -324;
		m_jishiLayer.frame = rect;
		m_showMode = 2;
		return;
	}
	
	UIView* tl = [[UIView alloc] initWithFrame:rect];
	self.m_jishiLayer = tl;
	[tl release];
	[self.view insertSubview:m_jishiLayer belowSubview:m_wakuImg];
	[m_jishiLayer setClipsToBounds:YES];
	
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"title_situji_219_58" ofType:@"png"]];
	UIImageView* v = [[UIImageView alloc] initWithImage:img];
	self.m_jishiImg = v;
	[v release];
	[img release];
	[m_jishiLayer addSubview:m_jishiImg];
	m_jishiImg.frame = CGRectMake( 110, 29, 98, 46 );
	
	m_jishiSView = [[UIView alloc] initWithFrame:CGRectMake(10, 122, 300, 295)];
	[m_jishiLayer addSubview:m_jishiSView];
	[m_jishiSView setClipsToBounds:YES];

	m_jishiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 295)];
	[m_jishiSView addSubview:m_jishiView];
	m_jishiSView.autoresizesSubviews = false;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"situji" ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_jishiHelp = v;
	[v release];
	[img release];
	[m_jishiView addSubview:m_jishiHelp];
	m_jishiHelp.frame = CGRectMake( 0, 0, 300, 519 );
	
	m_maxY = -324;
	
	
	m_showMode = 2;
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
		if ( abs(m_startPt.x - endPt.x) > abs(m_startPt.y -endPt.y)) {

			// 横スクロール
			//NSLog( @"横スクロール (%d, %d) -> (%d, %d )", m_startPt.x, m_startPt.y, endPt.x, endPt.y );
			if ( abs(m_startPt.x - endPt.x) > 30 ) {

				// prev
				if(m_startPt.x > endPt.x){

					if ( m_showMode < 2 ) {

						m_inMove = true;
						if ( m_showMode == 0 ) {
							
							[self prepareHowHelp:1];
							
							[UIView beginAnimations:nil context:nil];
							[UIView setAnimationDelegate:self];
							[UIView setAnimationDidStopSelector:@selector(moveEnded)];
							[UIView setAnimationDuration:1.0];	// 0.2秒でアニメーション

							m_topLayer.frame = CGRectMake( -320, 0, 320, 431 );
							m_howLayer.frame = CGRectMake( 0, 0, 320, 431 );
							
							[UIView commitAnimations];
						}
						else {
							[self prepareSearchHelp:1];

							[UIView beginAnimations:nil context:nil];
							[UIView setAnimationDelegate:self];
							[UIView setAnimationDidStopSelector:@selector(moveEnded)];
							[UIView setAnimationDuration:1.0];	// 0.2秒でアニメーション
							
							m_howLayer.frame = CGRectMake( -320, 0, 320, 431 );
							m_jishiLayer.frame = CGRectMake( 0, 0, 320, 431 );
							
							[UIView commitAnimations];
						}
					}
				}
				else {
					
					if ( m_showMode > 0 ) {
						
						m_inMove = true;
						if ( m_showMode == 1 ) {
							
							[self prepareTopHelp:-1];
							
							[UIView beginAnimations:nil context:nil];
							[UIView setAnimationDelegate:self];
							[UIView setAnimationDidStopSelector:@selector(moveEnded)];
							[UIView setAnimationDuration:1.0];	// 0.2秒でアニメーション
							
							m_howLayer.frame = CGRectMake( 320, 0, 320, 431 );
							m_topLayer.frame = CGRectMake( 0, 0, 320, 431 );
							
							[UIView commitAnimations];
						}
						else {
							
							[self prepareHowHelp:-1];
							
							[UIView beginAnimations:nil context:nil];
							[UIView setAnimationDelegate:self];
							[UIView setAnimationDidStopSelector:@selector(moveEnded)];
							[UIView setAnimationDuration:1.0];	// 0.2秒でアニメーション
							
							m_jishiLayer.frame = CGRectMake( 320, 0, 320, 431 );
							m_howLayer.frame = CGRectMake( 0, 0, 320, 431 );
							
							[UIView commitAnimations];
						}
					}
				}
			}
		}
		else {
			CGPoint origin;
			
			if( m_showMode == 0 )
				origin = m_topView.frame.origin;
			else if( m_showMode == 1 )
				origin = m_howView.frame.origin;
			else
				origin = m_jishiView.frame.origin;

			// 縦スクロール
			//NSLog( @"縦スクロール (%f, %f) : (%f, %f) -> (%f, %f )", origin.x, origin.y, m_startPt.x, m_startPt.y, endPt.x, endPt.y );
			if ( m_startPt.y> endPt.y ) {

				origin.y -= abs(m_startPt.y- endPt.y);
				if( origin.y < m_maxY )
					origin.y = m_maxY;
				
				if( m_showMode == 0 )
					m_topView.frame = CGRectMake( origin.x, origin.y, 320, 295);
				else if( m_showMode == 1 )
					m_howView.frame = CGRectMake( origin.x, origin.y, 320, 295);
				else
					m_jishiView.frame = CGRectMake( origin.x, origin.y, 320, 295);
			}
			else {
				
				origin.y += abs(m_startPt.y- endPt.y);
				if( origin.y > 0 )
					origin.y = 0;
				
				if( m_showMode == 0 )
					m_topView.frame = CGRectMake( origin.x, origin.y, 320, 295);
				else if( m_showMode == 1 )
					m_howView.frame = CGRectMake( origin.x, origin.y, 320, 295);
				else
					m_jishiView.frame = CGRectMake( origin.x, origin.y, 320, 295);
			}
			
			m_startPt = endPt;
		}
	}		
}

- (void)moveEnded{

	m_inMove = false;
}

@end
