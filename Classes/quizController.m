//
//  quizController.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "glassshoesAppDelegate.h"
#import "quizController.h"
#import "glassShoes.h"
#import "question.h"
#import "myGPSController.h"

@implementation quizController

@synthesize m_quesNoImg;
@synthesize m_quesImg;

@synthesize m_answersView;
@synthesize m_a1Btn;
@synthesize m_a2Btn;
@synthesize m_a3Btn;
@synthesize m_a4Btn;
@synthesize m_line1Img;
@synthesize m_line2Img;
@synthesize m_line3Img;

@synthesize m_backBtn;
@synthesize m_chkBtn;
@synthesize m_lastBtn;

@synthesize m_outImg;
@synthesize m_bkImg;
@synthesize m_blackImg;
@synthesize m_wakuImg;
@synthesize m_titleImg;
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
		self.m_quesNoImg = nil;
		self.m_quesImg = nil;
		
		m_starImg.alpha = 0;
		m_star2Img.alpha = 0;
		m_star3Img.alpha = 0;
		
		self.m_quesNoImg = nil;
		self.m_quesImg = nil;
		m_mode = 0;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	m_quesNoImg.alpha = 0;
	m_quesImg.alpha = 0;
	m_answersView.alpha = 0;
	//m_backBtn.alpha = 0;
	
    [super viewDidLoad];

	[self showStart1];
}

- (void)showStart1{
	
	m_starMode = 0;
	
	float_t ani_time = 5.0;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(showStart2)];
	[UIView setAnimationDuration:ani_time];	// 0.2秒でアニメーション
	m_starImg.alpha = 0;
	m_star2Img.alpha = 1;
	[UIView commitAnimations];
}

- (void)showStart2{

	m_starMode = 1;

	float_t ani_time = 5.0;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(showStart3)];
	[UIView setAnimationDuration:ani_time];	// 0.2秒でアニメーション
	m_star2Img.alpha = 0;
	m_star3Img.alpha = 1;
	[UIView commitAnimations];
}

- (void)showStart3{

	m_starMode = 2;
	float_t ani_time = 5.0;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(showStart1)];
	[UIView setAnimationDuration:ani_time];	// 0.2秒でアニメーション
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
	
	[m_answersView release];
	[m_a1Btn release];
	[m_a2Btn release];
	[m_a3Btn release];
	[m_a4Btn release];
	[m_line1Img release];
	[m_line2Img release];
	[m_line3Img release];
	[m_wakuImg release];
	
	if ( m_quesNoImg != nil ) {
		[m_quesNoImg release];
		m_quesNoImg = nil;
	}

	if ( m_quesImg != nil ) {
		[m_quesImg release];
		m_quesImg = nil;
	}
	
	[m_backBtn release];	
	[m_chkBtn release];
	[m_lastBtn release];
	
	[m_outImg release];
	[m_blackImg release];
	[m_bkImg release];
	[m_titleImg release];
	[m_starImg release];
	[m_star2Img release];
	[m_star3Img release];
	
	[m_top release];
	[m_profile release];
	[m_history release];
	[m_search release];
	[m_setting release];
	[m_tabBar release];	
	
    [super dealloc];
}

-(void)setInfo:(BOOL)bSingle quizNo:(NSInteger)quizNo num:(NSInteger)num{
	
	m_bSingle = bSingle;
	m_number = num;
	m_blackImg.hidden = YES;
	
	[self prepareQues:quizNo];	
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


-(void)prepareQues:(NSInteger)quizNo{

	glassShoes *gs = [glassShoes sharedInstance];
	
	m_curQuiz = quizNo;
	
	if ( m_quesNoImg != nil ) {
		
		[m_quesNoImg removeFromSuperview];
		[m_quesNoImg release];
		m_quesNoImg = nil;
	}
	
	if ( m_quesImg != nil ) {
		
		[m_quesImg removeFromSuperview];
		[m_quesImg release];
		m_quesImg = nil;
	}
	
	// Quiz No.
	NSString* str = [[NSString alloc] initWithFormat:@"q%d_93_93_%d", (m_curQuiz+1), (m_curQuiz+1)];
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:str ofType:@"png"]];
	UIImageView* v = [[UIImageView alloc] initWithImage:img];
	self.m_quesNoImg = v;
	[v release];
	[img release];
	
	m_quesNoImg.frame = CGRectMake( 41, 46, img.size.width/2, img.size.height/2 );
	
	m_quesNoImg.alpha = 0;
	[self.view addSubview:m_quesNoImg];
	[str release];
	
	m_backBtn.hidden = NO;
	m_chkBtn.hidden = YES;
	m_lastBtn.hidden = YES;
	
	NSInteger quizH = 0;
	
	question* q;
	if ( m_bSingle )
		q = [gs getSingleQuiz:m_curQuiz];
	else
		q = [gs getMutiQuiz:m_curQuiz];
	
	NSInteger curQuiz = [q getQuizNo];
	
	if ( m_bSingle )
		str = [[NSString alloc] initWithFormat:@"q%d_ques", curQuiz];
	else
		str = [[NSString alloc] initWithFormat:@"m%d_ques", curQuiz];
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:str ofType:@"png"]];
	v = [[UIImageView alloc] initWithImage:img];
	self.m_quesImg = v;
	[v release];
	quizH = img.size.height/2;
	//m_quesImg.frame = CGRectMake( 30, 90, img.size.width/2, quizH );
    m_quesImg.frame = CGRectMake( 30, 80, img.size.width/2, quizH ); // chg 2011.09.22
	
	m_quesImg.alpha = 0;
	[self.view addSubview:m_quesImg];
	[img release];
	[str release];
	
	NSInteger y = 0;
	
	for ( int i= 0; i < 4; i++ ) {
		
		NSInteger answerNo = [q getAnswer:i];
		
		if ( m_bSingle ) 
			str = [[NSString alloc] initWithFormat:@"q%d_a%d", curQuiz, answerNo];
		else
			str = [[NSString alloc] initWithFormat:@"m%d_a%d", curQuiz, answerNo];
		
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:str ofType:@"png"]];
		
		if ( i == 0 ) {
			
			m_a1Btn.frame = CGRectMake( 12, y, img.size.width/2, img.size.height/2 );
			[m_a1Btn setBackgroundImage:img forState:UIControlStateNormal];
			
			y+= img.size.height/2+2;
			
			m_line1Img.frame = CGRectMake( 14, y, 271, 11 );
			y+= 13;
		}
		else if ( i == 1 ) {
			
			m_a2Btn.frame = CGRectMake( 12, y, img.size.width/2, img.size.height/2 );
			[m_a2Btn setBackgroundImage:img forState:UIControlStateNormal];
			
			y+= img.size.height/2+2;
			
			m_line2Img.frame = CGRectMake( 14, y, 271, 11 );
			y+= 13;
		}
		else if ( i == 2 ) {
			
			m_a3Btn.frame = CGRectMake( 12, y, img.size.width/2, img.size.height/2 );
			[m_a3Btn setBackgroundImage:img forState:UIControlStateNormal];
			
			y+= img.size.height/2+2;
			
			m_line3Img.frame = CGRectMake( 14, y, 271, 11 );
			y+= 13;
		}
		else {
			m_a4Btn.frame = CGRectMake( 12, y, img.size.width/2, img.size.height/2 );
			[m_a4Btn setBackgroundImage:img forState:UIControlStateNormal];
			
			y+= img.size.height/2;
		}
		
		[img release];		
		[str release];
	}
	
	//m_answersView.frame = CGRectMake( 12, 110+quizH, 296, 310-quizH);
    m_answersView.frame = CGRectMake( 12, 90+quizH, 296, 333-quizH); // chg 2011.09.22
	m_answersView.pagingEnabled = NO;
	
	if ( 90+ quizH+ y > 352 ) {
		m_answersView.contentSize = CGSizeMake( 296, y+71 );
	}
	else {
		m_answersView.contentSize = CGSizeMake( 296, y );
	}
	
	m_answersView.showsVerticalScrollIndicator = YES;
	m_answersView.showsHorizontalScrollIndicator = NO;
	m_answersView.scrollsToTop = YES;
	m_answersView.contentOffset = CGPointMake( 0, 0);

	m_mode = 0;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(selQuizOk)];
	[UIView setAnimationDuration:1.5];	// 0.2秒でアニメーション
	
	m_quesNoImg.alpha = 1.0;
	m_quesImg.alpha = 1.0;
	m_answersView.alpha = 1.0;
	//m_backBtn.alpha = 1.0;
	
	[UIView commitAnimations];
}

-(void)selQuizOk{

	//m_backBtn.enabled = YES;
	m_mode = 0;
}

-(IBAction)selAnswerA:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 1;
	
	[self selAnswer:0];
}

-(IBAction)selAnswerB:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 2;

	[self selAnswer:1];
}

-(IBAction)selAnswerC:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 3;

	[self selAnswer:2];
}

-(IBAction)selAnswerD:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 4;

	[self selAnswer:3];
}

- (void)selAnswer:(NSInteger)sel{
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	if( m_bSingle )
		[gs setSingleQuizAnswer:m_curQuiz answer:sel];
	else
		[gs setMutiQuizAnswer:m_curQuiz answer:sel];
	
	m_nextQuiz = m_curQuiz+1;
	if( m_bSingle && m_nextQuiz == 20 ){

		m_backBtn.hidden = YES;
		m_a1Btn.enabled = NO;
		m_a2Btn.enabled = NO;
		m_a3Btn.enabled = NO;
		m_a4Btn.enabled = NO;
		m_mode = 0;
		
		m_chkBtn.alpha = 0;
		m_lastBtn.alpha = 0;
		m_blackImg.alpha = 0;
		m_chkBtn.hidden = NO;
		m_lastBtn.hidden = NO;
		m_blackImg.hidden = NO;
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDuration:1.5];	// 0.2秒でアニメーション
		
		[self.view bringSubviewToFront:m_blackImg];
		[self.view bringSubviewToFront:m_chkBtn];
		[self.view bringSubviewToFront:m_lastBtn];
		[self.view bringSubviewToFront:m_outImg];
		
		[self.view bringSubviewToFront:m_tabBar];
		[self.view bringSubviewToFront:m_top];
		[self.view bringSubviewToFront:m_profile];
		[self.view bringSubviewToFront:m_history];
		[self.view bringSubviewToFront:m_search];
		[self.view bringSubviewToFront:m_setting];
		
		m_chkBtn.alpha = 1.0;
		m_lastBtn.alpha = 1.0;
		m_blackImg.alpha = 1.0;
		
		[UIView commitAnimations];
	}
	else if( m_bSingle == false && m_nextQuiz == 5 ){
		
		glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
		[appli.m_gpsCtrl showMutiChkResultPage];
		[appli.m_gpsCtrl closeQuizPage];
	}
	else {
		
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(showQuiz)];
		[UIView setAnimationDuration:1.5];	// 0.2秒でアニメーション
		
		m_quesNoImg.alpha = 0;
		m_quesImg.alpha = 0;
		m_answersView.alpha = 0;
		//m_backBtn.alpha = 0;
		
		[UIView commitAnimations];
	}
}

-(void)showQuiz{

	[self prepareQues:(m_curQuiz+1)];
}

-(IBAction)selToCheck:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showChkPage];
	[appli.m_gpsCtrl closeQuizPage];
}

-(IBAction)selToLast:(id)sender{
	
	m_backBtn.enabled = NO;
	m_backBtn.hidden = NO;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(lastBack)];
	[UIView setAnimationDuration:1.5];	// 0.2秒でアニメーション
	
	m_chkBtn.alpha = 0;
	m_lastBtn.alpha = 0;
	m_blackImg.alpha = 0;
	
	[UIView commitAnimations];
}

-(void)lastBack{
	
	[self.view bringSubviewToFront:m_quesNoImg];
	[self.view bringSubviewToFront:m_quesImg];
	[self.view bringSubviewToFront:m_answersView];
	[self.view bringSubviewToFront:m_backBtn];
	[self.view bringSubviewToFront:m_outImg];
	
	[self.view bringSubviewToFront:m_tabBar];
	[self.view bringSubviewToFront:m_top];
	[self.view bringSubviewToFront:m_profile];
	[self.view bringSubviewToFront:m_history];
	[self.view bringSubviewToFront:m_search];
	[self.view bringSubviewToFront:m_setting];
	[self.view bringSubviewToFront:m_badgeImg];
	
	m_backBtn.enabled = YES;
	m_a1Btn.enabled = YES;
	m_a2Btn.enabled = YES;
	m_a3Btn.enabled = YES;
	m_a4Btn.enabled = YES;
	
	m_chkBtn.hidden = YES;
	m_lastBtn.hidden = YES;
	m_blackImg.hidden = YES;
	m_mode = 0;
}

-(IBAction)selToBack:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	
	if ( m_curQuiz == 0 ) {
	
		[appli.m_gpsCtrl showInputPage:m_bSingle num:m_number];
		[appli.m_gpsCtrl closeQuizPage];
	}
	else {

		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(showQuizBack)];
		[UIView setAnimationDuration:1.5];	// 0.2秒でアニメーション
		
		m_quesNoImg.alpha = 0;
		m_quesImg.alpha = 0;
		m_answersView.alpha = 0;
		//m_backBtn.alpha = 0;
		
		[UIView commitAnimations];
	}
}

-(void)showQuizBack{
	
	[self prepareQues:(m_curQuiz-1)];
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:1];
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];
	[appli.m_gpsCtrl closeQuizPage];
}

-(IBAction)selToProfile:(id)sender{

	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:2];
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	[appli.m_gpsCtrl closeQuizPage];
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:3];
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	[appli.m_gpsCtrl closeQuizPage];
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:4];
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	[appli.m_gpsCtrl closeQuizPage];
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( [super isAsked] == false ) {
		
		[super showMoveConfPage:5];
		return;
	}
	
	m_mode = 11;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	[appli.m_gpsCtrl closeQuizPage];
}


@end
