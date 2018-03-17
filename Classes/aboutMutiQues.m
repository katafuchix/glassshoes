//
//  aboutMutiQues.m
//  glassshoes
//
//  Created by james Lee on 11/09/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "aboutMutiQues.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "chkResultController.h"
#import "glassShoes.h"
#import "profile.h"
#import "question.h"
#import "bestResultController.h"
#import "wastResultController.h"
#import "fittingSelController.h"
#import "fitResultController.h"

@implementation aboutMutiQues

@synthesize m_parent;
@synthesize m_bkImg;
@synthesize m_titleImg;
@synthesize m_paperImg;
@synthesize m_layer1;
@synthesize m_view1;
@synthesize m_layer2;
@synthesize m_view2;
@synthesize m_layer3;
@synthesize m_view3;

@synthesize m_q1Img;
@synthesize m_ques1L;
@synthesize m_about1Img;
@synthesize m_about1L;
@synthesize m_answer1Img;
@synthesize m_nameA1L;
@synthesize m_anwerA1L;
@synthesize m_infoA1L;
@synthesize m_nameB1L;
@synthesize m_anwerB1L;
@synthesize m_infoB1L;
@synthesize m_nameC1L;
@synthesize m_anwerC1L;
@synthesize m_infoC1L;
@synthesize m_nameD1L;
@synthesize m_anwerD1L;
@synthesize m_infoD1L;
@synthesize m_q2Img;
@synthesize m_ques2L;
@synthesize m_about2Img;
@synthesize m_about2L;
@synthesize m_answer2Img;
@synthesize m_nameA2L;
@synthesize m_anwerA2L;
@synthesize m_infoA2L;
@synthesize m_nameB2L;
@synthesize m_anwerB2L;
@synthesize m_infoB2L;
@synthesize m_nameC2L;
@synthesize m_anwerC2L;
@synthesize m_infoC2L;
@synthesize m_nameD2L;
@synthesize m_anwerD2L;
@synthesize m_infoD2L;
@synthesize m_q3Img;
@synthesize m_ques3L;
@synthesize m_about3Img;
@synthesize m_about3L;
@synthesize m_answer3Img;
@synthesize m_nameA3L;
@synthesize m_anwerA3L;
@synthesize m_infoA3L;
@synthesize m_nameB3L;
@synthesize m_anwerB3L;
@synthesize m_infoB3L;
@synthesize m_nameC3L;
@synthesize m_anwerC3L;
@synthesize m_infoC3L;
@synthesize m_nameD3L;
@synthesize m_anwerD3L;
@synthesize m_infoD3L;

@synthesize m_leftCursor;
@synthesize m_rightCursor;
@synthesize m_downCursor;

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
	
	[self removeView1];
	[self removeView2];
	[self removeView3];
	
	[m_backBtn release];
	
	[m_bkImg release]; 
	[m_titleImg release]; 
	[m_paperImg release]; 
	
	[m_leftCursor release];	
	[m_rightCursor release];	
	[m_downCursor release];
	
	[m_tabBar release];
	[m_top release];
	[m_profile release];
	[m_search release];
	[m_history release];
	[m_setting release];
	
    [super dealloc];
}

-(void)removeView1{
	
	if ( m_q1Img != nil ) {
		
		[m_q1Img release];
		m_q1Img = nil;
	}
	
	if ( m_ques1L != nil ) {
		
		[m_ques1L release];
		m_ques1L = nil;
	}
	
	if ( m_about1Img != nil ) {
		
		[m_about1Img release];
		m_about1Img = nil;
	}
	
	if ( m_about1L != nil ) {
		
		[m_about1L release];
		m_about1L = nil;
	}
	
	if ( m_answer1Img != nil ) {
		
		[m_answer1Img release];
		m_answer1Img = nil;
	}
	
	if ( m_nameA1L != nil ) {
		
		[m_nameA1L release];
		m_nameA1L = nil;
	}
	
	if ( m_anwerA1L != nil ) {
		
		[m_anwerA1L release];
		m_anwerA1L = nil;
	}
	
	if ( m_infoA1L != nil ) {
		
		[m_infoA1L release];
		m_infoA1L = nil;
	}
	
	if ( m_nameB1L != nil ) {
		
		[m_nameB1L release];
		m_nameB1L = nil;
	}
	
	if ( m_anwerB1L != nil ) {
		
		[m_anwerB1L release];
		m_anwerB1L = nil;
	}
	
	if ( m_infoB1L != nil ) {
		
		[m_infoB1L release];
		m_infoB1L = nil;
	}
	
	if ( m_nameC1L != nil ) {
		
		[m_nameC1L release];
		m_nameC1L = nil;
	}
	
	if ( m_anwerC1L != nil ) {
		
		[m_anwerC1L release];
		m_anwerC1L = nil;
	}
	
	if ( m_infoC1L != nil ) {
		
		[m_infoC1L release];
		m_infoC1L = nil;
	}
	
	if ( m_nameD1L != nil ) {
		
		[m_nameD1L release];
		m_nameD1L = nil;
	}
	
	if ( m_anwerD1L != nil ) {
		
		[m_anwerD1L release];
		m_anwerD1L = nil;
	}
	
	if ( m_infoD1L != nil ) {
		
		[m_infoD1L release];
		m_infoD1L = nil;
	}
	
	if ( m_layer1 != nil ) {
		
		[m_layer1 release];
		m_layer1 = nil;
	}
	
	if ( m_view1 != nil ) {
		
		[m_view1 release];
		m_view1 = nil;
	}
}

-(void)removeView2{
	
	if ( m_q2Img != nil ) {
		
		[m_q2Img release];
		m_q2Img = nil;
	}
	
	if ( m_ques2L != nil ) {
		
		[m_ques2L release];
		m_ques2L = nil;
	}
	
	if ( m_about2Img != nil ) {
		
		[m_about2Img release];
		m_about2Img = nil;
	}
	
	if ( m_about2L != nil ) {
		
		[m_about2L release];
		m_about2L = nil;
	}
	
	if ( m_answer2Img != nil ) {
		
		[m_answer2Img release];
		m_answer2Img = nil;
	}
	
	if ( m_nameA2L != nil ) {
		
		[m_nameA2L release];
		m_nameA2L = nil;
	}
	
	if ( m_anwerA2L != nil ) {
		
		[m_anwerA2L release];
		m_anwerA2L = nil;
	}
	
	if ( m_infoA2L != nil ) {
		
		[m_infoA2L release];
		m_infoA2L = nil;
	}
	
	if ( m_nameB2L != nil ) {
		
		[m_nameB2L release];
		m_nameB2L = nil;
	}
	
	if ( m_anwerB2L != nil ) {
		
		[m_anwerB2L release];
		m_anwerB2L = nil;
	}
	
	if ( m_infoB2L != nil ) {
		
		[m_infoB2L release];
		m_infoB2L = nil;
	}
	
	if ( m_nameC2L != nil ) {
		
		[m_nameC2L release];
		m_nameC2L = nil;
	}
	
	if ( m_anwerC2L != nil ) {
		
		[m_anwerC2L release];
		m_anwerC2L = nil;
	}
	
	if ( m_infoC2L != nil ) {
		
		[m_infoC2L release];
		m_infoC2L = nil;
	}
	
	if ( m_nameD2L != nil ) {
		
		[m_nameD2L release];
		m_nameD2L = nil;
	}
	
	if ( m_anwerD2L != nil ) {
		
		[m_anwerD2L release];
		m_anwerD2L = nil;
	}
	
	if ( m_infoD2L != nil ) {
		
		[m_infoD2L release];
		m_infoD2L = nil;
	}
	
	if ( m_layer2 != nil ) {
		
		[m_layer2 release];
		m_layer2 = nil;
	}
	
	if ( m_view2 != nil ) {
		
		[m_view2 release];
		m_view2 = nil;
	}
}

-(void)removeView3{
	
	if ( m_q3Img != nil ) {
		
		[m_q3Img release];
		m_q3Img = nil;
	}
	
	if ( m_ques3L != nil ) {
		
		[m_ques3L release];
		m_ques3L = nil;
	}
	
	if ( m_about3Img != nil ) {
		
		[m_about3Img release];
		m_about3Img = nil;
	}
	
	if ( m_about3L != nil ) {
		
		[m_about3L release];
		m_about3L = nil;
	}
	
	if ( m_answer3Img != nil ) {
		
		[m_answer3Img release];
		m_answer3Img = nil;
	}
	
	if ( m_nameA3L != nil ) {
		
		[m_nameA3L release];
		m_nameA3L = nil;
	}
	
	if ( m_anwerA3L != nil ) {
		
		[m_anwerA3L release];
		m_anwerA3L = nil;
	}
	
	if ( m_infoA3L != nil ) {
		
		[m_infoA3L release];
		m_infoA3L = nil;
	}
	
	if ( m_nameB3L != nil ) {
		
		[m_nameB3L release];
		m_nameB3L = nil;
	}
	
	if ( m_anwerB3L != nil ) {
		
		[m_anwerB3L release];
		m_anwerB3L = nil;
	}
	
	if ( m_infoB3L != nil ) {
		
		[m_infoB3L release];
		m_infoB3L = nil;
	}
	
	if ( m_nameC3L != nil ) {
		
		[m_nameC3L release];
		m_nameC3L = nil;
	}
	
	if ( m_anwerC3L != nil ) {
		
		[m_anwerC3L release];
		m_anwerC3L = nil;
	}
	
	if ( m_infoC3L != nil ) {
		
		[m_infoC3L release];
		m_infoC3L = nil;
	}
	
	if ( m_nameD3L != nil ) {
		
		[m_nameD3L release];
		m_nameD3L = nil;
	}
	
	if ( m_anwerD3L != nil ) {
		
		[m_anwerD3L release];
		m_anwerD3L = nil;
	}
	
	if ( m_infoD3L != nil ) {
		
		[m_infoD3L release];
		m_infoD3L = nil;
	}
	
	if ( m_layer3 != nil ) {
		
		[m_layer3 release];
		m_layer3 = nil;
	}
	
	if ( m_view3 != nil ) {
		
		[m_view3 release];
		m_view3 = nil;
	}
}

// from = 1-12	best
//        13-24 wast
//        25	sel
//		  26	result
-(void)setInfo:(id)oya left:(NSInteger)leftNo right:(NSInteger)rightNo from:(NSInteger)from{
	
	m_parent = oya;
	m_profileNo = leftNo;
	m_from = from;
	
	[self showQues:2 place:1 viewNo:2];
	[self showQues:1 place:0 viewNo:1];
	m_maxY = m_page_maxY[0];
	m_curQues = 1;
	m_curView = 1;
	m_leftCursor.hidden = YES;
	m_rightCursor.hidden = NO;
	m_downCursor.hidden = NO;
	[[self view] bringSubviewToFront:m_leftCursor];
	[[self view] bringSubviewToFront:m_rightCursor];
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
	
	CGPoint origin;
	
	if( m_curView == 1 )
		origin = m_layer1.frame.origin;
	else if( m_curView == 2 )
		origin = m_layer2.frame.origin;
	else
		origin = m_layer3.frame.origin;
	
	if( origin.y > m_maxY ){
		
		if ( m_downCursor.hidden == YES ) {
			m_downCursor.hidden = NO;
		}
		else {
			m_downCursor.hidden = YES;
		}
	}
	
	if ( m_curQues != 1 ) {
		
		if ( m_leftCursor.hidden == YES ) {
			m_leftCursor.hidden = NO;
		}
		else {
			m_leftCursor.hidden = YES;
		}
	}
	
	if ( m_curQues != 5 ) {
		
		if ( m_rightCursor.hidden == YES ) {
			m_rightCursor.hidden = NO;
		}
		else {
			m_rightCursor.hidden = YES;
		}
	}
	
	m_cnt++;
	if ( m_cnt == 10 ) {
		
		if ( m_curQues != 1 ) {
			
			m_leftCursor.hidden = NO;
		}
		else {
			m_leftCursor.hidden = YES;
		}
		
		if ( m_curQues != 5 ) {
			
			m_rightCursor.hidden = NO;
		}
		else {
			m_rightCursor.hidden = YES;
		}

		if( origin.y > m_maxY ){
			
			m_downCursor.hidden = NO;
		}
		else {
			m_downCursor.hidden = YES;
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

- (void)showQues:(NSInteger)qNo place:(NSInteger)place viewNo:(NSInteger)viewNo{
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	NSInteger x = 0;
	if( place == -1 )
		x = -320;
	else if( place == 1 )
		x = 320;
	
	CGRect rect = CGRectMake( x, 70, 320, 320 );
	
	NSInteger max_cx = 285;
	
	// 文字列描画に使用するフォント
	UIFont *font = [UIFont fontWithName:@"Helvetica" size:17];
	UIFont *bigFont = [UIFont fontWithName:@"Helvetica-Bold" size:17];
	
	NSInteger one_h = [self getTextsHeight:@"あ" cx:max_cx font:font];
	NSInteger bigOne_h = [self getTextsHeight:@"あ" cx:max_cx font:bigFont];
	
	NSInteger y = 0;
	
	UIView* tl = [[UIView alloc] initWithFrame:rect];
	
	if ( viewNo == 1 ) {
		
		self.m_view1 = tl;
		[self.view addSubview:m_view1];
		[m_view1 setClipsToBounds:YES];
		
		m_layer1 = [[UIView alloc] initWithFrame:CGRectMake(25, 0, max_cx, 320)];
		[m_view1 addSubview:m_layer1];
		m_layer1.autoresizesSubviews = false;
	}
	else if ( viewNo == 2 ) {
		
		self.m_view2 = tl;
		[self.view addSubview:m_view2];
		[m_view2 setClipsToBounds:YES];
		
		m_layer2 = [[UIView alloc] initWithFrame:CGRectMake(25, 0, max_cx, 320)];
		[m_view2 addSubview:m_layer2];
		m_layer2.autoresizesSubviews = false;
	}
	else{
		
		self.m_view3 = tl;
		[self.view addSubview:m_view3];
		[m_view3 setClipsToBounds:YES];
		
		m_layer3 = [[UIView alloc] initWithFrame:CGRectMake(25, 0, max_cx, 320)];
		[m_view3 addSubview:m_layer3];
		m_layer3.autoresizesSubviews = false;
	}
	
	[tl release];
	
	// Q
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Q" ofType:@"png"]];
	UIImageView* qImg = [[UIImageView alloc] initWithImage:img];
	qImg.frame = CGRectMake( 0, y, 18, 20 );
	if ( viewNo == 1 ) {
		
		self.m_q1Img = qImg;
		[m_layer1 addSubview:m_q1Img];
	}
	else if ( viewNo == 2 ) {
		
		self.m_q2Img = qImg;
		[m_layer2 addSubview:m_q2Img];
	}
	else{
		
		self.m_q3Img = qImg;
		[m_layer3 addSubview:m_q3Img];
	}
	[qImg release];
	[img release];
	y+= 20;
	
	// ques
	NSString* str = [self getMutiQuestion:qNo place:0];
	NSInteger h = [self getTextsHeight:str cx:max_cx font:bigFont];
	CGRect strRect = CGRectMake( 0, y, max_cx, h);
	UILabel* label = [[UILabel alloc] initWithFrame:strRect];		
	label.text = str;
	label.font = bigFont;
	label.backgroundColor = [UIColor clearColor];
	label.numberOfLines = h/bigOne_h;
	if ( viewNo == 1 ) {
		
		self.m_ques1L = label;
		[m_layer1 addSubview:m_ques1L];
	}
	else if ( viewNo == 2 ) {
		
		self.m_ques2L = label;
		[m_layer2 addSubview:m_ques2L];
	}
	else{
		
		self.m_ques3L = label;
		[m_layer3 addSubview:m_ques3L];
	}
	[label release];
	y+= h+20;
	
	// about img
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"answer" ofType:@"png"]];
	qImg = [[UIImageView alloc] initWithImage:img];
	qImg.frame = CGRectMake( 0, y, 38, 20 );
	if ( viewNo == 1 ) {
		
		self.m_about1Img = qImg;
		[m_layer1 addSubview:m_about1Img];
	}
	else if ( viewNo == 2 ) {
		
		self.m_about2Img = qImg;
		[m_layer2 addSubview:m_about2Img];
	}
	else{
		
		self.m_about3Img = qImg;
		[m_layer3 addSubview:m_about3Img];
	}
	[qImg release];
	[img release];
	y+= 20;
	
	// about ques
	str = [self getMutiQuestion:qNo place:5];
	h = [self getTextsHeight:str cx:max_cx font:font];
	strRect = CGRectMake( 0, y, max_cx, h);
	label = [[UILabel alloc] initWithFrame:strRect];		
	label.text = str;
	label.backgroundColor = [UIColor clearColor];
	label.font = font;
	label.numberOfLines = h/one_h;
	if ( viewNo == 1 ) {
		
		self.m_about1L = label;
		[m_layer1 addSubview:m_about1L];
	}
	else if ( viewNo == 2 ) {
		
		self.m_about2L = label;
		[m_layer2 addSubview:m_about2L];
	}
	else{
		
		self.m_about3L = label;
		[m_layer3 addSubview:m_about3L];
	}
	[label release];
	y+= h+20;
	
	// answer img
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"manswer" ofType:@"png"]];
	qImg = [[UIImageView alloc] initWithImage:img];
	qImg.frame = CGRectMake( 0, y, 88, 18 );
	if ( viewNo == 1 ) {
		
		self.m_answer1Img = qImg;
		[m_layer1 addSubview:m_answer1Img];
	}
	else if ( viewNo == 2 ) {
		
		self.m_answer2Img = qImg;
		[m_layer2 addSubview:m_answer2Img];
	}
	else{
		
		self.m_answer3Img = qImg;
		[m_layer3 addSubview:m_answer3Img];
	}
	[qImg release];
	[img release];
	y+= 18;

	NSString* f1 = nil;
	NSString* f2 = nil;
	NSString* f3 = nil;
	NSString* f4 = nil;
	
	for( int j= 0; j< [gs.m_mutiLists count]; j++ ){
		
		profile* ap = [gs.m_mutiLists objectAtIndex:j];
		question* aq= [ap.m_quesLists objectAtIndex:(qNo-1)];
		
		NSInteger nA = [aq getSelAnswer];
		
		if ( nA == 1 ) {
			
			if ( f1 == nil ) {
				
				f1 = [[[NSString alloc] initWithFormat:@"%@さん", ap.m_name ] autorelease];
			}
			else {
				f1 = [[[NSString alloc] initWithFormat:@"%@・%@さん", f1, ap.m_name ] autorelease];
			}
		}
		else if ( nA == 2 ) {
			
			if ( f2 == nil ) {
				
				f2 = [[[NSString alloc] initWithFormat:@"%@さん", ap.m_name ] autorelease];
			}
			else {
				f2 = [[[NSString alloc] initWithFormat:@"%@・%@さん", f2, ap.m_name ] autorelease];
			}
		}
		else if ( nA == 3 ) {
			
			if ( f3 == nil ) {
				
				f3 = [[[NSString alloc] initWithFormat:@"%@さん", ap.m_name ] autorelease];
			}
			else {
				f3 = [[[NSString alloc] initWithFormat:@"%@・%@さん", f3, ap.m_name ] autorelease];
			}
		}
		else{
			
			if ( f4 == nil ) {
				
				f4 = [[[NSString alloc] initWithFormat:@"%@さん", ap.m_name ] autorelease];
			}
			else {
				f4 = [[[NSString alloc] initWithFormat:@"%@・%@さん", f4, ap.m_name ] autorelease];
			}
		}
	}

	for ( int k = 0; k< 4; k++) {
		
		if ( k == 0 ){
			
			if(  f1 == nil ) {
				continue;
			}
			
			str = f1;
		}
		
		else if ( k == 1 ){
			
			if(  f2 == nil ) {
				continue;
			}
			
			str = f2;
		}
		
		else if ( k == 2 ){
			
			if(  f3 == nil ) {
				continue;
			}
			
			str = f3;
		}
		
		else {
			
			if(  f4 == nil ) {
				continue;
			}
			
			str = f4;
		}
		
		// about ques
		h = [self getTextsHeight:str cx:max_cx font:bigFont];
		strRect = CGRectMake( 0, y, max_cx, h);
		label = [[UILabel alloc] initWithFrame:strRect];		
		label.text = str;
		label.backgroundColor = [UIColor clearColor];
		label.font = bigFont;
		label.numberOfLines = h/bigOne_h;
		if ( viewNo == 1 ) {

			if ( k == 0 ) {
				self.m_nameA1L = label;
				[m_layer1 addSubview:m_nameA1L];
			}
			else if ( k == 1 ) {
				self.m_nameB1L = label;
				[m_layer1 addSubview:m_nameB1L];
			}
			else if ( k == 2 ) {
				self.m_nameC1L = label;
				[m_layer1 addSubview:m_nameC1L];
			}
			else{
				self.m_nameD1L = label;
				[m_layer1 addSubview:m_nameD1L];
			}
		}
		else if ( viewNo == 2 ) {
			
			if ( k == 0 ) {
				self.m_nameA2L = label;
				[m_layer2 addSubview:m_nameA2L];
			}
			else if ( k == 1 ) {
				self.m_nameB2L = label;
				[m_layer2 addSubview:m_nameB2L];
			}
			else if ( k == 2 ) {
				self.m_nameC2L = label;
				[m_layer2 addSubview:m_nameC2L];
			}
			else{
				self.m_nameD2L = label;
				[m_layer2 addSubview:m_nameD2L];
			}
		}
		else{
			
			if ( k == 0 ) {
				self.m_nameA3L = label;
				[m_layer3 addSubview:m_nameA3L];
			}
			else if ( k == 1 ) {
				self.m_nameB3L = label;
				[m_layer3 addSubview:m_nameB3L];
			}
			else if ( k == 2 ) {
				self.m_nameC3L = label;
				[m_layer3 addSubview:m_nameC3L];
			}
			else{
				self.m_nameD3L = label;
				[m_layer3 addSubview:m_nameD3L];
			}
		}
		[label release];
		y+= h+2;

		str = [[NSString alloc] initWithFormat:@"「%@」", [self getMutiQuestion:qNo place:k+1]];
		h = [self getTextsHeight:str cx:max_cx font:bigFont];
		strRect = CGRectMake( 0, y, max_cx, h);
		label = [[UILabel alloc] initWithFrame:strRect];		
		label.text = str;
		label.backgroundColor = [UIColor clearColor];
		label.font = bigFont;
		label.numberOfLines = h/bigOne_h;
		if ( viewNo == 1 ) {
			
			if ( k == 0 ) {
				self.m_anwerA1L = label;
				[m_layer1 addSubview:m_anwerA1L];
			}
			else if ( k == 1 ) {
				self.m_anwerB1L = label;
				[m_layer1 addSubview:m_anwerB1L];
			}
			else if ( k == 2 ) {
				self.m_anwerC1L = label;
				[m_layer1 addSubview:m_anwerC1L];
			}
			else{
				self.m_anwerD1L = label;
				[m_layer1 addSubview:m_anwerD1L];
			}
		}
		else if ( viewNo == 2 ) {
			
			if ( k == 0 ) {
				self.m_anwerA2L = label;
				[m_layer2 addSubview:m_anwerA2L];
			}
			else if ( k == 1 ) {
				self.m_anwerB2L = label;
				[m_layer2 addSubview:m_anwerB2L];
			}
			else if ( k == 2 ) {
				self.m_anwerC2L = label;
				[m_layer2 addSubview:m_anwerC2L];
			}
			else{
				self.m_anwerD2L = label;
				[m_layer2 addSubview:m_anwerD2L];
			}
		}
		else{
			
			if ( k == 0 ) {
				self.m_anwerA3L = label;
				[m_layer3 addSubview:m_anwerA3L];
			}
			else if ( k == 1 ) {
				self.m_anwerB3L = label;
				[m_layer3 addSubview:m_anwerB3L];
			}
			else if ( k == 2 ) {
				self.m_anwerC3L = label;
				[m_layer3 addSubview:m_anwerC3L];
			}
			else{
				self.m_anwerD3L = label;
				[m_layer3 addSubview:m_anwerD3L];
			}
		}
		[label release];
		[str release];
		y+= h;
		
		str = [self getMutiQuestion:qNo place:(6+k)];
		h = [self getTextsHeight:str cx:max_cx font:font];
		strRect = CGRectMake( 0, y, max_cx, h);
		label = [[UILabel alloc] initWithFrame:strRect];		
		label.text = str;
		label.backgroundColor = [UIColor clearColor];
		label.font = font;
		label.numberOfLines = h/one_h;
		if ( viewNo == 1 ) {
			
			if ( k == 0 ) {
				self.m_infoA1L = label;
				[m_layer1 addSubview:m_infoA1L];
			}
			else if ( k == 1 ) {
				self.m_infoB1L = label;
				[m_layer1 addSubview:m_infoB1L];
			}
			else if ( k == 2 ) {
				self.m_infoC1L = label;
				[m_layer1 addSubview:m_infoC1L];
			}
			else{
				self.m_infoD1L = label;
				[m_layer1 addSubview:m_infoD1L];
			}
		}
		else if ( viewNo == 2 ) {
			
			if ( k == 0 ) {
				self.m_infoA2L = label;
				[m_layer2 addSubview:m_infoA2L];
			}
			else if ( k == 1 ) {
				self.m_infoB2L = label;
				[m_layer2 addSubview:m_infoB2L];
			}
			else if ( k == 2 ) {
				self.m_infoC2L = label;
				[m_layer2 addSubview:m_infoC2L];
			}
			else{
				self.m_infoD2L = label;
				[m_layer2 addSubview:m_infoD2L];
			}
		}
		else{
			
			if ( k == 0 ) {
				self.m_infoA3L = label;
				[m_layer3 addSubview:m_infoA3L];
			}
			else if ( k == 1 ) {
				self.m_infoB3L = label;
				[m_layer3 addSubview:m_infoB3L];
			}
			else if ( k == 2 ) {
				self.m_infoC3L = label;
				[m_layer3 addSubview:m_infoC3L];
			}
			else{
				self.m_infoD3L = label;
				[m_layer3 addSubview:m_infoD3L];
			}
		}
		[label release];
		y+= h+ 20;
	}

	m_page_maxY[qNo-1] = 300- y;
	
	//NSLog( @"show ques = %d", qNo );
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
		
		CGRect rect = CGRectMake( 0, 70, 320, 320);
		CGPoint endPt = [touch locationInView:[self view]];
		
		if( CGRectContainsPoint( rect, endPt ) ){
			
			if( CGRectContainsPoint(rect, m_startPt ) ){
				
				if ( abs(m_startPt.x - endPt.x) > abs(m_startPt.y -endPt.y)) {
					
					// 横スクロール
					if ( abs(m_startPt.x - endPt.x) > 30 ) {
						
						// prev
						if(m_startPt.x > endPt.x){
							
							if ( m_curQues == 5 ) {
								
								m_startPt = endPt;
								return;
							}
							
							m_inMove = true;
							
							[UIView beginAnimations:nil context:nil];
							[UIView setAnimationDelegate:self];
							[UIView setAnimationDidStopSelector:@selector(moveToLeft)];
							[UIView setAnimationDuration:1.0];	// 0.2秒でアニメーション
							
							if ( m_curView == 1 ) {
								
								m_view1.frame = CGRectMake( -320, 70, 320, 320 );
								m_view2.frame = CGRectMake( 0, 70, 320, 320 );
							}
							else if ( m_curView == 2 ) {
								
								m_view2.frame = CGRectMake( -320, 70, 320, 320 );
								m_view3.frame = CGRectMake( 0, 70, 320, 320 );
							}
							else{
								
								m_view3.frame = CGRectMake( -320, 70, 320, 320 );
								m_view1.frame = CGRectMake( 0, 70, 320, 320 );
							}
							
							[UIView commitAnimations];
						}	
						else {
							
							if ( m_curQues == 1 ) {
								
								m_startPt = endPt;
								return;
							}
							
							m_inMove = true;
							
							[UIView beginAnimations:nil context:nil];
							[UIView setAnimationDelegate:self];
							[UIView setAnimationDidStopSelector:@selector(moveToRight)];
							[UIView setAnimationDuration:1.0];	// 0.2秒でアニメーション
							
							if ( m_curView == 1 ) {
								
								m_view1.frame = CGRectMake( 320, 70, 320, 320 );
								m_view3.frame = CGRectMake( 0, 70, 320, 320 );
							}
							else if ( m_curView == 2 ) {
								
								m_view2.frame = CGRectMake( 320, 70, 320, 320 );
								m_view1.frame = CGRectMake( 0, 70, 320, 320 );
							}
							else{
								
								m_view3.frame = CGRectMake( 320, 70, 320, 320 );
								m_view2.frame = CGRectMake( 0, 70, 320, 320 );
							}
							
							[UIView commitAnimations];
						}
					}
				}
				else {
					
					CGPoint origin;
					
					if( m_curView == 1 )
						origin = m_layer1.frame.origin;
					else if( m_curView == 2 )
						origin = m_layer2.frame.origin;
					else
						origin = m_layer3.frame.origin;
					
					// 縦スクロール
					//NSLog( @"縦スクロール (%f, %f) : (%f, %f) -> (%f, %f )", origin.x, origin.y, m_startPt.x, m_startPt.y, endPt.x, endPt.y );
					if ( m_startPt.y> endPt.y ) {
						
						origin.y -= abs(m_startPt.y- endPt.y);
						if( origin.y <= m_maxY ){
							origin.y = m_maxY;
							m_downCursor.hidden = YES;
						}
						else if( m_cnt > 10 ){
							m_downCursor.hidden = NO;
						}
						
						if( m_curView == 1 )
							m_layer1.frame = CGRectMake( origin.x, origin.y, 285, 320);
						else if( m_curView == 2 )
							m_layer2.frame = CGRectMake( origin.x, origin.y, 285, 320);
						else
							m_layer3.frame = CGRectMake( origin.x, origin.y, 285, 320);
					}
					else {
						
						origin.y += abs(m_startPt.y- endPt.y);
						if( origin.y > 0 )
							origin.y = 0;
						
						if( m_curView == 1 )
							m_layer1.frame = CGRectMake( origin.x, origin.y, 285, 320);
						else if( m_curView == 2 )
							m_layer2.frame = CGRectMake( origin.x, origin.y, 285, 320);
						else
							m_layer3.frame = CGRectMake( origin.x, origin.y, 285, 320);
					}
					
					m_startPt = endPt;
				}
			}
			else {
				
				m_startPt = endPt;
			}
		}
	}		
}

- (void)moveToLeft{
	
	NSInteger nextView = 2;
	if ( m_curView == 1 )
		nextView = 3;
	else if ( m_curView == 2 )
		nextView = 1;
	
	if ( m_curQues == 1 ) {
		
		[self showQues:3 place:1 viewNo:nextView];
	}
	else {
		
		if ( m_curView == 1 )
			[self removeView3];
		else if ( m_curView == 2 )
			[self removeView1];
		else 
			[self removeView2];
		
		if ( m_curQues < 4 ) {
			[self showQues:(m_curQues+2) place:1 viewNo:nextView];
		}
	}
	
	m_curView++;
	if ( m_curView == 4 ) {
		m_curView = 1;
	}
	
	m_curQues++;
	
	m_leftCursor.hidden = NO;
	
	if ( m_curQues == 5 ) {
		m_rightCursor.hidden = YES;
	}
	else {
		m_rightCursor.hidden = NO;
	}
	
	m_downCursor.hidden = NO;
	m_maxY = m_page_maxY[m_curQues-1];
	[[self view] bringSubviewToFront:m_leftCursor];
	[[self view] bringSubviewToFront:m_rightCursor];
	m_inMove = false;
}

- (void)moveToRight{
	
	NSInteger prevView = 1;
	if ( m_curView == 1 )
		prevView = 2;
	else if ( m_curView == 2 )
		prevView = 3;
	
	if ( m_curQues == 5 ) {
		
		[self showQues:3 place:-1 viewNo:prevView];
	}
	else {
		
		if ( m_curView == 1 )
			[self removeView2];
		else if ( m_curView == 2 )
			[self removeView3];
		else 
			[self removeView1];
		
		if ( m_curQues > 2 ) {
			[self showQues:(m_curQues-2) place:-1 viewNo:prevView];
		}
	}
	
	m_curView--;
	if ( m_curView == 0 ) {
		m_curView = 3;
	}
	
	m_curQues--;
	
	m_rightCursor.hidden = NO;
	
	if ( m_curQues == 1 ) {
		m_leftCursor.hidden = YES;
	}
	else {
		m_leftCursor.hidden = NO;
	}
	
	m_downCursor.hidden = NO;
	m_maxY = m_page_maxY[m_curQues-1];
	[[self view] bringSubviewToFront:m_leftCursor];
	[[self view] bringSubviewToFront:m_rightCursor];
	m_inMove = false;
}

// place 0 == question
//       1 == answer 1
//       2 == answer 2
//       3 == answer 3
//       4 == answer 4
//		 5 == about question
//       6 == about answer 1
//       7 == about answer 2
//       8 == about answer 3
//       9 == about answer 4
-(NSString*)getMutiQuestion:(NSInteger)quizNo place:(NSInteger)place{
	
	if ( quizNo == 1 ) {
		
		if ( place == 0 )
			return @"初デートで遊園地に行ったあなた。\r最初はどこに入る？";
		else if ( place == 1 )
			return @"ジェットコースター";
		else if ( place == 2 )
			return @"グッズショップ";
		else if ( place == 3 )
			return @"ゴンドラ";
		else if ( place == 4 )
			return @"ライブショー";
		else if ( place == 5 )
			return @"遊園地での体験は、\rどのアトラクションを\r選ぶかによって二人の気分は\r大きく変わるもの。\r選ぶアトラクションによって、\r相手をどんな気分に\rさせたいのかがわかり\rアンタの異性を口説く時の\r「恋愛傾向」がわかる問題よ。";
		else if ( place == 6 )
			return @"アンタは相手をわざと\rドキドキさせて感情を揺さぶり、\r好意を持たせようと企む\r「ジェットコースターラブ野郎」\rだね。相手どころか、\rアンタも感情が高ぶって、\rジェットコースターみたいに\r恋に急降下かい！？\r非日常なシチュエーションに\r頼らず、ありのままの\rアンタを見せなさい！";
		else if ( place == 7 )
			return @"アンタは\r相手と同じ体験を共有して、\rいい感じに気持ちを盛り上げる\r「イチャイチャ盛り上げ野郎」。\r自分の好みを知ってもらいたい\rし、相手の好みを知りたい。\rこの２つの願望を両方とも\r叶えながら、\rイチャイチャ盛り上がっていく\rタイプだよ。\r合理的なんだけど、\r周りからみたら\rタダのうざいカップルね。";
		else if ( place == 8 )
			return @"ゴンドラでゆったりとトークを\r楽しみながら相手を知りたいと\r思うアンタは、\r相手と２人っきりで、\rゆっくりと内面から関係を\r盛り上げていく\r「ほのぼの慎重野郎」だね。\rちょっと刺激にはかけるわね。\rあんまりノロノロしてると\r相手に飽きられるわよ。\r時には、ガツっと押し倒す\rぐらいの勢いも大切だからね。";
		else if ( place == 9 )
			return @"アンタは、あまり相手と\rコミュニケーションを取らずに\rそれぞれが自分の世界で楽しむ\rライブショーを選んだね。\r最初から相手と向き合うのが\r恥ずかしいの？\rそれとも自分の世界にしか\r興味がないの？\r慎重なのもいいけど、\rちゃんと目と目を合わせて\r相手と向き合うことを\r忘れないように！";
	}
	else if ( quizNo == 2 ) {
		
		if ( place == 0 )
			return @"あなたは結婚式の二次会に\r友人３人と出席しました。\rあなたがとった行動は？";
		else if ( place == 1 )
			return @"3人だけで座れる\rテーブルを探した";
		else if ( place == 2 )
			return @"相席でも、3人一緒に\r座れるテーブルを探した";
		else if ( place == 3 )
			return @"3人組の異性がいる\rテーブルを探した";
		else if ( place == 4 )
			return @"新しい出会いを求め\r友人と離れ単独行動";
		else if ( place == 5 )
			return @"友人だけで固まり、\r他人と接するのを避けるのか？\r逆に、積極的に他人と\r知り合おうとするのか？\rアンタがどれだけ社交的なのか\rを診断するわ。";
		else if ( place == 6 )
			return @"いつも自分の周りの小さな世界に\r閉じこもっているわね。\r大人数の場所は苦手なんでしょ？\r出会いの可能性をカットするのは\rもったいないし\r居心地の良い環境でしか\r自分を出せないでしょ。\rそんなオナニーばかりしてないで\rちょっとは荒波に飛び込んで\r揉まれなさい、\rこの殻立てこもり野郎！";
		else if ( place == 7 )
			return @"3人で祝いながら、\rあわよくば知り合っちゃおう\rという下心が見え見えなのよ\rアンタ。\rシラフじゃ話しかけられないけど、\rちょっとお酒が入ると積極的に\rなるタイプね。\r声かけてくれないかな？って\r好きな人の周りを何回も\r往復したりしてるでしょ？\r運ばかりに頼るんじゃなくて、\rたまには正々堂々と\r勝負しなさいよ！\rこの、あわよくば期待野郎！";
		else if ( place == 8 )
			return @"いつも出会いの気合いが\rバリバリのアンタは\r合コンファイター。\r出会いの下心を隠しもせずに、\r異性3人組にいくとは、いさぎの\rいいファイターっぷりね。\rその心意気には関心するわ！\rでも、空気を無視して\rガツガツ行くのだけは禁物よ！\rそれじゃ、\r盛りのついた犬と一緒よ。\r時に激しく、時に優しく！\rそれが出会いの極意だからね！";
		else if ( place == 9 )
			return @"「出会い」こそ、新しい幸せを\r運んできてくれるきっかけ\rと思ってるアンタ。\r友達と来てるのに、\r一人でフラフラしてる姿は\r周りから見ると夢遊病よ！\r出会いに取りつかれたアンタは、\r社交性ありすぎ！\rここまで来るとアッパレよ！\rもうとことん突き進みな\rこの出会いの夢遊病患者！";
	}
	else if ( quizNo == 3 ) {
		
		if ( place == 0 )
			return @"経済的にも外見的にも\r全く同じ条件の異性２人から\rプロポーズされました。片方を選ぶ\r決め手となったのは何？";
		else if ( place == 1 )
			return @"セックスの相性が良かった";
		else if ( place == 2 )
			return @"一緒にいるとたくさん笑えた";
		else if ( place == 3 )
			return @"相手の両親と仲が良かった";
		else if ( place == 4 )
			return @"老後も一緒にいたいと思えた";
		else if ( place == 5 )
			return @"相手に何を求めたかで、\rアンタが何に幸せを感じて\r生きていくのかを診断できるわ。";
		else if ( place == 6 )
			return @"アンタが唯一信じるものは\r「目に見えるもの」。\r宝石、高級車、豪邸、高価な服\rなんでもいいわ。\r物理的に豊かなことや\r肌で触れられるものに幸せを\r感じる「超現実的野郎」よ。\rそれか、ただのセックス依存症ね。";
		else if ( place == 7 )
			return @"「笑う」ということは\r快楽そのもの。\r一緒にいてたくさん笑える人\rというのは、\rアンタに快楽を与えてくれる人ね。\rアンタは「どれだけ笑ったか」で\r人生の価値を決める\r「快楽追求」人間よ。";
		else if ( place == 8 )
			return @"アンタは他人との「和」に\r幸せを感じる\r「和気あいあい人間」ね。\rそして、相手の両親というのは、\r将来年老いていく自分達を\rイメージできる材料。\r未来予想図を思い描きながら、\r人と楽しく生きていくことを\r大切にするのがアンタよ。";
		else if ( place == 9 )
			return @"「楽しそう」なんて、\rなんとなくのイメージで\r相手を決めたアンタ。\rアンタはどちらかというと、\r現在よりも未来への希望、\r夢を気にするタイプね。\r根拠は薄くても、\r感性で未来を選択する。\r人生をギャンブルのように\r楽しむことが幸せなのね。";
	}
	else if ( quizNo == 4 ) {
		
		if ( place == 0 )
			return @"あなたは、\rさほど気になってはいない\r異性とデート中。\rしかし、先ほどからなぜか\r「今夜は一緒にいたいな」と\r思い始めてます。なぜ？";
		else if ( place == 1 )
			return @"意外と魅力的な肉体を\rしているとこに気がついた";
		else if ( place == 2 )
			return @"やたらと高価な\r時計を付けている";
		else if ( place == 3 )
			return @"声が妙に\rセクシーに聞こえてきた";
		else if ( place == 4 )
			return @"挑発的な目線に心を奪われた";
		else if ( place == 5 )
			return @"一夜を共にする相手を\rどんな理由で選んだかで、\rアンタが初対面の異性の、\rどこに惹かれるのかが分かるわ。";
		else if ( place == 6 )
			return @"相手の肉体にやられちゃった\rアンタ。わかりやすいわね。\rアンタは\r異性の体をジロジロと見過ぎ！\rつま先から頭までパーツごとに\rなめ回すように見てるわ。\rアンタはまず、\r肉体で相手を判断するタイプね。\rまあ、動物みたいなもんよ。\r目の前に餌があったら\rとりあえず食っとくみたいな。";
		else if ( place == 7 )
			return @"アンタは身につけている物や\r服装で相手を判断して、\rその背景を探ろうとするタイプ。\r確かにお金やセンスは、\r目に見える一番の価値よ。\r持ってる人は、仕事で成功\rしてるのかもしれないし、\rいい出生なのかもしれない。\r打算的な野郎だね！\rそうやって計算ばっかして\rいざこの人だ！って\r見つけた人が大誤算だった！\rってなるのがアンタのオチよ！\r人生は計算なんかできないのよ！\rもっとパッションで生きなさい！";
		else if ( place == 8 )
			return @"声のセクシーさにやられたアンタ。\r耳から入ってくる情報で、\r物事を判断するタイプよ。\r初対面では、\r自分によくしゃべりかける\r相手に興味がいく。\r話が合ったり、面白いことを\r言う相手に惹かれるようね。\rこの中だと一番幸せになるかもね。\rだって声って人の感情を\r運ぶものだから、相手が\r隠そうって思ってもよ〜く\r聞き分けてみると、\r相手の感情が面白い位伝わって\rくるモノなのよ！\rだからちゃんと聞き分ければ\r幸せはすぐ目の前よ！";
		else if ( place == 9 )
			return @"挑発的な目線に\rやられちゃったアンタ。\r目線の裏にある相手の感情を\r想像しちゃうのね？\r相手のふとした一面を見て、\r勝手にその人の性格を\r妄想するタイプよ。自分では\r理解できないような、\rなんとなくミステリアスな\r相手に惹かれるわね。\rちょっと怪しいオーラに\r一人で舞い上がっちゃって\r勝手に「神」扱いってか！\rもう一人でオナニーでもしてろ\rこの妄想列車が！";
	}
	else if ( quizNo == 5 ) {
		
		if ( place == 0 )
			return @"恋人と喧嘩中のあなた。\rあなたはどの方法で仲直りする？";
		else if ( place == 1 )
			return @"メールする";
		else if ( place == 2 )
			return @"相手からの連絡を待つ";
		else if ( place == 3 )
			return @"電話する";
		else if ( place == 4 )
			return @"相手の家に押し掛ける";
		else if ( place == 5 )
			return @"悪くなった恋人との関係を\rどうやって修復させるか？\rそれによって、アンタが恋人を\r「どうリードするか？」が\rわかるわ。";
		else if ( place == 6 )
			return @"アンタは、重苦しい状況を\rあえて軽いノリの“メール”で\rやり過ごそうとする。メールは、\r簡単に思いが伝えられる上に、\r相手も簡単に返すことができる。\r相手に考える時間を\r与えることもできるわね。\r相手にも余裕を与えながら、\r自分も楽に事を済ませる\rアンタは“戦略家”タイプよ。";
		else if ( place == 7 )
			return @"相手からの連絡を\rずっと待っている・・・\rアンタの受身な態度の中に、\r本当は「謝るのはいや！」\rというプライドの高さが見えるわ。\r自分から行動せずに、精神的に\r相手をコントロールして、\r行動させるタイプね。\r相手への不満を、\r内面にため込みやすいタイプ\rでもあるわね。";
		else if ( place == 8 )
			return @"電話を選んだアンタは、\r遠慮せずに本音で語り合う\rことに重きを置くタイプ。\r伝えたいことがあれば、\rすぐに伝えればいいと\r思っているわ。\rなんでも直球勝負で\r面倒くさい駆け引きは嫌い。\rサバサバと隠し事なし、\r本音で相手と向かい合うわ。";
		else if ( place == 9 )
			return @"押し掛けたわね・・・\rアンタは\r相手を激しくリードするわ。\rしかしながら・・・\r強引で押しつけがましいようね。\r相手のことはあまり考えずに\r自分の激情を叩きつけるタイプよ。\r効果的に強引さを使うのはいいわ。\rいつも強引だと、\r相手も疲れるから気をつけて！";
	}
	else if ( quizNo == 6 ) {
		
		if ( place == 0 )
			return @"恋人と一緒にいる時を\r想像してください。\r次のうちあなたに\r当てはまるのはどれ？";
		else if ( place == 1 )
			return @"常に愛を囁いている";
		else if ( place == 2 )
			return @"時折　愛を囁いている";
		else if ( place == 3 )
			return @"記念日にだけ愛を囁いている";
		else if ( place == 4 )
			return @"愛を囁くのは一度だけで十分";
		else if ( place == 5 )
			return @"感情を素直に表現するか、\rそれとも感情を表にださないのか。\r愛の表現方法に対するアンタの\r考え方を診断してあげるわ。";
		else if ( place == 6 )
			return @"思っていることを\r相手に伝えることが大切だと\r考えるアンタ。\rいかなる時もストレートに\r感情を表現するわ。\r前世はイタリア人ね、きっと。";
		else if ( place == 7 )
			return @"どんな時でもというより\rここぞと思ったタイミングで\r効果的に感情表現をするのが\rアンタ。天職はキャバ譲ね!";
		else if ( place == 8 )
			return @"大切な時以外は\r気持ちを表現する必要がない。\rそう思っているわね？\r言葉にするより\r行動で示したいアンタは\rもしかして九州生まれですか!?";
		else if ( place == 9 )
			return @"一度しか言わないから重みがある。\r常日頃から言ってたら\r挨拶と一緒だ！と\r感情表現の苦手なオマエは、\r高倉健さんですか!?";
	}
	else if ( quizNo == 7 ) {
		
		if ( place == 0 )
			return @"散歩をしていたら道のど真ん中に\r蛇がとぐろを巻いてこちらを\r見ている！あなたならどうする？";
		else if ( place == 1 )
			return @"棒でヘビをしばく！";
		else if ( place == 2 )
			return @"平気でそのまま歩く";
		else if ( place == 3 )
			return @"ヘビが逃げるまで待つ";
		else if ( place == 4 )
			return @"他の道を探す";
		else if ( place == 5 )
			return @"アンタが突然のトラブルに\r直面した際の順応性がわかるわ。";
		else if ( place == 6 )
			return @"真っ先に棒でヘビをしばいた\rアンタは、\r負けず嫌いで、プライドが高く、\r決めたことは\r絶対に曲げない主義。\rトラブルが起こっても、\r正面からぶっこむ\r喧嘩上等野郎よ。\r日常的に人とのぶつかり合いも\r絶えないでしょうね。\rちょっとは頭を使って\r打算的に動きなさい。\r怪我するわよ。";
		else if ( place == 7 )
			return @"平気で歩いたアンタは、\r「自分なら噛まれない」って\r根拠のない自信があるからだね。\r自分の判断力や行動力に、\r異常なほど自信があるのが\rアンタの特徴よ。\rトラブルが起きても、\rその自信から、\r大胆な行動に出たり、\rつまらないミスを犯して\r大失敗をすることもあるわ。\r自分を買いかぶりすぎ\rなんじゃないかしら？";
		else if ( place == 8 )
			return @"ヘビに気を遣っちゃってる\rアンタ。気が弱いわね〜。\r何かと自分より、\r相手の立場にたって\r物事を考えちゃう人間ね。\rトラブルが起こっても、\rさっさと対処すればいいのに、\r色々と思慮深く考えすぎて\r対応が遅くなるタイプよ。\rよく言えば、いい人。\r悪く言えば、どうでもいい人。\rなんて言われてたりしない？\r優しいばかりだと、\r損することもあるから\r気をつけなさい。";
		else if ( place == 9 )
			return @"さっさと他の道を探したアンタは、\r常に状況を把握して\r行動を柔軟に変えるタイプ。\rトラブルが起こっても、\r揉めたりするのは\r面倒くさくて、ちがう方法で\r乗り切ろうとするわ。\rただ、状況に応じて\rころころとやり方や、\r考え方を変えすぎ。\r周りの人にとったら、\r自己主張がなくて流されやすい\r人間に見えるようよ。";
	}
	else if ( quizNo == 8 ) {
		
		if ( place == 0 )
			return @"夏休みの自由課題、\rあなたは次のうちどれをやる？";
		else if ( place == 1 )
			return @"朝顔の成長日記";
		else if ( place == 2 )
			return @"木材で椅子を作る";
		else if ( place == 3 )
			return @"近所の川の生き物研究";
		else if ( place == 4 )
			return @"粘土でオブジェを作る";
		else if ( place == 5 )
			return @"ちゃんと計画を立てて\rその通りに進めることが必要な\r課題を選ぶか、\r自由な発想で物を創る能力が\r求められる実験を選ぶかに\rよってアンタの恋愛の進め方を\r診断できるわ。";
		else if ( place == 6 )
			return @"毎朝、早起きして\r朝顔の様子をチェック。\r計画的で強い意志がないと\rできない課題を選んだアンタ。\r時間の経過と2人の距離を\rしっかりと見て、段階を踏んで\r恋愛を成熟させるタイプ。\rトラブルやいざこざを嫌うわね。\r結婚生活が得意なタイプでも\rあるわ。";
		else if ( place == 7 )
			return @"設計図通りに「椅子を作る」\rというルールがあるものの、\r自由なデザインを楽しむ\r課題を選んだアンタ。\r段階を踏んで\r慎重に恋愛を進めるけど、\rちょっとはトラブルや\rイザコザもないと物足りない。\r倦怠期に陥りやすいタイプね。\r刺激を求めている時は、\r危険な誘惑にも乗っちゃうから\r気をつけて！";
		else if ( place == 8 )
			return @"どんな生物がいるかも分からない。\rどこまで研究するのかも自由。\r探究心がなければ成功しない\rこの課題を選んだアンタ。\r相手の色々な側面から\r魅力を収集して、\r自分の中で相手の像を\r作り上げるタイプ。\r色々な所へデートに行くし、\r色んなシチュエーションで\r相手を見たいのね。\rしかも・・“夜の営み”の方も\r探究心に溢れているようね。\rこの好きもんが！";
		else if ( place == 9 )
			return @"オブジェっていったって・・・\rアンタ、いったい何を作るの？\r結果がまったく未知数。\r結果が出ても\r評価が人によって違う。\rそんな課題を選んだアンタは、\r時間の経過や、\r段階を踏んだ恋愛には\rまったく興味がない。\rルールも関係ないようね。\r相手と感情のままに、\r愛し合い、傷つけ合って\r心と心の繋がりを楽しむ\rタイプよ。禁断の恋愛も\rウェルカムな感じで\rやっちゃうから気をつけなさい。\rいつか刺されるわよ。";
	}
	else if ( quizNo == 9 ) {
		
		if ( place == 0 )
			return @"ショッピングをしていると、\rあなたの恋人に\r似合いそうな帽子を発見！\rどんな帽子だった？";
		else if ( place == 1 )
			return @"円錐形のトンガリ帽";
		else if ( place == 2 )
			return @"すっきりタイトな\rシルクハット";
		else if ( place == 3 )
			return @"可愛らしい麦わら帽子";
		else if ( place == 4 )
			return @"ふんわり毛糸のニット帽";
		else if ( place == 5 )
			return @"心理学的に尖っている物は\rS的な要素を表し、\r丸い物はM的な要素を表すわ。\r恋人には自分と真逆の要素を\r求める傾向から、アンタの\rSM度を診断する問題よ。";
		else if ( place == 6 )
			return @"トンガリまくってる帽子を\r選んだアンタは\r恋人にドSを求めるわ。\rってことは、アンタは\rとんでもないドM野郎ね！\rドSな恋人の奴隷となって、\r何でもするわ！\r本当はベッドでも縛られたり、\rそれ以上のプレイを\r望んでるんじゃないの？\rこのド変態野郎が！";
		else if ( place == 7 )
			return @"角ばって尖ってはいるものの、\rシルクという\r柔らかい素材から出来ている\rシルクハットを選んだアンタは、\r恋人にそこそこのS度を求める。\rってことは、アンタは\rどちらかって言うとMよりね。\r日常では隠れたSっ気が\r顔を出す時が\rあるかもしれないけど\r基本は攻められたいし、\r受け身が好きなのね。\rなんとなく、\r異性にグイグイ来られたら\r断れないタイプね。";
		else if ( place == 8 )
			return @"丸く、けど素材としては\r固めの麦わら帽子を選んだ\rアンタは、恋人にそこそこの\rM度を求める。\rということは、\rアンタはそこそこのSね。\r基本は相手をリードしたいし、\rいじめるのが好き。\rけれども、あくまでも\r“そこそこ”のSよ。\rたまにMになりたい時も\rあるんじゃない？\rこういうタイプは、\rSとMのどちらも変幻自在で、\r恋愛や性生活を楽しむわ。";
		else if ( place == 9 )
			return @"柔らかくて丸い、\r毛糸のニット帽を恋人に選んだ\rアンタは、超ハードなS野郎ね。\r相手を徹底的に攻め立てて、\r逃がさない。\r生まれついての人間調教師よ。\r今も獣のような目つきで、\r目の前の獲物を\r品定めしてるんじゃないの？\rドMの皆さん、逃げて！";
	}
	else if ( quizNo == 10 ) {
		
		if ( place == 0 )
			return @"あなたが大きな池で飼っている\rお魚達を最近現れた悪いワニが\r食べてしまっているようです。\r怒ったアナタは船に乗って\rワニを釣り上げました。\rその大きさは？";
		else if ( place == 1 )
			return @"４０センチぐらいのお魚サイズ";
		else if ( place == 2 )
			return @"１メートルぐらいの標準サイズ";
		else if ( place == 3 )
			return @"５メートルぐらいの超大物";
		else if ( place == 4 )
			return @"１０メートル以上の化け物級";
		else if ( place == 5 )
			return @"アンタの大事なお魚を\r食べてしまう「ワニ」は、\rアンタの日常を邪魔する\r欲望を表すわ。\r水面の下にいるワニが\rどれぐらいの大きさかで、\r最近のアンタの「欲望」。\rつまりは「性欲」がわかるのよ";
		else if ( place == 6 )
			return @"典型的な淡白野郎ね。\rもともとセックスに\r興味がないのかしら？\rそれとも、悟りを開いちゃったの？\rそんなことじゃ、自分の性別を\r忘れちゃうわよ。\rよく言うじゃない、\r草食系ってやつよ。\r今のアンタは、\rガツガツした相手は苦手ね。\r心と心のつながりを\r求めているのかもしれないわね。\rでも、肉体でしかわからない\rコトだってあるってことを\r忘れちゃいけないよ！";
		else if ( place == 7 )
			return @"まあ、アンタの性欲は標準よ。\r性欲と、理性のバランスが\rとれているわね。要するに\rガッついていないってことよ。\rもともと性欲が強くないタイプ？\rそれとも実は最近、\r肉体面で満たされているの？\rとにかく今は、性欲に支配されて\r行動することはないようね。";
		else if ( place == 8 )
			return @"好き者ね、アンタは。\r性欲に満ちあふれているわ。\r天性のセックス好きで、\r常にムラムラしているのかしら？\rそれか少し欲求不満気味の\r可能性もあるわね。\rアンタみたいなタイプは、\rセックスをスポーツのように\r楽しむ傾向があるわ。\r部活みたいなもんよ。\r今夜も思いっきり楽しみなさい。\rアンタの大好きな部活を！";
		else if ( place == 9 )
			return @"危険ね、アンタ。\rあんたの性欲は水面下で、\rとんでもない大きさに\r膨れ上がっているようよ。\r今にも目の前の相手を\r押し倒してしまわんばかりだわ！\r可哀想に、そんなに欲求不満なの？\r言っとくけど、性犯罪だけは\r犯さないようにね！\rこのままだと\r性欲に脳を支配されて、\rセックスマシーンになるわ！\r手遅れになる前に、\r欲望を解消しなさい！";
	}
	
	return nil;
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	if ( m_from == 1 ) {
		
		[appli.m_gpsCtrl closeBestFitPage];
	}
	else if ( m_from == 2 ) {
		
		[appli.m_gpsCtrl closeWastFitPage];
	}
	else if ( m_from == 3 ) {
		
		[appli.m_gpsCtrl closeMutiFitSelPage];
	}
	else if ( m_from == 4 ) {
		
		[appli.m_gpsCtrl closeResultPage];
	}
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	if ( m_from == 1 ) {
		
		[appli.m_gpsCtrl closeBestFitPage];
	}
	else if ( m_from == 2 ) {
		
		[appli.m_gpsCtrl closeWastFitPage];
	}
	else if ( m_from == 3 ) {
		
		[appli.m_gpsCtrl closeMutiFitSelPage];
	}
	else if ( m_from == 4 ) {
		
		[appli.m_gpsCtrl closeResultPage];
	}
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	if ( m_from == 1 ) {
		
		[appli.m_gpsCtrl closeBestFitPage];
	}
	else if ( m_from == 2 ) {
		
		[appli.m_gpsCtrl closeWastFitPage];
	}
	else if ( m_from == 3 ) {
		
		[appli.m_gpsCtrl closeMutiFitSelPage];
	}
	else if ( m_from == 4 ) {
		
		[appli.m_gpsCtrl closeResultPage];
	}
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	if ( m_from == 1 ) {
		
		[appli.m_gpsCtrl closeBestFitPage];
	}
	else if ( m_from == 2 ) {
		
		[appli.m_gpsCtrl closeWastFitPage];
	}
	else if ( m_from == 3 ) {
		
		[appli.m_gpsCtrl closeMutiFitSelPage];
	}
	else if ( m_from == 4 ) {
		
		[appli.m_gpsCtrl closeResultPage];
	}
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	
	if ( m_from == 1 ) {
		
		[appli.m_gpsCtrl closeBestFitPage];
	}
	else if ( m_from == 2 ) {
		
		[appli.m_gpsCtrl closeWastFitPage];
	}
	else if ( m_from == 3 ) {
		
		[appli.m_gpsCtrl closeMutiFitSelPage];
	}
	else if ( m_from == 4 ) {
		
		[appli.m_gpsCtrl closeResultPage];
	}
}


- (NSInteger)getTextsHeight:(NSString*)str cx:(NSInteger)cx font:(UIFont*)font{
	
	// 最大の表示領域CGSize。このCGSize以上は文字列長がこのサイズを超える場合はすべて表示されない
	CGSize bounds = CGSizeMake(cx, 10000);
	
	// 表示に必要なCGSize
	CGSize size = [str sizeWithFont:font constrainedToSize:bounds lineBreakMode:UILineBreakModeTailTruncation];
	
	return size.height;
}

// from = 1	best
//        2 wast
//        3	sel
//		  4	result
-(IBAction)selToBack:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	if ( m_from == 1 ) {
		
		bestResultController* oya = (bestResultController*)m_parent;
		[oya closeHelpPage];
	}
	else if ( m_from == 2 ) {
		
		wastResultController* oya = (wastResultController*)m_parent;
		[oya closeHelpPage];
	}
	else if ( m_from == 3 ) {
		
		fittingSelController* oya = (fittingSelController*)m_parent;
		[oya closeHelpPage];
	}
	else if ( m_from == 4 ) {
		
		fitResultController* oya = (fitResultController*)m_parent;
		[oya closeHelpPage];
	}
}

@end
