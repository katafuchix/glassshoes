//
//  aboutProfile.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "aboutProfile.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "chkResultController.h"
#import "resultController.h"
#import "profileController.h"
#import "glassShoes.h"
#import "profile.h"
#import "question.h"

@implementation aboutProfile

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
		self.m_layer1 = nil;
		self.m_view1 = nil;
		self.m_layer2 = nil;
		self.m_view2 = nil;
		self.m_layer3 = nil;
		self.m_view3 = nil;
		
		self.m_q1Img = nil;
		self.m_ques1L = nil;
		self.m_about1Img = nil;
		self.m_about1L = nil;
		self.m_answer1Img = nil;
		self.m_nameA1L = nil;
		self.m_anwerA1L = nil;
		self.m_infoA1L = nil;
		self.m_nameB1L = nil;
		self.m_anwerB1L = nil;
		self.m_infoB1L = nil;
		self.m_q2Img = nil;
		self.m_ques2L = nil;
		self.m_about2Img = nil;
		self.m_about2L = nil;
		self.m_answer2Img = nil;
		self.m_nameA2L = nil;
		self.m_anwerA2L = nil;
		self.m_infoA2L = nil;
		self.m_nameB2L = nil;
		self.m_anwerB2L = nil;
		self.m_infoB2L = nil;
		self.m_q3Img = nil;
		self.m_ques3L = nil;
		self.m_about3Img = nil;
		self.m_about3L = nil;
		self.m_answer3Img = nil;
		self.m_nameA3L = nil;
		self.m_anwerA3L = nil;
		self.m_infoA3L = nil;
		self.m_nameB3L = nil;
		self.m_anwerB3L = nil;
		self.m_infoB3L = nil;
		
		m_inMove = false;
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
		
		[m_q1Img removeFromSuperview];
		[m_q1Img release];
		m_q1Img = nil;
	}
	
	if ( m_ques1L != nil ) {
		
		[m_ques1L removeFromSuperview];
		[m_ques1L release];
		m_ques1L = nil;
	}

	if ( m_about1Img != nil ) {
		
		[m_about1Img removeFromSuperview];
		[m_about1Img release];
		m_about1Img = nil;
	}
	
	if ( m_about1L != nil ) {
		
		[m_about1L removeFromSuperview];
		[m_about1L release];
		m_about1L = nil;
	}

	if ( m_answer1Img != nil ) {
		
		[m_answer1Img removeFromSuperview];
		[m_answer1Img release];
		m_answer1Img = nil;
	}
	
	if ( m_nameA1L != nil ) {
		
		[m_nameA1L removeFromSuperview];
		[m_nameA1L release];
		m_nameA1L = nil;
	}

	if ( m_anwerA1L != nil ) {
		
		[m_anwerA1L removeFromSuperview];
		[m_anwerA1L release];
		m_anwerA1L = nil;
	}
	
	if ( m_infoA1L != nil ) {
		
		[m_infoA1L removeFromSuperview];
		[m_infoA1L release];
		m_infoA1L = nil;
	}

	if ( m_nameB1L != nil ) {
		
		[m_nameB1L removeFromSuperview];
		[m_nameB1L release];
		m_nameB1L = nil;
	}
	
	if ( m_anwerB1L != nil ) {
		
		[m_anwerB1L removeFromSuperview];
		[m_anwerB1L release];
		m_anwerB1L = nil;
	}
	
	if ( m_infoB1L != nil ) {
		
		[m_infoB1L removeFromSuperview];
		[m_infoB1L release];
		m_infoB1L = nil;
	}
	
	if ( m_layer1 != nil ) {
		
		[m_layer1 removeFromSuperview];
		[m_layer1 release];
		m_layer1 = nil;
	}
	
	if ( m_view1 != nil ) {
		
		[m_view1 removeFromSuperview];
		[m_view1 release];
		m_view1 = nil;
	}
}

-(void)removeView2{
	
	if ( m_q2Img != nil ) {
		
		[m_q2Img removeFromSuperview];
		[m_q2Img release];
		m_q2Img = nil;
	}
	
	if ( m_ques2L != nil ) {
		
		[m_ques2L removeFromSuperview];
		[m_ques2L release];
		m_ques2L = nil;
	}
	
	if ( m_about2Img != nil ) {
		
		[m_about2Img removeFromSuperview];
		[m_about2Img release];
		m_about2Img = nil;
	}
	
	if ( m_about2L != nil ) {
		
		[m_about2L removeFromSuperview];
		[m_about2L release];
		m_about2L = nil;
	}
	
	if ( m_answer2Img != nil ) {
		
		[m_answer2Img removeFromSuperview];
		[m_answer2Img release];
		m_answer2Img = nil;
	}
	
	if ( m_nameA2L != nil ) {
		
		[m_nameA2L removeFromSuperview];
		[m_nameA2L release];
		m_nameA2L = nil;
	}
	
	if ( m_anwerA2L != nil ) {
		
		[m_anwerA2L removeFromSuperview];
		[m_anwerA2L release];
		m_anwerA2L = nil;
	}
	
	if ( m_infoA2L != nil ) {
		
		[m_infoA2L removeFromSuperview];
		[m_infoA2L release];
		m_infoA2L = nil;
	}
	
	if ( m_nameB2L != nil ) {
		
		[m_nameB2L removeFromSuperview];
		[m_nameB2L release];
		m_nameB2L = nil;
	}
	
	if ( m_anwerB2L != nil ) {
		
		[m_anwerB2L removeFromSuperview];
		[m_anwerB2L release];
		m_anwerB2L = nil;
	}
	
	if ( m_infoB2L != nil ) {
		
		[m_infoB2L removeFromSuperview];
		[m_infoB2L release];
		m_infoB2L = nil;
	}
	
	if ( m_layer2 != nil ) {
		
		[m_layer2 removeFromSuperview];
		[m_layer2 release];
		m_layer2 = nil;
	}
	
	if ( m_view2 != nil ) {
		
		[m_view2 removeFromSuperview];
		[m_view2 release];
		m_view2 = nil;
	}
}

-(void)removeView3{
	
	if ( m_q3Img != nil ) {
		
		[m_q3Img removeFromSuperview];
		[m_q3Img release];
		m_q3Img = nil;
	}
	
	if ( m_ques3L != nil ) {
		
		[m_ques3L removeFromSuperview];
		[m_ques3L release];
		m_ques3L = nil;
	}
	
	if ( m_about3Img != nil ) {
		
		[m_about3Img removeFromSuperview];
		[m_about3Img release];
		m_about3Img = nil;
	}
	
	if ( m_about3L != nil ) {
		
		[m_about3L removeFromSuperview];
		[m_about3L release];
		m_about3L = nil;
	}
	
	if ( m_answer3Img != nil ) {
		
		[m_answer3Img removeFromSuperview];
		[m_answer3Img release];
		m_answer3Img = nil;
	}
	
	if ( m_nameA3L != nil ) {
		
		[m_nameA3L removeFromSuperview];
		[m_nameA3L release];
		m_nameA3L = nil;
	}
	
	if ( m_anwerA3L != nil ) {
		
		[m_anwerA3L removeFromSuperview];
		[m_anwerA3L release];
		m_anwerA3L = nil;
	}
	
	if ( m_infoA3L != nil ) {
		
		[m_infoA3L removeFromSuperview];
		[m_infoA3L release];
		m_infoA3L = nil;
	}
	
	if ( m_nameB3L != nil ) {
		
		[m_nameB3L removeFromSuperview];
		[m_nameB3L release];
		m_nameB3L = nil;
	}
	
	if ( m_anwerB3L != nil ) {
		
		[m_anwerB3L removeFromSuperview];
		[m_anwerB3L release];
		m_anwerB3L = nil;
	}
	
	if ( m_infoB3L != nil ) {
		
		[m_infoB3L removeFromSuperview];
		[m_infoB3L release];
		m_infoB3L = nil;
	}
	
	if ( m_layer3 != nil ) {
		
		[m_layer3 removeFromSuperview];
		[m_layer3 release];
		m_layer3 = nil;
	}
	
	if ( m_view3 != nil ) {
		
		[m_view3 removeFromSuperview];
		[m_view3 release];
		m_view3 = nil;
	}
}

-(void)setInfo:(id)oya profile:(NSInteger)profileNo right:(NSInteger)rightNo from:(BOOL)bFit single:(BOOL)bSingle{
	
	m_parent = oya;
	m_profileNo = profileNo;
	m_rightNo = rightNo;
	m_bFromFit = bFit;
	
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
	
	if ( m_curQues != 20 ) {
		
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
		
		if ( m_curQues != 20 ) {
			
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
							
							if ( m_curQues == 20 ) {
								
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

		if ( m_curQues < 19 ) {
			[self showQues:(m_curQues+2) place:1 viewNo:nextView];
		}
	}
	
	m_curView++;
	if ( m_curView == 4 ) {
		m_curView = 1;
	}
	
	m_curQues++;
	
	m_leftCursor.hidden = NO;
	
	if ( m_curQues == 20 ) {
		m_rightCursor.hidden = YES;
	}
	else {
		m_rightCursor.hidden = NO;
	}

	m_maxY = m_page_maxY[m_curQues-1];
	m_downCursor.hidden = NO;
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
	
	if ( m_curQues == 20 ) {
		
		[self showQues:18 place:-1 viewNo:prevView];
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

- (void)showQues:(NSInteger)qNo place:(NSInteger)place viewNo:(NSInteger)viewNo{
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	NSInteger x = 0;
	if( place == -1 )
		x = -320;
	else if( place == 1 )
		x = 320;
	
	CGRect rect = CGRectMake( x, 70, 320, 320 );
	
	NSInteger max_cx = 320;
	
	// 文字列描画に使用するフォント
	UIFont *font = [UIFont fontWithName:@"Helvetica" size:18];
	UIFont *bigFont = [UIFont fontWithName:@"Helvetica-Bold" size:18];
	
	NSInteger one_h = [self getTextsHeight:@"あ" cx:max_cx font:font];
	NSInteger bigOne_h = [self getTextsHeight:@"あ" cx:max_cx font:bigFont];
	
	NSMutableArray* data = nil;
	NSString* strName = nil;
	NSString* rightName = nil;
	
	if ( m_profileNo == -1 ) {
		
		data = gs.m_sQuesLists;
		
		if ( m_rightNo != -1 ) {
			
			strName = [[NSString alloc] initWithFormat:@"%@", gs.m_name];
		}
	}
	else if( m_profileNo == 0 ){
		
		data = gs.m_myProfile.m_quesLists; 
		
		if ( m_rightNo != -1 ) {
			
			strName = [[NSString alloc] initWithFormat:@"%@", gs.m_myProfile.m_name];
		}
	}
	else if( m_profileNo == -2 ){
		
		data = gs.m_guestProfile.m_quesLists; 
		
		if ( m_rightNo != -1 ) {
			
			strName = [[NSString alloc] initWithFormat:@"%@", gs.m_guestProfile.m_name];
		}
	}
	else {
		
		profile* p = [gs.m_friendLists objectAtIndex:(m_profileNo-1)];
		data = p.m_quesLists; 
		
		if ( m_rightNo != -1 ) {
			
			strName = [[NSString alloc] initWithFormat:@"%@", p.m_name];
		}
	}
	
	NSMutableArray* rightData = nil;
	if ( m_rightNo != -1 ) {
		
		if( m_rightNo == 0 ){
			
			rightData = gs.m_myProfile.m_quesLists; 
			rightName = [[NSString alloc] initWithFormat:@"%@", gs.m_myProfile.m_name];
		}
		else if( m_rightNo == -2 ){
			
			rightData = gs.m_guestProfile.m_quesLists; 
			rightName = [[NSString alloc] initWithFormat:@"%@", gs.m_guestProfile.m_name];
		}
		else {
			
			profile* p = [gs.m_friendLists objectAtIndex:(m_rightNo-1)];
			rightData = p.m_quesLists; 
			rightName = [[NSString alloc] initWithFormat:@"%@", p.m_name];
		}
	}

	NSInteger y = 0;
	question* q= [data objectAtIndex:(qNo-1)];
	NSInteger quizNo = [q getQuizNo];
	NSInteger answerNo = [q getSelAnswer];
	
	NSInteger rightAnswer = 0;
	if ( m_rightNo != -1 ) {
		
		for( int j= 0; j< 20; j++ ){
			
			question* r= [rightData objectAtIndex:j];
			if ( [r getQuizNo] == quizNo ) {
				
				rightAnswer = [r getSelAnswer];
				break;
			}
		}
	}		
	
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
	NSString* str = [self getSingleQuestion:quizNo place:0];
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
	str = [self getSingleQuestion:quizNo place:5];
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
	if ( m_rightNo != -1 ) {
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mondai_hutari_49_602" ofType:@"png"]];
	}
	else {
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mondai_kotae_47_602" ofType:@"png"]];
	}
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
	
	if ( m_rightNo == -1 ) {
		
		// about ques
		str = [[NSString alloc] initWithFormat:@"「%@」", [self getSingleQuestion:quizNo place:answerNo]];
		h = [self getTextsHeight:str cx:max_cx font:bigFont];
		strRect = CGRectMake( 0, y, max_cx, h);
		label = [[UILabel alloc] initWithFrame:strRect];		
		label.text = str;
		label.backgroundColor = [UIColor clearColor];
		label.font = bigFont;
		label.numberOfLines = h/bigOne_h;
		if ( viewNo == 1 ) {
			
			self.m_anwerA1L = label;
			[m_layer1 addSubview:m_anwerA1L];
		}
		else if ( viewNo == 2 ) {
			
			self.m_anwerA2L = label;
			[m_layer2 addSubview:m_anwerA2L];
		}
		else{
			
			self.m_anwerA3L = label;
			[m_layer3 addSubview:m_anwerA3L];
		}
		[label release];
		[str release];
		y+= h+2;
		
		str = [self getSingleQuestion:quizNo place:(5+answerNo)];
		h = [self getTextsHeight:str cx:max_cx font:font];
		strRect = CGRectMake( 0, y, max_cx, h);
		label = [[UILabel alloc] initWithFrame:strRect];		
		label.text = str;
		label.backgroundColor = [UIColor clearColor];
		label.font = font;
		label.numberOfLines = h/one_h;
		if ( viewNo == 1 ) {
			
			self.m_infoA1L = label;
			[m_layer1 addSubview:m_infoA1L];
		}
		else if ( viewNo == 2 ) {
			
			self.m_infoA2L = label;
			[m_layer2 addSubview:m_infoA2L];
		}
		else{
			
			self.m_infoA3L = label;
			[m_layer3 addSubview:m_infoA3L];
		}
		[label release];
		y+= h;
	}
	else {
		
		if ( answerNo == rightAnswer ) {
			
			// about ques
			str = [[NSString alloc] initWithFormat:@"%@さん・%@さん", strName, rightName ];
			h = [self getTextsHeight:str cx:max_cx font:bigFont];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = bigFont;
			label.numberOfLines = h/bigOne_h;
			if ( viewNo == 1 ) {
				
				self.m_nameA1L = label;
				[m_layer1 addSubview:m_nameA1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_nameA2L = label;
				[m_layer2 addSubview:m_nameA2L];
			}
			else{
				
				self.m_nameA3L = label;
				[m_layer3 addSubview:m_nameA3L];
			}
			[label release];
			[str release];
			y+= h+2;
			
			str = [[NSString alloc] initWithFormat:@"「%@」", [self getSingleQuestion:quizNo place:answerNo]];
			h = [self getTextsHeight:str cx:max_cx font:bigFont];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = bigFont;
			label.numberOfLines = h/bigOne_h;
			if ( viewNo == 1 ) {
				
				self.m_anwerA1L = label;
				[m_layer1 addSubview:m_anwerA1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_anwerA2L = label;
				[m_layer2 addSubview:m_anwerA2L];
			}
			else{
				
				self.m_anwerA3L = label;
				[m_layer3 addSubview:m_anwerA3L];
			}
			[label release];
			[str release];
			y+= h;
			
			str = [self getSingleQuestion:quizNo place:(5+answerNo)];
			h = [self getTextsHeight:str cx:max_cx font:font];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = font;
			label.numberOfLines = h/one_h;
			if ( viewNo == 1 ) {
				
				self.m_infoA1L = label;
				[m_layer1 addSubview:m_infoA1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_infoA2L = label;
				[m_layer2 addSubview:m_infoA2L];
			}
			else{
				
				self.m_infoA3L = label;
				[m_layer3 addSubview:m_infoA3L];
			}
			[label release];
			y+= h;
		}
		else {
			
			// about ques
			str = [[NSString alloc] initWithFormat:@"%@さん", strName ];
			h = [self getTextsHeight:str cx:max_cx font:bigFont];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = bigFont;
			label.numberOfLines = h/bigOne_h;
			if ( viewNo == 1 ) {
				
				self.m_nameA1L = label;
				[m_layer1 addSubview:m_nameA1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_nameA2L = label;
				[m_layer2 addSubview:m_nameA2L];
			}
			else{
				
				self.m_nameA3L = label;
				[m_layer3 addSubview:m_nameA3L];
			}
			[label release];
			[str release];
			y+= h+2;
			
			str = [[NSString alloc] initWithFormat:@"「%@」", [self getSingleQuestion:quizNo place:answerNo]];
			h = [self getTextsHeight:str cx:max_cx font:bigFont];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = bigFont;
			label.numberOfLines = h/bigOne_h;
			if ( viewNo == 1 ) {
				
				self.m_anwerA1L = label;
				[m_layer1 addSubview:m_anwerA1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_anwerA2L = label;
				[m_layer2 addSubview:m_anwerA2L];
			}
			else{
				
				self.m_anwerA3L = label;
				[m_layer3 addSubview:m_anwerA3L];
			}
			[label release];
			[str release];
			y+= h;
			
			str = [self getSingleQuestion:quizNo place:(5+answerNo)];
			h = [self getTextsHeight:str cx:max_cx font:font];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = font;
			label.numberOfLines = h/one_h;
			if ( viewNo == 1 ) {
				
				self.m_infoA1L = label;
				[m_layer1 addSubview:m_infoA1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_infoA2L = label;
				[m_layer2 addSubview:m_infoA2L];
			}
			else{
				
				self.m_infoA3L = label;
				[m_layer3 addSubview:m_infoA3L];
			}
			[label release];
			y+= h+20;
			
			// about ques
			str = [[NSString alloc] initWithFormat:@"%@さん", rightName ];
			h = [self getTextsHeight:str cx:max_cx font:bigFont];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = bigFont;
			label.numberOfLines = h/bigOne_h;
			if ( viewNo == 1 ) {
				
				self.m_nameB1L = label;
				[m_layer1 addSubview:m_nameB1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_nameB2L = label;
				[m_layer2 addSubview:m_nameB2L];
			}
			else{
				
				self.m_nameB3L = label;
				[m_layer3 addSubview:m_nameB3L];
			}
			[label release];
			[str release];
			y+= h+2;
			
			str = [[NSString alloc] initWithFormat:@"「%@」", [self getSingleQuestion:quizNo place:rightAnswer]];
			h = [self getTextsHeight:str cx:max_cx font:bigFont];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = bigFont;
			label.numberOfLines = h/bigOne_h;
			if ( viewNo == 1 ) {
				
				self.m_anwerB1L = label;
				[m_layer1 addSubview:m_anwerB1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_anwerB2L = label;
				[m_layer2 addSubview:m_anwerB2L];
			}
			else{
				
				self.m_anwerB3L = label;
				[m_layer3 addSubview:m_anwerB3L];
			}
			[label release];
			[str release];
			y+= h;
			
			str = [self getSingleQuestion:quizNo place:(5+rightAnswer)];
			h = [self getTextsHeight:str cx:max_cx font:font];
			strRect = CGRectMake( 0, y, max_cx, h);
			label = [[UILabel alloc] initWithFrame:strRect];		
			label.text = str;
			label.backgroundColor = [UIColor clearColor];
			label.font = font;
			label.numberOfLines = h/one_h;
			if ( viewNo == 1 ) {
				
				self.m_infoB1L = label;
				[m_layer1 addSubview:m_infoB1L];
			}
			else if ( viewNo == 2 ) {
				
				self.m_infoB2L = label;
				[m_layer2 addSubview:m_infoB2L];
			}
			else{
				
				self.m_infoB3L = label;
				[m_layer3 addSubview:m_infoB3L];
			}
			[label release];
			y+= h;
		}
	}
	
	m_page_maxY[qNo-1] = 320- y;
	
	[strName release];
	
	if( rightName != nil )
		[rightName release];
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
-(NSString*)getSingleQuestion:(NSInteger)quizNo place:(NSInteger)place{
	
	if ( quizNo == 1 ) {
		
		if ( place == 0 )
			return @"50年後に取り出す\rタイムカプセルに、\rあなたは何を入れる";
		else if ( place == 1 )
			return @"大切にしている高価な宝石";
		else if ( place == 2 )
			return @"今流行っているアクセサリー";
		else if ( place == 3 )
			return @"恋人の写真";
		else if ( place == 4 )
			return @"恋人への手紙";
		else if ( place == 5 )
			return @"５０年後の自分に\r何を残すのかで、\rアンタが人生において何を\r一番大切にしているのかを\r診断する問題よ。";
		else if ( place == 6 )
			return @"時代が過ぎても\r世の中で確実に価値がある、\r高価な宝石を残したアンタが\r最も大事にしているのは\r「地位と財産」よ。\rアンタにとって\r人生の成功とは、結果的に\r金を儲けて、社会的にも\r尊敬されるポストにつくこと。\r間違ってはいないわ。\rけど、金や名誉に心を奪われて\r人の気持ちをないがしろに\rしないように気をつけて。";
		else if ( place == 7 )
			return @"今、流行のものを\r未来へ残したアンタは\rいつでも、世の中の第一線で\r生きていくことが\rプライドのようね。\r世の中の色々なところに\rアンテナを張ってるから、\r話題も豊富だし\rファッションも得意ね。\r競争心が強くて、\r他人への優越感を\r人生の励みにする人間よ。\rそれがたまに鼻につくわ。\r謙虚さを忘れずに。";
		else if ( place == 8 )
			return @"思い出を残したアンタは、\r「愛」こそ全ての人間よ。\r愛する人と共に生きていくことが\r人生の目的と思っているんでしょ？\rアンタの一生は\r人をいかに愛したかで決まるわ。\r愛に溺れて、\r現実が盲目になる一面があるわね。\r身を滅ぼさないように気をつけて。";
		else if ( place == 9 )
			return @"今、心にある熱い思いを\r残したアンタ。\r一生かけて自分の内面性を\r磨いていこうと思っている人間ね。\r他人との心と心のつながりを\rとても重視する。\r友達から恋人の趣味が\r変ってるって言われない？\rそれはアンタが相手の心しか\r重視しないのが原因よ。\r時には目に見える価値も\r必要だからね。\rそうしなければ、\rアンタの格が下がるわよ。";
	}
	else if ( quizNo == 2 ) {
		
		if ( place == 0 )
			return @"ある子供が財布を持って\r走っています。\rその子供はどこに入る？";
		else if ( place == 1 )
			return @"服屋";
		else if ( place == 2 )
			return @"サウナ";
		else if ( place == 3 )
			return @"文房具屋";
		else if ( place == 4 )
			return @"本屋";
		else if ( place == 5 )
			return @"ある子供はアンタの分身。\rどこに入るかでアンタが\r最近、何に興味を\r持っているかが表れるわ。\r";
		else if ( place == 6 )
			return @"真っ先に服屋に入ったアンタ。\r服は人間の“看板”よ！\rそんなアンタは、\r他人からどう見られるかを\r一番気にしている\r「格好つけ野郎」よ。\r見られたい願望がとても強いわ。\r確かに外見は大事よ。\rでも、外見ばかり気を遣って\r内面を磨くことを\r忘れないように！";
		else if ( place == 7 )
			return @"サウナは、\r「美容」と「癒し」を司る場所。\rアンタは他人からの目も\r気にするけど、\r一番重視するのは、\rどんな状況でもいかに自分が\rリラックスできているのか。\r言って見れば\r「癒し欠乏症野郎」よ。\r最近、疲れてる？疲れは人を\r醜くするから気をつけて！";
		else if ( place == 8 )
			return @"文房具は「創作」を司るわ。\rアンタさては最近、\r創作づいているわね？\rやたらと絵を描きたくなったり、\r陶芸教室に行ってみたり\rしてるでしょ？\rそういう時は、自分の内面を\r鍛えたいという願望と、\r自分の内面を吐き出したい\rって願望があるの。\rけど、自分を解放しすぎて、\r訳がわからないオブジェを作り、\r人をドン引きさせないようにね！";
		else if ( place == 9 )
			return @"本屋に入ったアンタ。\r書物は「心の広がり」を\r意味するわ。\r色んな人や物と触れ合って、\r精神の修行をしている\r時期なのね。\rアンタは自立心の強い\rしっかり者タイプだわ。\r勉強して成長しなさい。\r学は人を裏切らないわ。\rけど、変なものにはまって\r騙されたりしないようにね。\r世の中は危険がいっぱいよ。";
	}
	else if ( quizNo == 3 ) {
		
		if ( place == 0 )
			return @"あなたはミュージシャン。\r最近、すごく悩んでいます。\rなぜ？？";
		else if ( place == 1 )
			return @"スキャンダルが浮上して、\rファンを裏切ってしまった";
		else if ( place == 2 )
			return @"ライバルに人気で負けそう";
		else if ( place == 3 )
			return @"喉を傷めて、\r綺麗な声が出ない";
		else if ( place == 4 )
			return @"自分が何の為に曲を作ってるのか\rわからなくなった";
		else if ( place == 5 )
			return @"悩みの種類で、アンタが\r「何に一番重きを置くか」を\r診断よ。";
		else if ( place == 6 )
			return @"ファンのことを\r第一に考えたアンタは\r「他人からの評価」に\r自分の存在価値を見い出す人間ね。\r身に覚えはない？\r人から褒められると\rすぐ図に乗るし、\r陰口をたたかれたりしたら、\rすぐに落ち込んだり、\r怒ったりするわね。\rそれをバネにして\r行動するタイプよ。\r確かに他人の評価は大切だけど、\r「八方美人野郎」は鼻につくわ。\r気をつけてね。";
		else if ( place == 7 )
			return @"ライバルのことを考えたアンタ。\r人生は全て\r「競争」だと思ってるわね。\r何事も「勝ち」と「負け」で\r判断するでしょ？\rこういう人は、\rギャンブルが好きな人が多いわ。\r敵がいないと、\r何事も本領を発揮できない\rタイプよ。言ってみれば\r人生の「喧嘩番長」ね。\r言っとくけど、世の中には\r白黒つけられないことも\rあるんだからね。\r覚えときなさい！";
		else if ( place == 8 )
			return @"自分自身の\rノドの問題を考えたアンタは\r自分と周囲との関係性に\r縛られ、自分のせいで周りに\r悪い影響をおよぼすことを\rいつも気にしている\r「チキン野郎」ね。\r慎重で真面目だけど、\r失敗を恐れて大胆な行動に\r出られないタイプだわ。\rたまには、びびりくさってないで、\rやってやりなさいよ。\r他人はアンタに遠慮しないわよ。";
		else if ( place == 9 )
			return @"自分の内面の問題を\r理由にしたアンタ、\r人生に大切なのは「ロマン」\rと思っているでしょ？\r恋愛も仕事も全てを\rロマンチックに演出したがる\r「夢みる乙女野郎」ね。\r不幸な自分や、悩める自分に\r酔う傾向もあるわね。\rほどほどにしなさい。\r他人から見ると、\rたまにそういうところが、\r気持ち悪く映るから。";
	}
	else if ( quizNo == 4 ) {
		
		if ( place == 0 )
			return @"クラスで集合写真を\r撮ることになりました。\rあなたはどこに立って\r写真に写りましたか？";
		else if ( place == 1 )
			return @"先生の隣";
		else if ( place == 2 )
			return @"先生の後ろ";
		else if ( place == 3 )
			return @"列の一番端っこ";
		else if ( place == 4 )
			return @"皆から離れて立った";
		else if ( place == 5 )
			return @"先生を中心として撮影する\r集合写真。\rどの位置に立って写るかで\rあなたの「目立ちたい願望」\rを診断するわ。";
		else if ( place == 6 )
			return @"アンタは極度の目立ちたがり屋。\r多くの人に見てもらいたいと、\r体が自動的に先生の隣りに\r動いたのよ。\r他人にスポットライトが\r当たるなんてもっての他！\rどんな時でも\r自分が中心じゃなきゃイヤ。\rそんなアンタに\r疲れてる人は多いんじゃない？\rたまには3歩下がって歩く、\r日本人のわびさびを\r身につけなさい、\rこの出しゃばり野郎。";
		else if ( place == 7 )
			return @"アンタは、\r目立ちたい願望はあるけど、\rいつも一歩控えめな人間ね。\r良く言えば遠慮のできる人。\r悪く言えば前に出きれない\r中途半端野郎。\r確かに、どんな状況でも\rそつなく順応できる\r強かな人間かもしれないけどね、\r時には自分から行動を起こす\r豪快さも大切よ。";
		else if ( place == 8 )
			return @"アンタは、\r目立ちたい願望がかなり低い。\r目立たないように生きる事が\rうまく生きる秘訣だと思ってない？\rでもそれは周りから逃げてるだけ。\r心の中では、\r他人とあまり接したくないっ！\rどこかでそう思ってるんでしょ。\r一見クールに見える\rかもしれないけど、\r本当は自分の殻から抜け出せない\rタダの臆病者じゃないの？\r一度くらい殻をブチ壊して、\r本心でぶつかってみなさいよ！";
		else if ( place == 9 )
			return @"アンタ、重傷ね。\r他人のことは気にならない。\rむしろ興味を持てないんでしょ？\r自分は他人とは違う！\r自分は特別なんだ！って\rいつも思ってたいのね。\r自分の世界を\r大切にするのはいいけど\r度が過ぎたらタダの変わり者よ。\r天才と何とかは紙一重って\r言うけど、なんでも加減が大切！\r自分のことばかりじゃなく、\rたまには周りを見てみたら。\rそして最後に一言だけ\r言わしてもらうわ！\rアンタ本当の親友いないでしょ！";
	}
	else if ( quizNo == 5 ) {
		
		if ( place == 0 )
			return @"あなたは、お気に入りの\r展覧会を見に出かけました。\rすると、いつもの展覧会の隣に\r新しい展覧会も\r開催されていました。\rあなたならどうする？";
		else if ( place == 1 )
			return @"新しい展覧会に飛びついた";
		else if ( place == 2 )
			return @"いつもの展覧会を\rちょっと覗いて、\rすぐに新しい展覧会に入った";
		else if ( place == 3 )
			return @"新しい展覧会の資料をチェックし、\rいつもの展覧会を観た。";
		else if ( place == 4 )
			return @"スケジュールを\rしっかり組んで両方観た";
		else if ( place == 5 )
			return @"当初の予定には無かった、\r新しく出現した興味の対象に\rどう行動するかで、アンタの\r「好奇心」と「計画性」の\rバランスを診断よ。";
		else if ( place == 6 )
			return @"何も考えず条件反射のように\r新しい方に飛びついたアンタ。\rどうせ目の前に\r素敵な異性が現れたら、\r今の相手のことなんか忘れて\r飛びつくんだろ！\rちょっとは考えてから\r行動しなさい。名付けて\r「条件反射飛びつき野郎」よ。";
		else if ( place == 7 )
			return @"ちょっとは迷ったが、\r結局は新しいものへと\r行動したアンタは好奇心の奴隷。\r何でも見ておかないと\r気が済まない欲張りな人間ね。\r色々目移りしすぎで\r「いっちょ噛み」に\rならないように気をつけなさい。";
		else if ( place == 8 )
			return @"ちょっとは\r新しいものに興味を示すも\r当初の目的を遂行したアンタ。\r前もって自分が立てた計画が\r崩されることを何よりも\r嫌うタイプね。\r誘惑に負けない頑固さを\r持ってるかもしれないけど、\rそれはただ\r頭が固いだけじゃないの？\rたまには、計画から脱線して\r冒険してみると視野が広がるわよ。";
		else if ( place == 9 )
			return @"一度スケジュールを組み直して、\r行動計画を立てたアンタは\rかなり欲張りな人間ね。\r目の前に誘惑が現れたら、\r心を動かされないフリをして、\r実は全部持っていく計画を練る\rかなりの策士だわ。\r日本昔話に出てくる\r意地悪婆さんのように、\r欲で身を滅ぼさないように\r気をつけなさい！";
	}
	else if ( quizNo == 6 ) {
		
		if ( place == 0 )
			return @"洋服屋でお気に入りのコートを\r発見するも予算オーバー。\rダメモトで値切ってみたものの\r応じてくれなかった。\rその時どんな理由なら\r気持ち良く買える？";
		else if ( place == 1 )
			return @"既に定価より５０００円引き\rになっているので\r限界のお値段です";
		else if ( place == 2 )
			return @"全てのお客様に公平であるのが\rモットーなので割引は\rご勘弁ください";
		else if ( place == 3 )
			return @"このデザインと素材でこの価格は\rかなりのお買い得ですよ。";
		else if ( place == 4 )
			return @"大人気で、もうこの１着しか\r残っていません！明日にはないかも";
		else if ( place == 5 )
			return @"アンタが一番納得する\r説得のされ方を知ることで、\r逆にアンタがどのように\r他人を説得するかが\rわかる問題よ。";
		else if ( place == 6 )
			return @"どれぐらい得なのか、\r数字を見せられることで\r説得されたアンタ。\r他人を説得する時も、\r何でも実証や数字で\r証拠を示すわ。言ってみれば\r「データ至上主義」人間ね。\r損得勘定が上手なことが特徴よ。\r逆に、他人から損得勘定だけで\r生きてるって思われがち。\r数字以外のことにも\r目を向けなさい。";
		else if ( place == 7 )
			return @"デザインと素材を見ただけで\rお買い得かどうかなんて、\rわかるはずがないでしょ。\rアンタは、このコートを買うことを、\r後押ししてくれる言葉が\r欲しかっただけね。\r他人を説得する時も同じ。\rあいまいな表現で、\r何となくの雰囲気を作って\r説得する「ムード重視」人間ね。\rアンタの適当なトークは\r意外と見破られているもんよ。\r気をつけて。";
		else if ( place == 8 )
			return @"デザインと素材を見ただけで\rお買い得かどうかなんて、\rわかるはずがないでしょ。\rアンタは、\rこのコートを買うことを、\r後押ししてくれる言葉が\r欲しかっただけね。\r他人を説得する時も同じ。\rあいまいな表現で、\r何となくの雰囲気を作って\r説得する「ムード重視」人間ね。\rアンタの適当なトークは\r他人に意外と見破られているもんよ。\r気をつけて。";
		else if ( place == 9 )
			return @"「明日にはないかも」\rこの言葉が重要ね。\rアンタは他人を説得する時、\r不安感をあおって、\r相手の勢いを駆り立てるのよ。\r典型的な「ペテン師」タイプね。\r口が上手いことは褒めてあげるわ。\r他人によく分からない物を\r売りつけてるんじゃ\rないでしょうね？\r良い事に使いなさいその能力。";
	}
	else if ( quizNo == 7 ) {
		
		if ( place == 0 )
			return @"あなたは今朝、家を出た後に\rふと思いつき\r傘を取りに戻りました。\rそれはなぜ？";
		else if ( place == 1 )
			return @"さっき見た\r天気予報を思い出した";
		else if ( place == 2 )
			return @"傘を持っている人を見かけた";
		else if ( place == 3 )
			return @"遠くでカミナリが鳴っていた";
		else if ( place == 4 )
			return @"空気が湿っていた";
		else if ( place == 5 )
			return @"天気を予測する情報を\rどこから得たかを知ることで\rアンタが\rどんなモノに影響を受けて、\r行動しているのかを\r診断できるのよ。";
		else if ( place == 6 )
			return @"アンタは行動する前に、\r何でも率先して情報を調べるわね。\r旅行の時は「旅のしおり」とか\r作っちゃうタイプよ。\r飲み会の店は、雰囲気や予算\r人の評価とかを調べ上げるわね。\r恋愛でもそう。\r相手の生活や仕事、行動を\r冷静に分析して評価するわ。\r情緒的な恋愛をあまりしないから、\rアンタの恋愛をドラマにしたら、\rつまらなくて途中で打ち切りね。";
		else if ( place == 7 )
			return @"他人が傘を持ってるから、\r自分も持っていこうなんて・・\rアンタは何でも\r人に流されるタイプね。\r確かに他人の言うことは\r正しい時もあるわ。\rけど、噂や間違った情報も\rあるんだから、気をつけなさい。\r恋愛でも、\r他人からの評価が高いことや、\r社会的な地位を気にしすぎ。\r一度でもいいから心と心の\rぶつかり合いをしてみなさい！";
		else if ( place == 8 )
			return @"遠くで鳴るカミナリの音に\r気がついたアンタ。\r他人が気がつかないことに\rよく気がつくわね。　\rそれを元に、次に起こる\r事態や展開を予測しながら\r計画を立てたり、\r対策を練って動くわ。\r恋愛では、\r妄想をかきたてられるような、\rミステリアスな異性が、\rつい気になっちゃうタイプね。\rどう考えても、性格最悪の\r相手と付き合ったりもする。\rアンタだけが気がついている\r良いとこがあるんでしょ？\rめでたい野郎ね。";
		else if ( place == 9 )
			return @"空気の湿りを察知するとは・・\rアンタの行動を決めているのは\rズバリ“直感”よ。\rどんな時も自分の“本能”を\r頼りに生きているわ。\rもはや動物に近いわね。\rこういうタイプは、\r知らない道でも\rあまり地図を見ない人が多いわ。\r恋愛も、相手と出会ってすぐに\r恋愛感情を持つかで決まる。\rすぐに恋愛感情が燃え上がって\r勝手に相手を理想化。最後には\r失敗することも多いわね。\rちょっとは頭で物事を考える\r習慣をつけなさい！";
	}
	else if ( quizNo == 8 ) {
		
		if ( place == 0 )
			return @"深夜に帰宅したあなた。\r玄関を開けたその時、\r中から大きな物音が！\rあなたならどうする？";
		else if ( place == 1 )
			return @"とにかく電気をつけ\r中の様子を確認する";
		else if ( place == 2 )
			return @"何か手がかりが無いか\r周りを探す";
		else if ( place == 3 )
			return @"人？それともネズミ？\r物音に耳をすませる";
		else if ( place == 4 )
			return @"泥棒かもしれないから\r警察に電話する";
		else if ( place == 5 )
			return @"トラブルに直面した時の\rアンタの行動は、\rアンタが普段、何を基準に\r物事を判断し行動をしている\rのかを診断できるのよ。";
		else if ( place == 6 )
			return @"電気をつけて、\r視覚から新たな情報を\r得ようとしたアンタ。\r何でもやってみて、\rその目で確かめたり、\r経験したことを基準に\r行動するタイプね。\rトラブルが起こっても、\r冷静に事実を追求して\r対処できる人間よ。ただ、\r経験したことのない出来事には\rどう対処して良いのか分からず。\r言ってしまえば\r極普通の人間ね、アンタは。";
		else if ( place == 7 )
			return @"自ら行動を起こすわけでは\rないけど、現状から\r手掛かりを探したアンタ。\rアクションに出るよりも、\rまずは慎重に物事を見て\r行動するタイプね。\r何でも\r「とりあえず様子見てから」的\rなことが多くない？\r恋愛でも受け身。草食系野郎ね。\r「気付いた頃には時すでに遅し」\r何てよくあることで、世の中は\r待ってくれない事が多いのよ。";
		else if ( place == 8 )
			return @"一つの事からあらゆる可能性を\r想像しちゃうのがアンタよ。\r行動する前に、\r最悪な事態まであらゆる事態を\r想定しておかなければ\r不安なタイプね。でも、\r全部の可能性を洗い出すなんて\r不可能！\r予期せぬ事態が時には\rチャンスを呼び込むことだって\rあるんだからね！人生、\r石橋を叩いて渡ってばかりじゃ、\r面白いことにならないわよ！";
		else if ( place == 9 )
			return @"物事から感じ取ったことを\r素直に受け止め、\rすぐ行動に移すのがアンタ。\rちょっと早とちりな行動が\r目立つ時もあるわね。\r思いこんだら、\rそれしか考えられなくなるから、\r騙されやすいタイプでもあるわ。\r恋でも一目惚れが多いでしょ。\r1人で燃え上がって\r妄想に浸るのも良いけど\r一歩引いた目線で物事を見る\r判断力を養いなさい、\rこの妄想列車野郎！";
	}
	else if ( quizNo == 9 ) {
		
		if ( place == 0 )
			return @"引っ越しを考えているあなた。\rなじみの不動産屋に\r勧められたのが、\r古い一軒家だった。\r見に行った時、\r最初にあなたの目についたのは何？";
		else if ( place == 1 )
			return @"クモの巣";
		else if ( place == 2 )
			return @"色あせた壁紙";
		else if ( place == 3 )
			return @"年代物の古時計";
		else if ( place == 4 )
			return @"アンティーク調の木目細工";
		else if ( place == 5 )
			return @"探していた条件と\rかけ離れた家を見た時に、\rマイナス面を見るか、それとも\rプラスの価値に目をやるかで\r初対面の異性を前にした時に\rアンタが相手のことを\rどうやって判断するかを診断。";
		else if ( place == 6 )
			return @"アンタは家を見る以前に、\r古くさい家の状態に\r目がいってしまったわね。\rそんなに嫌？クモの巣が。\r掃除すればいいんじゃないの？\r私生活でも寝癖がついていたり、\r目ヤニがついている相手を\rそれだけでダメな奴と\r判断しちゃうところない？\r「外見重視・冷酷非情」野郎ね。";
		else if ( place == 7 )
			return @"手入れをすれば何とかなる壁紙。\rちょっと古いけど、\r変える事は出来る物に\r着目したわね。\r壁紙はアンタの好きに\r変えるがいいわ。同じように\r初対面の相手の髪型が変なら、\r指摘して変えさせるタイプね。\rアンタは外見重視だけど、\r気に入らないところは\r自分が変えるタイプの人間。\r相手を自分色に染めてやろう\rなんて思ってるでしょ。\r勝手にすれば？";
		else if ( place == 8 )
			return @"チクタクチクタク・・\rこの一軒家をずっと守ってきた\r年代物の古時計。\r愛着が湧くかもね。\rアンタは初対面で問題が\r山ほどありそうな相手でも、\r価値のある部分を\r探し出すタイプ。逆に言うと\rダメダメな相手でも、\rちょっと良い所があれば、\rそこにコロっといっちゃう。\r「この人の良さを理解できる\r　のは自分だけ」なんて・・・\rいつまでも勝手に酔ってなさい！";
		else if ( place == 9 )
			return @"アンタに一般的な外見的要素は\rあまり関係ないみたいね。\r自分にとっての価値が特化した\r相手を選ぶタイプね。\r他人から見ると「何でこの人が、\rこの外見の相手と？」と\r疑問を抱かせるタイプだったり\rするわね。\r異性の趣味が変わってるって\r友達から言われない？";
	}
	else if ( quizNo == 10 ) {
		
		if ( place == 0 )
			return @"あなたは、世界でもっとも\r偉大な博士の研究室に\rお邪魔しました。博士が\r「なんでも教えてあげる」と\r言ってくれています。何を教わる？";
		else if ( place == 1 )
			return @"世界を救ったどんな病気にも\r効く万能薬の作り方";
		else if ( place == 2 )
			return @"博士が開発した\rまだ世には出ていない\rハイテクロボットの作り方";
		else if ( place == 3 )
			return @"現在 博士が開発中の\rスーパーコンピューターの\r設計図";
		else if ( place == 4 )
			return @"まだ開発されてない博士の\rアイデアが詰まったネタ帳";
		else if ( place == 5 )
			return @"すでに開発・実証されたモノに\r興味を持つか、未来を見据えて\rこれからの可能性に\r興味を持つかで\rアンタが夢と現実、どちらを\r大切にしているかを診断よ。";
		else if ( place == 6 )
			return @"既に\r効果が実証されているモノに\r興味を示したアンタは、\r将来の可能性なんかは\r一切信用せず、\r現在の価値にしか興味がない。\r堅実な生き方をしているタイプね。\r夢なんかより、今日の幸せ。\rそう思ってるでしょ？";
		else if ( place == 7 )
			return @"効果は未知数だけど、\r既に開発されているモノに\r興味を示したアンタ。\r夢を追いたいけど、\r結局いつも現実を気にして\r諦めてしまう悲しい人間でしょ？\r恐怖を克服して、\rたまには夢にかけるのも\rいいんじゃないの？";
		else if ( place == 8 )
			return @"まだ開発途中だけど\r実現の可能性が高いものを\r選んだのがアンタよ。\r夢は見るが、\r「堅実な夢」しか見ない\rどっちつかずのタイプね。\rアンタは、\r大きい「夢」を追うより、\r近い将来の「目標」に向かって\r頑張るタイプよ。\rどうせ夢を見るなら思いっきり\r大きな夢を追ってみなさいよ！";
		else if ( place == 9 )
			return @"博士すら手をつけていない\rネタ帳に手を伸ばしたアンタ。\r相当なチャレンジャーね。\r未来の可能性にかけて\r夢を追い続ける「夢追い人」よ。\r今も夢を追いかけてる\r真っ最中だったりして！素敵よ！\rでもね、現実に目をつぶって\r未来ばかり見るのは\rバカがやることよ。だって、\rあなたは世界で最も偉大な博士\rじゃないんだから！（笑）";
	}
	else if ( quizNo == 11 ) {
		
		if ( place == 0 )
			return @"恋人と景色が綺麗な海岸へ\r出かけました。\r柔らかな日差しと、爽やかな風。\rあなたならどこでお茶する？";
		else if ( place == 1 )
			return @"砂浜で太陽の光を浴びながら";
		else if ( place == 2 )
			return @"大きな木の木陰で\r風を感じながら";
		else if ( place == 3 )
			return @"コテージのテラスで\rアロマを焚きながら";
		else if ( place == 4 )
			return @"レストランの中で\r音楽を聴きながら";
		else if ( place == 5 )
			return @"景色がキレイな海岸で\rあなたがどこでお茶をするかで、\rアンタの「ロマンチック」度を\r診断するわ。";
		else if ( place == 6 )
			return @"美しい景色を独占して、\r柔らかな太陽に見守られながら、\r２人だけのティータイムって\rことね。アンタは、\rものすごいロマンチストよ。\rアンタ独特の世界感で\r何かと演出するわね。それを\r喜ぶ相手ならいいけど、\rそうじゃない相手は\r退屈の極みよ。それどころか、\r気持ち悪いなんてことも\r言われるかもね。\r相手の表情をよく見て、\r自分のロマンチックな言動が、\rスベッてないかどうか\r一度チェックしてみなさい。";
		else if ( place == 7 )
			return @"日差しが強くなっても、\r木陰に入れば安心ね。\rお茶を続けられるわ。\rアンタは、\rムードを大切にしながらも\rその場で最良の方法を見つける。\r言ってみれば、\rよくできたタイプね。\rロマンチックなことも、\r嫌みなくスマートに出来る人間。\r安全にロマンチックな\r演出をする憎い野郎よ。";
		else if ( place == 8 )
			return @"景色も雰囲気も楽しめるし、\r雨が降ったら室内に入ればいい。\rアンタは、人生において全く\r危ないことをしない。\r判断にも大きな狂いがないから、\r今まであまり大失敗をしたこと\r無いんじゃない？\rはっきり言って、\rロマンチック度は少ない方よ。\r休日に恋愛映画でも見て、\rちゃんと勉強しなさいよ。\rアンタに足りたいのはそこよ！";
		else if ( place == 9 )
			return @"残念ね。\rアンタは、ロマンチックさの\r欠片も持っていないようだわ。\r海辺の景色も、\r何もかも興味ないのね。\r興味があったとしても\r室内だと意味無くない？\r恐ろしく合理的で、現実主義。\r旅行に行っても冒険しないでしょ？\r危ない場所や、\r知らない場所を嫌うわね？\r気をつけなさい。\rアンタみたいなタイプは、\r自分と真逆の\r大胆な行動をする異性に\r惹かれたりすることがあるわ。\r結局、相性が合わなくて、破局。\r事故にあうわ。";
	}
	else if ( quizNo == 12 ) {
		
		if ( place == 0 )
			return @"高い山の向こうに\rあなたの恋人がいます。\r恋人の元までどうやっていく？";
		else if ( place == 1 )
			return @"気球でいく";
		else if ( place == 2 )
			return @"ヘリコプターでいく";
		else if ( place == 3 )
			return @"歩いていく";
		else if ( place == 4 )
			return @"自動車でいく";
		else if ( place == 5 )
			return @"山というのは\rアンタの恋愛生活において\r立ちはだかる障害を司るわ。\rどのように山を越えるのかで、\rアンタの恋愛や行動する時の\r「衝動性」を診断よ";
		else if ( place == 6 )
			return @"あらあら、バカかしら？\r何、気球で行っちゃってるの？\r速くもない、確実でもない。\rなんとなくロマンチックな\r方法をとったアンタは\r衝動で動きすぎ！\r恋愛でも、\r悲劇や恋愛映画の主役に\rなってるつもりで、\r大胆な行動に出るわね。\rタイミングがズレると\r周囲や相手をドン引き\rさせるから気をつけて！";
		else if ( place == 7 )
			return @"一番速いヘリコプターに\r乗ったアンタ。\rいつも行動するチャンスを\r伺っていて、\r「今だ！」と思うと\r突然、大胆に行動するわね。\r不倫にかけおち、\r友達の恋人と・・・\rなんてことに心当たりが\rあるんじゃない？\r狩りをするオオカミなんて\rカッコイイこと言えるのも、\r若い内だけよ。気づいたら\r一人ぼっちになってた。\rなんてことにならないように\r気を付けるのよ！";
		else if ( place == 8 )
			return @"わざわざ、自分の足で\rテクテク山を超えたアンタは、\r周りに迷惑を一切かけずに、\r慎重さを重視して\r行動するタイプよ。\rちょっと行動が地味だけど、\r恋愛においても、\r粘り強さではナンバー１。\r失敗してもなかなかメゲないのが\rアンタの持ち味よ。\rただ、引き際を間違えて\rストーカー扱い。なんてことに\rならないようにするのよ！";
		else if ( place == 9 )
			return @"行動力はあるが、\r確実な方法を考えてから\r動くタイプ。\r行動と感情を分けられる、\r冷静な人間ね。\r最も成功率は高そうだけど、\r恋愛でドラマチックな演出は苦手。\r過程より結果がすべての\r実務家タイプね。\r結果を求めるのも良いけど\rたまには韓国ドラマでも見て\rちょっとは\rロマンスを勉強しなさい！";
	}
	else if ( quizNo == 13 ) {
		
		if ( place == 0 )
			return @"友人から「恋人と喧嘩した」\rと相談を受けたあなた。\r明らかに友人の方に非があるが\r悪びれた様子がない。\rあなたは友人に何て声をかける？";
		else if ( place == 1 )
			return @"最低な人だね。あなたは悪くないよ。";
		else if ( place == 2 )
			return @"大変だったね、大丈夫？";
		else if ( place == 3 )
			return @"気持ちは分かるけど\rアナタにも非があるかもね。";
		else if ( place == 4 )
			return @"あなたから謝った方が\r良いんじゃない。";
		else if ( place == 5 )
			return @"相談を受けた際に、\r自分の思った意見を\rまっすぐに言うのか、\rそれとも相手が聞きたい\rような事を言うのか。\rアンタが身近な人と接する際の\rスタンスを診断するわよ。";
		else if ( place == 6 )
			return @"アンタは、\r自分の本音とは関係なく、\rとにかく目の前にいる友人が\r楽になることを言ったわね。\rそんな、アンタは何かと\r情に流されて、自分の意見が\r言えずストレスを感じることが\rあるわね。時にはしっかりと\r意見を言うことも\r相手の為かもしれないわよ。";
		else if ( place == 7 )
			return @"ちがう意見を持っているのに、\r友人の気持ちを吐き出させて\r相槌を打つことに努めたアンタ。\r自分の意見を言うよりも、\r相手を楽にすることを\r第一に考える人間ね。";
		else if ( place == 8 )
			return @"アンタは、\r相手に無理強いはしないものの、\r自分が感じたことは\rハッキリと発言したわね。\r自分の考え方を認めてほしいし、\r相手の考え方も認める。\r人は皆、それぞれ違っている\rということを楽しむタイプね。";
		else if ( place == 9 )
			return @"アンタは、\r相手がどう感じているか\rという事は関係なく、\r自分がどう思うかをしっかりと\r主張して、行動させる。\r情には流されず、自分の思想は\rしっかりと持つタイプね。でも、\rあなたの意見じゃなくて、\rただ話を聞いて欲しい時って\rあるものよ。\rそこに気づかないと、\rいつか誰も相談してくれなく\rなっちゃうわよ。";
	}
	else if ( quizNo == 14 ) {
		
		if ( place == 0 )
			return @"６歳の子供と一緒に\rファミレスへ行ったあなた\r席にも座らず\r店内を走り回る子供に\rあなたは何て叱る？";
		else if ( place == 1 )
			return @"何も言わずに放っておく";
		else if ( place == 2 )
			return @"店員さんに迷惑かかるから\rやめなさい！";
		else if ( place == 3 )
			return @"あの子は\r静かに座ってて偉いね！";
		else if ( place == 4 )
			return @"何してるの！\r今すぐやめなさい！";
		else if ( place == 5 )
			return @"子供にはなかなか分からない\r社会の規律。\rそれを、どう教えるのか。\rその教え方でアンタ自身の\r規律に対しての考え方がわかるわ。";
		else if ( place == 6 )
			return @"「Don`t think. Feel!!」\r(考えるな、感じろ)　\rブルース・リーが言った言葉よ。\rアンタにとって、\r決められたルールは\rどうでもよくて、\r自分自身が何をしたいか？\rそれが全てなのね。\r言ってみれば、\r「自分こそがルール」なんて\r思ってるんでしょ？\r行き過ぎると、\r本当に他人に嫌われるわよ！\rいい加減にして！";
		else if ( place == 7 )
			return @"何をしたっていいけど、\r他人に迷惑はかけるな・・・\rアンタは、物事の\r「本音とたてまえ」を\rよく分かっているわね。\rルールを大切にしている\rフリをするのが巧いのよ。\r他人への配慮も忘れないし。\rけど、ここぞという時は\rそれを無視して感情のままに\r行動する人間ね。";
		else if ( place == 8 )
			return @"「他人の目」を感じさせて、\r自発的にルールを守らせよう\rとしたアンタ。\rアンタ自身も、他人の目を\r一番気にして生きているようね。\r周りから中傷される\rようなことはしないし、\r家のご近所さんの目も\r気にして生活してるのね。\rこの保守的野郎が！\r基本的にアンタが\rルールを破ることはないわ。";
		else if ( place == 9 )
			return @"個人の考えはどうであれ、\r社会の規律を乱すことは\r問答無用と考えているのがアンタ。\r皆が統一した基準を持って\r生活すべきだと考えるタイプで、\rそれを他人にも押し付けるわ。\r例外があるということを\rわかってはいても、\rそれを認めないのね。\r疲れるでしょ？そんな生き方。\r例外だってあるんだから、\rたまには好きにしたっていいのよ！";
	}
	else if ( quizNo == 15 ) {
		
		if ( place == 0 )
			return @"次の中であなたが\r最も親しみを感じるのはどれ？";
		else if ( place == 1 )
			return @"ハト";
		else if ( place == 2 )
			return @"オウム";
		else if ( place == 3 )
			return @"フクロウ";
		else if ( place == 4 )
			return @"鷹";
		else if ( place == 5 )
			return @"鳥というのは昔から\r何かを象徴する動物として\r物語などに描かれてきたもの。\rそして、一番親しみを感じる\rということは、\r好意を寄せていると\r捉えることができるわ。\rつまり、どの鳥を選んだかで\rアンタがどのようなタイプに\r好意を寄せるかがわかるのよ。";
		else if ( place == 6 )
			return @"平和の象徴として\r認識されているハト。\rアンタは何事も平和に、\r物事の調和を求める感情豊かな\r人間に惹かれるみたいね。\r今までジョン・レノンみたいな\r恋人が多かったでしょ！";
		else if ( place == 7 )
			return @"モノマネが得意で、\r人を和ませるキャラクター\rとして描かれるオウム。\rアンタは物事の道理を\r踏まえつつも何事にも\r機転を利かせて、\r自由な発想ができる人間に\r惹かれるみたいね。\r今までチャップリンみたいな\r恋人が多かったでしょ！";
		else if ( place == 8 )
			return @"童話や昔話でも論理的で、\r物知りなキャラクターとして\r描かれるフクロウ。\rアンタは、分析力のある\r知性あふれる人間に\r惹かれるみたいね。\r今までエジソンみたいな\r恋人が多かったでしょ！";
		else if ( place == 9 )
			return @"クールで論理的、競争心の高い\rキャラクターとして描かれる鷹。\rアンタは無愛想だけどカッコよく、\r何事も一貫性を持った人に\r惹かれるみたいね。\r今まで坂本龍馬みたいな\r恋人が多かったでしょ！";
	}
	else if ( quizNo == 16 ) {
		
		if ( place == 0 )
			return @"今日はあなたの家で\rホームパーティー。\r料理も飾りつけも数日前から\r準備をし後は出迎えるだけ！\rと一息ついていた時友人から\r「人数増やしていい？」と\r電話が入った。\rあんたならどう思う？";
		else if ( place == 1 )
			return @"せっかく完璧に準備したのに\r嫌だな。できれば断りたい";
		else if ( place == 2 )
			return @"料理を増やさなきゃ！\r食材を買いに行こう！";
		else if ( place == 3 )
			return @"ウェルカムだけど、\rなんか一品持ってきて！";
		else if ( place == 4 )
			return @"人はたくさんいる方が\r楽しいし、全然OK！";
		else if ( place == 5 )
			return @"準備したホームパーティーに\r突然の追加客！\rそれは、アンタに降り掛かる\r突然のトラブルを表すわ。\rトラブルに直面した際の\r対応の仕方で、\rあんたの対応能力がわかるわ。";
		else if ( place == 6 )
			return @"断りたいって思うアンタ！\r一度決めたことは最後まで\r変更なく進めたいタイプね。\r多少、完璧主義すぎる部分も\rあって、他人の影響で何かを\r変えられることを拒否する。\r頑固な芸術家タイプでもあるわ。\rトラブルは大嫌いね。\r被害を最小限に抑えるどころか、\rトラブル対応は他人に任せたい！\rって思ってない？";
		else if ( place == 7 )
			return @"食材を買って対応したアンタは、\r何事にも柔軟に対応できるけど、\r基本的には自分が決めた枠を\r崩したくないタイプね。\rその為には犠牲を払ってでも、\r自分のビジョンや感性を\r追い求める人間だわ。";
		else if ( place == 8 )
			return @"アンタはトラブルから逃げずに、\rうまく利用して、\rより有益な方向に持ち込もう\rとするタイプだわ。\rトラブルをマイナスな物として\r捉えずに、プラスと思うことで\r自分のモチベーションを保つ\rセルフコントロールの\r上手い人間ね。";
		else if ( place == 9 )
			return @"アンタは、トラブルが大好き！\rそれが人生の醍醐味ぐらいに\r思っているでしょ？\rどんな状況でも楽しんじゃう、\rタフな人間なのはいいけど、\r自らトラブルに飛び込んで\rいっちゃう面もあるから、\r周りからしたらヒヤヒヤ者だわ。";
	}
	else if ( quizNo == 17 ) {
		
		if ( place == 0 )
			return @"ふらりと立ち寄った温泉街。\rとても気に入ったあなたは、\r１泊することに。\rあなたはどうやって\rホテルを決めた？";
		else if ( place == 1 )
			return @"観光案内所に行き、\r空いている部屋を即決";
		else if ( place == 2 )
			return @"タクシー運転手の\rオススメを聞いて決めた";
		else if ( place == 3 )
			return @"複数あるホテルのパンフレット\rから吟味して選択";
		else if ( place == 4 )
			return @"街を一周して気に入った\rホテルに飛び込んだ";
		else if ( place == 5 )
			return @"リラックスできる「温泉街」は、\rアンタが心を寄せる\r恋人を表すのよ。\rアンタがホテルをどうやって\r選んだかで、アンタの\r恋人の選び方が分かるわよ。";
		else if ( place == 6 )
			return @"とにかく空いている部屋を\r即決したアンタは、\r何事も早く決めたいって願望が\r強いようね。恋人も、\rとにかく条件に合うならば、\rそんなに相手のことを\r知らなくても\rすぐに付き合ってみる。\r過程を楽しむことより、\r結果を重要視するタイプね。\r自分が駄目だと思ったら\rスッパリ相手と別れる。\r相手からすれば、\r情がない人間って\r思われてるかもね。";
		else if ( place == 7 )
			return @"タクシー運転手の\rオススメ宿に泊まったアンタ。\r他人が評価するものに弱いようね。\r恋人も、\r周りの人間の評価で判断する。\r相手と付き合う前に、\r自分の友人に会わせて\r客観的な評価を聞いてみたり\rするでしょ？自分じゃ\r判断しきれないのかしらね。\r恋愛は人任せにしないで、\r自分の目を信じなさい！";
		else if ( place == 8 )
			return @"条件を吟味して、\r複数の選択肢から\r１つを選んだアンタ。\r恋人に対してもそうだね。\r異性同士を客観的に\r比較してみて、その中で\r一番条件に合う相手と付き合う。\r例え恋人がいても、\r常にもっと条件に合う相手が\rいないか探しているタイプだよ。";
		else if ( place == 9 )
			return @"街を一周してから\rホテルを選んだアンタ。\r恋人に対しても同じだね。\r一度、相手の全てを知ってみて、\rそれから恋人にするかどうかを\r決めたいと思っている。一番\r慎重に相手を選ぶタイプだね。\rパーフェクトな相手を探しすぎて\rなかなか恋人ができないんだろ。\rそんな相手、世の中に\rいないかもしれないんだからね！";
	}
	else if ( quizNo == 18 ) {
		
		if ( place == 0 )
			return @"自分のベッドを\r思い浮かべてください。\r今の状態に一番近いのはどれ？";
		else if ( place == 1 )
			return @"ホテル並に\rキレイに整えられている";
		else if ( place == 2 )
			return @"ベッドは整ってるけど\rパジャマが散らかってる";
		else if ( place == 3 )
			return @"掛け布団だけ整えてある";
		else if ( place == 4 )
			return @"起きた時のままでパジャマも\r布団も散乱状態";
		else if ( place == 5 )
			return @"整理整頓を心がけていても、\rつい忘れがちなのが\r完全プライベートなベッド。\r整理整頓ができているか否かで、\rアンタがどんな人間かが\rわかっちゃうわ。";
		else if ( place == 6 )
			return @"細部に至るまで整理整頓が\rできているアンタは、\r几帳面でキレイ好きな人間。\r起きたらまずベッドを整頓\rすることが、\r癖づいているのかもね。\rいい習慣だわ。\rその習慣で、アンタは毎朝\r心のコンディションを\r整えているのよ。\rアンタは基本的に規則正しく、\r規律を守って生きていきたい\rって思ってるのよ。";
		else if ( place == 7 )
			return @"整頓を心がけているのに、\rちょっと詰めが甘いわね。\rどうせなら、\rパジャマもたたみなさいよ。\rまあ、それぐらいの方が\r神経質すぎず愛きょうが\rあっていいのかもしれないけど。\rアンタは、基本的に規律を守って\r生きていくんだけど、\rほんのスパイス程度の\r“刺激”や“冒険”を\r生活に求めるタイプね。";
		else if ( place == 8 )
			return @"散らかっていることを\r恥ずかしがるものの、\r整頓が苦手なアンタ。\rなんとなく見た目の体裁を\r気にする。\r他人への見栄だけじゃなくて、\r自分への見栄もあるから\rタチが悪いわね。\r愛車はとりあえず\r外車に乗っとけってタイプね。";
		else if ( place == 9 )
			return @"整理整頓なんて\r全く気にしてないアンタ。\rベッドの乱れは、心の乱れ。\r最近、生活が乱れてるようね。\rそれとも、\r元々が乱れた人間なのかしら？\rその調子じゃあ、洗濯物も\r干しっぱなしなんて事が多くない？\r気持ちを引き締めなさい！";
	}
	else if ( quizNo == 19 ) {
		
		if ( place == 0 )
			return @"あなたは富士山を登るツアーに\r参加しました。\r途中でよった休憩所で\rあなたは何を買いましたか？";
		else if ( place == 1 )
			return @"富士山の登り方　完全ガイド";
		else if ( place == 2 )
			return @"頑丈な杖";
		else if ( place == 3 )
			return @"富士山の絶品グルメガイド";
		else if ( place == 4 )
			return @"お土産";
		else if ( place == 5 )
			return @"頂上まで登ることが\r大きな目標である登山。\r目的を達成する為に\r役立つモノを選ぶか、\r目的を臨機応変に捉え\r楽しめるモノを選ぶかで、\rアンタが何かに取り組む時の\r精神状態を診断するわ。";
		else if ( place == 6 )
			return @"目的の為にまずは情報を\r得ることを選んだアンタ。\r自分なりに計画を立て、\rその計画に向けて\r最短の方法で取り組む。\r言ってみればアンタは\r任務を淡々とこなす\rスパイみたいな人間よ。\r残念なことに遊び心が乏しいわね。";
		else if ( place == 7 )
			return @"アンタはどうやったら\r目的をより効率良く、\r楽に達成できるかを考え、\r自分を補助する物を\r手に入れたわね。\r健気に目標に向かう\r真面目な人間だけど、\rいかに楽をして物事を\r達成するかを考えすぎ。\r他人から見たら、サボり人間に\r見える時があるから気をつけて。";
		else if ( place == 8 )
			return @"目標を達成する過程で、\rグルメでエンジョイしちゃう\r気のアンタ。どうやったら\r人生を楽しめるかを\rいつも考えているわね。\r何かに取り組む時も、\r目標以外で、何か楽しみを\r探し求めるタイプよ。それが\rアンタのモチベーションに\rなってるんだわ。";
		else if ( place == 9 )
			return @"目標を達成する為には、\rまったく関係のないものを\r選んだアンタ。っていうか\r既に目標を達成した気分に\rなってない？\r何かに取り組む時、\r気が付いたら目標達成を忘れて、\rちがう方向に\rそれちゃってることない？\rで、気が付いたらちがう目標の\r為に動いているみたいな・・。\rアンタの脱線癖は周りには迷惑。\rちょっとは\r自分を客観的に見なさい。";
	}
	else if ( quizNo == 20 ) {
		
		if ( place == 0 )
			return @"２週間後に部屋の更新が\r迫っているあなた。\r１ヶ月前から探し始めてる\rにも関わらず、\r条件に合う部屋が\r見つかっていない。\rあなたならどうする？";
		else if ( place == 1 )
			return @"探すのをやめて\r今まで見た中から決める";
		else if ( place == 2 )
			return @"最後の一回！と言って\r違う不動産屋を訪ねる";
		else if ( place == 3 )
			return @"ギリギリまで粘って\rもっと選択肢を増やす";
		else if ( place == 4 )
			return @"最後まで探して、無かったら\r今の部屋を更新する";
		else if ( place == 5 )
			return @"条件に合わないものを決める時に\rどこで妥協点を見つけるかで、\rアンタが恋愛の相手を\r見つける時の\r心理状況を判断する問題よ。";
		else if ( place == 6 )
			return @"アンタは、相手への妥協点を\r早めに見つけるタイプね。\rある意味すごく決断力があるわ。\r恋愛がしたくなったら\r手持ちのカードから、\r素早く相手を選ぶでしょ。\rだから「なんでこいつと\r付き合ってんだろ？」なんて\r自分でもわからなくなることが\rあるんじゃない？\r決断力と恋愛は必ずしも\rイコールじゃないからね！";
		else if ( place == 7 )
			return @"さらなる選択肢を求めて、\r最後の一押しを粘るアンタ。\rもっと良い相手が\rいるんじゃないか・・けど、\rそんなこと考えていたら\rいつまでたっても\r恋愛なんかできない・・・って\r葛藤をいつも抱いているわね。\rウジウジしてないで\rビシっとしなさい！さっさと\r乳離れして、自分で人生を\r切り開いてみなさいよ！";
		else if ( place == 8 )
			return @"妥協が嫌いなのね、アンタ。\r色々と、やり尽くさないと\r決められない、けどいつかは\r妥協しないと、永遠に\r相手なんてやってこない事を\r知っている。\r自分が納得いくまでは、\r思いっきり色んな所へ行って\r相手を探したいのね。\rそんなアンタには言うことはない！\rいつまでも探してなさい！";
		else if ( place == 9 )
			return @"諦めきれず粘りに粘って\r最終的には妥協点を見つけられず、\r選択肢にはなかった最終手段を\r持ち出してくるアンタ。結局、\r別れた相手とヨリを戻したり、\rずっと相手がいないまま\r過ごしたりすることが多くない？\r結婚？そんなのアンタは\r考えない方がいいわね。\r理想の相手を追い求めて\rあなたが結婚できるころには\r地球はもう滅びてるわよ！";
	}
	
	return nil;
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( (!m_bFromFit || m_profileNo == -1) && [super isAsked] == false ) {
		
		[super showMoveConfPage:1];
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	
	if( m_bFromFit ){
		
		if ( m_profileNo == -1 )
			[appli.m_gpsCtrl closeChkResultPage];
		else
			[appli.m_gpsCtrl closeProfilePage];
	}
	else {
		[appli.m_gpsCtrl closeResultPage];
	}
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( (!m_bFromFit || m_profileNo == -1) && [super isAsked] == false ) {
		
		[super showMoveConfPage:2];
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	if( m_bFromFit ){
		
		if ( m_profileNo == -1 )
			[appli.m_gpsCtrl closeChkResultPage];
		else
			[appli.m_gpsCtrl closeProfilePage];
	}
	else {
		[appli.m_gpsCtrl closeResultPage];
	}
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( (!m_bFromFit || m_profileNo == -1) && [super isAsked] == false ) {
		
		[super showMoveConfPage:3];
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	if( m_bFromFit ){
		
		if ( m_profileNo == -1 )
			[appli.m_gpsCtrl closeChkResultPage];
		else
			[appli.m_gpsCtrl closeProfilePage];
	}
	else {
		[appli.m_gpsCtrl closeResultPage];
	}
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( (!m_bFromFit || m_profileNo == -1) && [super isAsked] == false ) {
		
		[super showMoveConfPage:4];
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	if( m_bFromFit ){
		
		if ( m_profileNo == -1 )
			[appli.m_gpsCtrl closeChkResultPage];
		else
			[appli.m_gpsCtrl closeProfilePage];
	}
	else {
		[appli.m_gpsCtrl closeResultPage];
	}
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( (!m_bFromFit || m_profileNo == -1) && [super isAsked] == false ) {
		
		[super showMoveConfPage:5];
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	if( m_bFromFit ){
		
		if ( m_profileNo == -1 )
			[appli.m_gpsCtrl closeChkResultPage];
		else
			[appli.m_gpsCtrl closeProfilePage];
	}
	else {
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

-(IBAction)selToBack:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	if ( !m_bFromFit ) {
		
		resultController* oya = (resultController*)m_parent;
		[oya closeQuesHelpPage];
	}
	else {
		
		if ( m_profileNo == -1 ) {

			chkResultController* oya = (chkResultController*)m_parent;
			[oya closeQuesHelpPage];
		}
		else {
			
			profileController* oya = (profileController*)m_parent;
			[oya closeQuesHelpPage];
		}
	}
}

@end
