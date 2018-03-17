//
//  fittingController.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <AudioToolbox/AudioServices.h>
#import "fittingController.h"
#import "glassshoesAppDelegate.h"
#import "glassShoes.h"
#import "profile.h"
#import "myGlassController.h"
#import "question.h"
#import "myGPSController.h"

// ユーザーデフォルトのキー
// プッシュ通知を受け取るかどうかを記憶する
//static NSString *kReceiveNotification = @"receiveNotification";

// プロバイダの登録APIのURL
static NSString *bumpURL = @"http://www.vuude.com/bump.php";
static NSString *bumpChkURL = @"http://www.vuude.com/bumpChk.php";
static NSString *registURL = @"http://www.vuude.com/regist.php";
static NSString *nearURL = @"http://www.vuude.com/nearSearch.php";
static NSString *worldURL = @"http://www.vuude.com/worldSearch.php";

// HTTPのステータスコードを格納したエラー情報を示すドメイン
static NSString *HTTPErrorDomain = @"HTTPErrorDomain";

@implementation fittingController

@synthesize m_accelerometer;

@synthesize m_leftShoes;
@synthesize m_rightShoes;

@synthesize m_bkImg;

@synthesize m_msg1Img;
@synthesize m_msg2Img;

@synthesize m_guideImg;
@synthesize m_guide2Img;
@synthesize m_guide3Img;

@synthesize m_tabBar;
@synthesize m_top;
@synthesize m_profile;
@synthesize m_history;
@synthesize m_search;
@synthesize m_setting;
@synthesize m_badgeImg;

@synthesize m_timeoutTime;

// プロパティとメンバー変数の設定
@synthesize urlRequest = _urlRequest;
@synthesize connection = _connection;
@synthesize downloadedData = _downloadedData;
@synthesize response = _response;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.m_badgeImg = nil;
		self.m_leftShoes = nil;
		self.m_rightShoes = nil;
		self.m_msg1Img = nil;
		self.m_msg2Img = nil;
		self.m_guideImg = nil;
		self.m_guide2Img = nil;
		self.m_guide3Img = nil;
		self.m_accelerometer = nil;
		self.m_timeoutTime = nil;
		m_mode = 0;
		m_type = 0;
		m_bBump = true;
		m_bGet = false;
        _connection = nil;
        _downloadedData = nil;
        _response = nil;
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
	
	if ( m_timeoutTime != nil ) {
		
		[m_timeoutTime release];
		m_timeoutTime = nil;
	}
	
	if ( m_leftShoes != nil ){
		//[m_leftShoes.view removeFromSuperview];
		[m_leftShoes release];
		m_leftShoes = nil;
	}
	
	if ( m_rightShoes != nil ) {
		//[m_rightShoes.view removeFromSuperview];
		[m_rightShoes release];	
		m_rightShoes = nil;
	}
	
	[m_bkImg release];	

	if ( m_msg1Img != nil ) {
		[m_msg1Img release];	
		m_msg1Img = nil;
	}

	if ( m_msg2Img != nil ) {
		[m_msg2Img release];	
		m_msg2Img = nil;
	}

	if ( m_guideImg != nil ) {
		[m_guideImg release];	
		m_guideImg = nil;
	}

	if ( m_guide2Img != nil ) {
		[m_guide2Img release];	
		m_guide2Img = nil;
	}

	if ( m_guide3Img != nil ) {
		[m_guide3Img release];	
		m_guide3Img = nil;
	}
	
	[m_accelerometer release];
	
	[m_tabBar release];	
	[m_top release];	
	[m_profile release];	
	[m_history release];	
	[m_search release];
	[m_setting release];	
	
    [_urlRequest release];
    [_connection release];
    [_downloadedData release];
    [_response release];
	
    [super dealloc];
}

/* stopTimer */
- (void)stopTimer {
	
    // Check if aTimer is nil
    if (m_timeoutTime) {
		
        // Only invalidate aTimer if it is not yet fired
        [m_timeoutTime invalidate];
    }
}

// left = -1 : current 
//      = 0 : self
//      = 1+ : friends
-(void)setInfo:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft{

	m_nLeft = left;
	m_nRight = right;
	m_from = from;
	
	glassShoes *gs = [glassShoes sharedInstance];
	myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	
	if ( left != -2 ) {

		self.m_leftShoes = mg;
		
		if( left == -1 ){
			[m_leftShoes setInfo:[gs isMan] color:0 data:gs.m_sQuesLists type:1 left:true];
		}
		else if( left == 0 ){
			
			[m_leftShoes setInfo:[gs.m_myProfile isMan] color:0 data:gs.m_myProfile.m_quesLists type:1 left:true];
		}
		else {
			profile* p = [gs.m_friendLists objectAtIndex:(left-1)];
			[m_leftShoes setInfo:[p isMan] color:0 data:p.m_quesLists type:1 left:true];
		}
		
		m_leftShoes.view.transform = CGAffineTransformMakeScale( 1.5, 1.5);
		m_leftShoes.view.center = CGPointMake( 160, 177 );
		[self.view addSubview:[m_leftShoes view]];
	}
	else {

		self.m_rightShoes = mg;
		
		if( right == -1 ){
			[m_rightShoes setInfo:[gs isMan] color:0 data:gs.m_sQuesLists type:1 left:false];
		}
		else if( right == 0 ){
			
			[m_rightShoes setInfo:[gs.m_myProfile isMan] color:0 data:gs.m_myProfile.m_quesLists type:1 left:false];
		}
		else {
			profile* p = [gs.m_friendLists objectAtIndex:(right-1)];
			[m_rightShoes setInfo:[p isMan] color:0 data:p.m_quesLists type:1 left:false];
		}
		
		m_rightShoes.view.transform = CGAffineTransformMakeScale( 1.5, 1.5);
		m_rightShoes.view.center = CGPointMake( 160, 177 );
		[self.view addSubview:[m_rightShoes view]];
	}

	[mg release];
	
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_f2" ofType:@"png"]];
	UIImageView* ti = [[UIImageView alloc] initWithImage:img];
	self.m_msg2Img = ti;
	[ti release];
	[img release];
	
	m_msg2Img.frame = CGRectMake( 10, 333, 302, 96);
	[self.view addSubview:m_msg2Img];
	m_msg2Img.hidden = YES;
	
	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_f1" ofType:@"png"]];
	ti = [[UIImageView alloc] initWithImage:img];
	self.m_msg1Img = ti;
	[ti release];
	[img release];
	
	m_msg1Img.frame = CGRectMake( 10, 333, 302, 96);
	[self.view addSubview:m_msg1Img];
	
	m_cnt = 0;
	
	UIAccelerometer *_accelTmp = [UIAccelerometer sharedAccelerometer];
	self.m_accelerometer = _accelTmp;
	[_accelTmp release];
	m_accelerometer.delegate = self;
	m_accelerometer.updateInterval = 0.5;
	m_bBump = true;
	
	m_timeoutTime = [NSTimer scheduledTimerWithTimeInterval:1.0
									 target:self
								   selector:@selector(startTimeOut:)
								   userInfo:nil
									repeats:NO];	

	//[self doBump];
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


- (void)startTimeOut:( NSTimer *)aTimer
{
	glassShoes *gs = [glassShoes sharedInstance];
	m_cnt++;

	if ( m_cnt < 8 ) {

		if( m_cnt%2 == 0 ){
			
			m_msg1Img.hidden = NO;
			m_msg2Img.hidden = YES;
		}
		else {
			
			m_msg1Img.hidden = YES;
			m_msg2Img.hidden = NO;
		}
		
		if ( m_bGet == false && m_cnt == 6) {

			m_cnt = 0;
		}
	}
	else if( m_cnt == 8 ){
		
		if ( m_nLeft != -2 ) {

			m_leftShoes.view.transform = CGAffineTransformMakeScale( 1.0, 1.0);
			m_leftShoes.view.center = CGPointMake( 100, 177 );
			
			myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
			self.m_rightShoes = mg;
			[mg release];
			
			[m_rightShoes setInfo:[gs.m_guestProfile isMan] color:0 data:gs.m_guestProfile.m_quesLists type:1 left:false];
			
			m_rightShoes.view.frame = CGRectMake( 140, 97, 160, 160);
			[self.view insertSubview:[m_rightShoes view] belowSubview:[m_leftShoes view]];
		}
		else {

			m_rightShoes.view.transform = CGAffineTransformMakeScale( 1.0, 1.0);
			m_rightShoes.view.center = CGPointMake( 220, 177 );
			
			myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
			self.m_leftShoes = mg;
			[mg release];
			
			[m_leftShoes setInfo:[gs.m_guestProfile isMan] color:0 data:gs.m_guestProfile.m_quesLists type:1 left:true];
			
			m_leftShoes.view.frame = CGRectMake( 20, 97, 160, 160);
			[self.view addSubview:[m_leftShoes view]];
		}

		[m_msg1Img removeFromSuperview];
		//[m_msg1Img release];
		m_msg1Img = nil;
		[m_msg2Img removeFromSuperview];
		//[m_msg2Img release];
		m_msg2Img = nil;
		
		UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_f4" ofType:@"png"]];
		UIImageView* ti = [[UIImageView alloc] initWithImage:img];
		self.m_msg2Img = ti;
		[ti release];
		[img release];
		
		m_msg2Img.frame = CGRectMake( 6, 338, 227, 89);
		[self.view addSubview:m_msg2Img];
		m_msg2Img.hidden = YES;
		
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_f3" ofType:@"png"]];
		ti = [[UIImageView alloc] initWithImage:img];
		self.m_msg1Img = ti;
		[ti release];
		[img release];
		
		m_msg1Img.frame = CGRectMake( 10, 342, 220, 81);
		[self.view addSubview:m_msg1Img];
		m_msg1Img.hidden = NO;
		
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_g1" ofType:@"png"]];
		ti = [[UIImageView alloc] initWithImage:img];
		self.m_guideImg = ti;
		[ti release];
		[img release];
		
		m_guideImg.frame = CGRectMake( 221, 271, 93, 159);
		[self.view addSubview:m_guideImg];
 	}
	else if( m_cnt < 68 ) {

		m_leftShoes.view.frame = CGRectMake( 20+(m_cnt-8)*1, 97, 160, 160);
		m_rightShoes.view.frame = CGRectMake( 140-(m_cnt-8)*1, 97, 160, 160);

		if( m_cnt%4 < 2 ){
			
			m_msg1Img.hidden = NO;
			m_msg2Img.hidden = YES;
		}
		else {
			
			m_msg1Img.hidden = YES;
			m_msg2Img.hidden = NO;
		}
	}
	else if( m_cnt == 68 ){
		
		m_leftShoes.view.transform = CGAffineTransformMakeScale( 1.5, 1.5);
		m_rightShoes.view.transform = CGAffineTransformMakeScale( 1.5, 1.5);
		m_leftShoes.view.center = CGPointMake( 160, 177 );
		m_rightShoes.view.center = CGPointMake( 160, 177 );

		[m_msg1Img removeFromSuperview];
		//[m_msg1Img release];
		m_msg1Img = nil;
		[m_msg2Img removeFromSuperview];
		//[m_msg2Img release];
		m_msg2Img = nil;
		
		UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_f5" ofType:@"png"]];
		UIImageView* ti = [[UIImageView alloc] initWithImage:img];
		self.m_msg1Img = ti;
		[ti release];
		[img release];
		
		m_msg1Img.frame = CGRectMake( 13, 336, 193, 95);
		[self.view addSubview:m_msg1Img];
		m_msg1Img.hidden = NO;
		
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_g2" ofType:@"png"]];
		ti = [[UIImageView alloc] initWithImage:img];
		self.m_guide2Img = ti;
		[ti release];
		[img release];
		
		m_guide2Img.frame = CGRectMake( 221, 271, 93, 159);
		[self.view addSubview:m_guide2Img];
		m_guide2Img.hidden = YES;
		
		img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fitting_g3" ofType:@"png"]];
		ti = [[UIImageView alloc] initWithImage:img];
		self.m_guide3Img = ti;
		[ti release];
		[img release];
		
		m_guide3Img.frame = CGRectMake( 221, 271, 93, 159);
		[self.view addSubview:m_guide3Img];
		m_guide3Img.hidden = YES;
	}
	else if( m_cnt == 87 ){
		 
		glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
		[appli.m_gpsCtrl showResultPage:m_nLeft right:m_nRight from:m_from bLeft:m_bLeft];
		[appli.m_gpsCtrl closeFittingPage];
		return;
	}
	else {

		if ( (m_cnt-69)%6 < 2 ) {

			m_guideImg.hidden = YES;
			m_guide2Img.hidden = NO;
			m_guide3Img.hidden = YES;
		}
		else if ( (m_cnt-69)%6 < 4 ) {
			
			m_guideImg.hidden = YES;
			m_guide2Img.hidden = NO;
			m_guide3Img.hidden = YES;
		}
		else{
			
			m_guideImg.hidden = YES;
			m_guide2Img.hidden = YES;
			m_guide3Img.hidden = NO;
		}
	}
	
	if ( m_cnt < 8 ) {

		[NSTimer scheduledTimerWithTimeInterval:0.63
										 target:self
									   selector:@selector(startTimeOut:)
									   userInfo:nil
										repeats:NO];	
	}
	else {
		
		[NSTimer scheduledTimerWithTimeInterval:0.25
										 target:self
									   selector:@selector(startTimeOut:)
									   userInfo:nil
										repeats:NO];	
	}
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
	[appli.m_gpsCtrl closeFittingPage];
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
	[appli.m_gpsCtrl closeFittingPage];
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
	[appli.m_gpsCtrl closeFittingPage];
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
	[appli.m_gpsCtrl closeFittingPage];
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
	[appli.m_gpsCtrl closeFittingPage];
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	

    const float violence = 0.90;
    BOOL shake = FALSE;
	
    if (acceleration.x > violence || acceleration.x < (-1* violence)){
        shake = TRUE;
    }
	
    if (acceleration.y > violence || acceleration.y < (-1* violence)){
        shake = TRUE;
    }
	
    if (acceleration.z > violence || acceleration.z < (-1* violence)){
        shake = TRUE;
    }
	
    if (shake){

		/*
		NSString* str = [[NSString alloc] initWithFormat:@"%f, %f, %f", acceleration.x, acceleration.y, acceleration.z];
		
		// アラートビューを作成する
		UIAlertView *alert;
		alert = [[UIAlertView alloc] initWithTitle:@"UIAccelerometer"
										   message:str
										  delegate:nil
								 cancelButtonTitle:@"OK"
								 otherButtonTitles:nil];
		
		// アラートビューを表示する
		[alert show];
		
		// 解放
		[alert release];
		
		[str release];
		*/
		
		/*
		[NSTimer scheduledTimerWithTimeInterval:0.01
										 target:self
									   selector:@selector(doBump:)
									   userInfo:nil
										repeats:NO];	
		*/
		
		//[NSThread detachNewThreadSelector:@selector(doBump) toTarget:self withObject:nil];
		[self doBump];
    }
}

-(void)doBump{
	
	if ( m_bBump != true ) {
		return;
	}
	
	m_bBump = false;
	m_chkCnt = 0;
	
	// type 1:	register
	//		2:	nearSearch
	//		3:	worldSearch
	//		4:	bump me
	//		5:	bump current
	//		6+:	bump friend
	
	// left = -1 : current 
	//      = 0 : self
	//      = 1+ : friends
	m_type = 5;
	
	if( m_nLeft == 0 )
		m_type = 4;
	
	else if( m_nLeft > 0 )
		m_type = 5+ m_nLeft;

	else if( m_nLeft == -2 ){
		
		if( m_nRight == 0 )
			m_type = 4;
		
		else if( m_nRight > 0 )
			m_type = 5+ m_nRight;
	}
	
	[self connectToServer];
	//glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	//[appli connectToServer:type];

	[NSTimer scheduledTimerWithTimeInterval:15.0
									 target:self
								   selector:@selector(commTimeOut:)
								   userInfo:nil
									repeats:NO];	
}

- (void)commTimeOut:( NSTimer *)aTimer{
	
	if ( m_type > 100 ) {
		
		return;
	}
	
	glassShoes *gs = [glassShoes sharedInstance];
	if ( [gs checkLocation] == false ) {
		
		// 複数行で書くタイプ（複数ボタンタイプ）
		UIAlertView *alert = [[UIAlertView alloc] init];
		alert.delegate = self;
		alert.title = @"";
		alert.message = @"位置情報の取得が出来ませんでした\rもう一度お試しください";
		[alert addButtonWithTitle:@"OK"];
		[alert show];			
	}
	else {
		
		// 複数行で書くタイプ（複数ボタンタイプ）
		UIAlertView *alert = [[UIAlertView alloc] init];
		alert.delegate = self;
		alert.title = @"";
		alert.message = @"電波状況を確認してください。";
		[alert addButtonWithTitle:@"OK"];
		[alert show];			
	}
}

// type 1:	register
//		2:	nearSearch
//		3:	worldSearch
//		4:	bump me
//		5:	bump current
//		6+:	bump friend
- (void)connectToServer{

	glassShoes *gs = [glassShoes sharedInstance];
	BOOL canToken = [gs checkToken];
	BOOL canLocation = [gs checkLocation];
	
	if ( canToken && canLocation ) {
		
		[self connectToServer2];
	}
	else {
		[NSTimer scheduledTimerWithTimeInterval:1.0
										 target:self
									   selector:@selector(connectCheckTimeOut:)
									   userInfo:nil
										repeats:NO];	
	}
	
	/*
	NSString* str = [[[NSString alloc] initWithFormat:@"type = %d", m_type] autorelease];
	
	// 複数行で書くタイプ（複数ボタンタイプ）
	UIAlertView *alert = [[UIAlertView alloc] init];
	alert.delegate = self;
	alert.title = @"データ通信";
	alert.message = str;
	[alert addButtonWithTitle:@"いいえ"];
	[alert addButtonWithTitle:@"はい"];
	[alert show];			
	*/
}

- (void)connectCheckTimeOut:( NSTimer *)aTimer{

	[self connectToServer];
}

- (void)connectToServer2{
	
	//NSLog( @"m_type = %d", m_type );
	if ( _urlRequest != nil ) {
		[_urlRequest release];
		_urlRequest = nil;
	}

	if ( _connection != nil ) {
		[_connection release];
		_connection = nil;
	}

	if ( _downloadedData != nil ) {
		[_downloadedData release];
		_downloadedData = nil;
	}

	if ( _response != nil ) {
		[_response release];
		_response = nil;
	}
	
	NSInteger type = m_type%100;
	glassShoes *gs = [glassShoes sharedInstance];

	if ( gs.m_token == nil  || [gs checkToken] == false ) {
		return;
	}
	NSString* strToken = [[NSString alloc] initWithFormat:@"%@", gs.m_token];
	
	CLLocationCoordinate2D coord = [gs getCoord];
	
	// tmp
	NSString* strIdo = [[NSString alloc] initWithFormat:@"%f", coord.latitude];
	NSString* strKedo = [[NSString alloc] initWithFormat:@"%f", coord.longitude];
	
	if ( m_type > 100 ) {

		// プロバイダに送信するデータを作成する
		NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
							  strToken, @"token",
							  strIdo, @"ido",
							  strKedo, @"kedo",
							  nil];
		
		NSData *data;
		data = [self formEncodedDataFromDictionary:dict];
		
		// プロバイダにデバイストークンを送信する
		// 接続要求を作成する
		NSURL *url;
		url = [NSURL URLWithString:bumpChkURL];
		
		NSMutableURLRequest *req;
		req = [NSMutableURLRequest requestWithURL:url];
		
		// HTTPのメソッドをPOSTに設定する
		[req setHTTPMethod:@"POST"];
		
		// POSTのデータを設定する
		[req setHTTPBody:data];
		
		// 通信画面を表示して、通信を開始する
		m_commType = type;
		[self doComm:req];
		
		/*
		// ユーザーデフォルトに、通知をオンにしたことを記憶する
		NSUserDefaults *userDefaults;
		userDefaults = [NSUserDefaults standardUserDefaults];
		[userDefaults setBool:YES
					   forKey:kReceiveNotification];
		*/ 
		 
		[strToken release];
		[strIdo release];
		[strKedo release];

		return;
	}
	
	profile* theProfile = nil;
	NSString* name;
	NSInteger sex = 1;
	
	if ( type< 6 ) {
		
		theProfile = gs.m_myProfile;
	}
	else if( type > 5 ){
		
		theProfile = [gs.m_friendLists objectAtIndex:(type-6)];
	}
	
	if( type == 5 ){
		
		if ( gs.m_name != nil ) {
			name = [[NSString alloc] initWithFormat:@"%@", gs.m_name];
		}
		else {
			name = [[NSString alloc] initWithFormat:@""];
		}
		
		if ( [gs isMan] == false ) {
			sex = 2;
		}
	}
	else {
		
		if ( theProfile != nil && theProfile.m_name != nil ) {
			name = [[NSString alloc] initWithFormat:@"%@", theProfile.m_name];
		}
		else {
			name = [[NSString alloc] initWithFormat:@""];
		}
		
		if ( [theProfile isMan] == false ) {
			sex = 2;
		}
	}
	
	NSString* sexStr = [[NSString alloc] initWithFormat:@"%d", sex];// @"1";// 1 = man / 2 = woman
	
	NSInteger p[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	
	for ( int i= 0; i < 20; i ++ ) {
		
		question* q;
		
		if( type == 5 ){
			
			if ( gs.m_sQuesLists == nil ) {
				continue;
			}
			
			q = (question*)[gs.m_sQuesLists objectAtIndex:i];
		}
		else {
			
			if ( theProfile == nil) {
				continue;
			}
			
			if ( theProfile.m_quesLists == nil ) {
				continue;
			}
			
			q = (question*)[theProfile.m_quesLists objectAtIndex:i];
		}
		
		NSInteger lp = [q getQuizNo]-1;
		NSInteger la = [q getSelAnswer];
		p[lp] = la;
	}

	NSString* sp1 = [[NSString alloc] initWithFormat:@"%d", p[0]];
	NSString* sp2 = [[NSString alloc] initWithFormat:@"%d", p[1]];
	NSString* sp3 = [[NSString alloc] initWithFormat:@"%d", p[2]];
	NSString* sp4 = [[NSString alloc] initWithFormat:@"%d", p[3]];
	NSString* sp5 = [[NSString alloc] initWithFormat:@"%d", p[4]];
	NSString* sp6 = [[NSString alloc] initWithFormat:@"%d", p[5]];
	NSString* sp7 = [[NSString alloc] initWithFormat:@"%d", p[6]];
	NSString* sp8 = [[NSString alloc] initWithFormat:@"%d", p[7]];
	NSString* sp9 = [[NSString alloc] initWithFormat:@"%d", p[8]];
	NSString* sp10 = [[NSString alloc] initWithFormat:@"%d", p[9]];
	NSString* sp11 = [[NSString alloc] initWithFormat:@"%d", p[10]];
	NSString* sp12 = [[NSString alloc] initWithFormat:@"%d", p[11]];
	NSString* sp13 = [[NSString alloc] initWithFormat:@"%d", p[12]];
	NSString* sp14 = [[NSString alloc] initWithFormat:@"%d", p[13]];
	NSString* sp15 = [[NSString alloc] initWithFormat:@"%d", p[14]];
	NSString* sp16 = [[NSString alloc] initWithFormat:@"%d", p[15]];
	NSString* sp17 = [[NSString alloc] initWithFormat:@"%d", p[16]];
	NSString* sp18 = [[NSString alloc] initWithFormat:@"%d", p[17]];
	NSString* sp19 = [[NSString alloc] initWithFormat:@"%d", p[18]];
	NSString* sp20 = [[NSString alloc] initWithFormat:@"%d", p[19]];
	
    // プロバイダに送信するデータを作成する
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  strToken, @"token",
						  name, @"name",
						  sexStr, @"sex",
						  strIdo, @"ido",
						  strKedo, @"kedo",
						  sp1 , @"p1",
						  sp2 , @"p2",
						  sp3 , @"p3",
						  sp4 , @"p4",
						  sp5 , @"p5",
						  sp6 , @"p6",
						  sp7 , @"p7",
						  sp8 , @"p8",
						  sp9 , @"p9",
						  sp10, @"p10",
						  sp11, @"p11",
						  sp12, @"p12",
						  sp13, @"p13",
						  sp14, @"p14",
						  sp15, @"p15",
						  sp16, @"p16",
						  sp17, @"p17",
						  sp18, @"p18",
						  sp19, @"p19",
						  sp20, @"p20",
						  nil];
	
	/*
	NSString* str = [[NSString alloc] initWithFormat:@"type = %d, %@, %@, %@", type, gs.m_token, name, sp1];
	UIAlertView *alert;
	
	alert = [[UIAlertView alloc]
			 initWithTitle:@"通信2"
			 message:str
			 delegate:nil
			 cancelButtonTitle:@"OK"
			 otherButtonTitles:nil];
	[alert show];
	[alert release];
	[str release];
	*/ 
	 
    NSData *data;
    data = [self formEncodedDataFromDictionary:dict];
    
    // プロバイダにデバイストークンを送信する
    // 接続要求を作成する
    NSURL *url;
	
	if ( type == 1 ) {
		url = [NSURL URLWithString:registURL];
	}
	else if ( type == 2 ) {
		url = [NSURL URLWithString:nearURL];
	}
	else if ( type == 3 ) {
		url = [NSURL URLWithString:worldURL];
	}
	else {
		url = [NSURL URLWithString:bumpURL];
	}
	
    NSMutableURLRequest *req;
    req = [NSMutableURLRequest requestWithURL:url];
    
    // HTTPのメソッドをPOSTに設定する
    [req setHTTPMethod:@"POST"];
    
    // POSTのデータを設定する
    [req setHTTPBody:data];
    
    // 通信画面を表示して、通信を開始する
	m_commType = type;
	[self doComm:req];
	
	/*
    // ユーザーデフォルトに、通知をオンにしたことを記憶する
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES
                   forKey:kReceiveNotification];
	*/ 
	 
	[strToken release];
	[strIdo release];
	[strKedo release];
	
	[sp1  release];
	[sp2  release];
	[sp3  release];
	[sp4  release];
	[sp5  release];
	[sp6  release];
	[sp7  release];
	[sp8  release];
	[sp9  release];
	[sp10 release];
	[sp11 release];
	[sp12 release];
	[sp13 release];
	[sp14 release];
	[sp15 release];
	[sp16 release];
	[sp17 release];
	[sp18 release];
	[sp19 release];
	[sp20 release];
	
	[name release];
	[sexStr release];
}

- (void)doComm:(NSMutableURLRequest*)request{
	
    // 接続要求を取得する
    if (!request)
    {
        // 接続要求が設定されていなければエラーを表示して閉じる
		// エラーメッセージを表示する
		UIAlertView *alert;
		
		alert = [[UIAlertView alloc]
				 initWithTitle:@"通信エラー"
				 message:@"電波状況を確認してください。"
				 delegate:nil
				 cancelButtonTitle:@"OK"
				 otherButtonTitles:nil];
		[alert show];
		[alert release];
		
		glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
		
		NSInteger chk = m_nLeft;
		if ( m_nLeft == -2 ) {
			
			chk = m_nRight;
		}
		
		if ( chk == -1 )
			[appli.m_gpsCtrl showChkResultPage];
		else
			[appli.m_gpsCtrl showProfilePage:chk from:m_from];
		
		[appli.m_gpsCtrl closeFittingPage];
        return;
    }
    
    // ダウンロードデータのクリア
    [self setDownloadedData:nil];
    // レスポンスのクリア
    [self setResponse:nil];
    
    // 接続開始
    [self setConnection:[NSURLConnection connectionWithRequest:request
                                                      delegate:self]];
}

// データ取得完了時に呼ばれるメソッド
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	/*
	NSString* str = [[NSString alloc] initWithData:self.downloadedData encoding:NSUTF8StringEncoding];	
	
	// 複数行で書くタイプ（複数ボタンタイプ）
	UIAlertView *alert = [[UIAlertView alloc] init];
	alert.delegate = self;
	alert.title = @"データ通信";
	alert.message = str;
	[alert addButtonWithTitle:@"いいえ"];
	[alert addButtonWithTitle:@"はい"];
	[alert addButtonWithTitle:@"Done"];
	[alert show];			
	
	[str release];
	*/
	[self connectionDidFinished];
}	
	
- (void)connectionDidFinished{
	
	NSString* str = [[NSString alloc] initWithData:self.downloadedData encoding:NSUTF8StringEncoding];	
	NSArray *items = [str componentsSeparatedByString:@"&"];
	
	NSInteger res = [[items objectAtIndex:0] intValue];
	
	if ( m_type < 100 ) {

		/*
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"データUP完了"
														message:str
													   delegate:nil
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
		*/ 
		 
		float wait_time = 2.0f;
		if ( res == 0 ) {

			AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
			AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
			m_type += 100;
			int off = 500+ rand()%1000;
			wait_time = off/1000.0f;
		}
		
		[NSTimer scheduledTimerWithTimeInterval:wait_time
										 target:self
									   selector:@selector(connectToServer)
									   userInfo:nil
										repeats:NO];	
	}
	else {

		//NSString* str = @"1&テスト&2&4&4&4&2&2&2&2&3&2&2&2&1&3&2&2&2&1&4&1&4";

		/*
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"データ取得完了"
										   message:str
										  delegate:nil
								 cancelButtonTitle:@"OK"
								 otherButtonTitles:nil];
		[alert show];
		[alert release];
		*/ 
		 
		if ( [items count] == 23 && res == 1) {

			NSString* name = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:1]];
			NSInteger nSex = [[items objectAtIndex:2] intValue];
			BOOL bMan = true;
			if( nSex == 2 )
				bMan = false;
			
			NSMutableArray* quesLists = [[NSMutableArray alloc] init];
			
			for( int i= 0; i< 20; i++ ){
				
				NSInteger nSel = [[items objectAtIndex:3+i] intValue]- 1;
				question* q = [[question alloc] init2:(i+1) a1:1 a2:2 a3:3 a4:4 sel:nSel];
				[quesLists addObject:q];
			}

			glassShoes *gs = [glassShoes sharedInstance];
			if ( gs.m_guestProfile != nil ) {
				
				[gs.m_guestProfile release];
				gs.m_guestProfile = nil;
			}

			NSInteger type = [gs checkSingleTypes:quesLists];
			gs.m_guestProfile = [[profile alloc] init:name type:type bMan:bMan data:quesLists];
			
			if ( quesLists != nil ) {
				
				[quesLists removeAllObjects];
				[quesLists release];
				quesLists = nil;
			}			
			
			[name release];
			m_bGet = true;
		}
		else {
			
			m_chkCnt++;
			
			int off = 1200+ rand()%600;
			float wait_time = off/1000.0f;
			
			if ( m_chkCnt < 5 ) {
				[NSTimer scheduledTimerWithTimeInterval:wait_time
												 target:self
											   selector:@selector(connectToServer)
											   userInfo:nil
												repeats:NO];	
			}
			else {
				
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
												   message:@"相手が見つかりませんでした。"
												  delegate:nil
										 cancelButtonTitle:@"OK"
										 otherButtonTitles:nil];
				[alert show];
				[alert release];

				glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
				
				NSInteger chk = m_nLeft;
				if ( m_nLeft == -2 ) {
					
					chk = m_nRight;
				}
				
				if ( chk == -1 )
					[appli.m_gpsCtrl showChkResultPage];
				else
					[appli.m_gpsCtrl showProfilePage:chk from:m_from];
				
				[appli.m_gpsCtrl closeFittingPage];
			}
		}
	}

	[str release];
}

-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	switch (buttonIndex) {
		case 0:
		{
			glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
			
			NSInteger chk = m_nLeft;
			if ( m_nLeft == -2 ) {
				
				chk = m_nRight;
			}
			
			if ( chk == -1 )
				[appli.m_gpsCtrl showChkResultPage];
			else
				[appli.m_gpsCtrl showProfilePage:chk from:m_from];
			
			[appli.m_gpsCtrl closeFittingPage];
		}
			break;
		case 1:
			break;
		case 2:
			break;
	}
	
}
// データ取得失敗時に呼ばれるメソッド
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
	// 複数行で書くタイプ（複数ボタンタイプ）
	UIAlertView *alert = [[UIAlertView alloc] init];
	alert.delegate = self;
	alert.title = @"";
	alert.message = @"電波状況を確認してください。";
	[alert addButtonWithTitle:@"OK"];
	[alert show];			
}

// レスポンスを受け取った直後に呼ばれるメソッド
- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    // レスポンスを記憶する
    [self setResponse:response];
    
    // もし、「response」が「NSHTTPURLResponse」ならば
    // HTTPのステータスコードもチェックする
    if ([response isKindOfClass:[NSHTTPURLResponse class]])
    {
        // HTTPのステータスコードが400以上ならエラー扱いとする
        NSInteger statusCode = 
        [(NSHTTPURLResponse *)response statusCode];
        
        if (statusCode >= 400)
        {
            // 通信を中断する
            [connection cancel];
            
            // エラー情報を構築する
            NSError *error;
            NSString *errStr;
            NSDictionary *userInfo = nil;
            
            errStr = [NSHTTPURLResponse
                      localizedStringForStatusCode:statusCode];
            if (errStr)
            {
                // 「NSError」クラスの「localizedDescription」
                // メソッドで取得されるエラーメッセージを表示する
                userInfo = [NSDictionary dictionaryWithObject:errStr
													   forKey:NSLocalizedDescriptionKey];
            }
            
            error = [NSError errorWithDomain:HTTPErrorDomain
                                        code:statusCode
                                    userInfo:userInfo];
            // エラー発生時の処理を呼び出す
            [self connection:connection
            didFailWithError:error];
        }
    }
}

// データ受信時に呼ばれるメソッド
- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    // 格納先のバッファを確保する
    NSMutableData *downloadedData = self.downloadedData;
    
    if (!downloadedData)
    {
        // 格納先のバッファを確保する
        downloadedData = [NSMutableData dataWithCapacity:0];
        [self setDownloadedData:downloadedData];
    }
    
    // 受信したデータを追加する
    [downloadedData appendData:data];
}

// バイナリデータを16進ダンプした文字列に変換する
- (NSString *)hexDumpString:(NSData *)data
{
    // 格納先の文字列を確保する
    NSMutableString *str;
    str = [NSMutableString stringWithCapacity:0];
    
    // 変数「data」に格納されたバイト列を取得する
    const unsigned char *p = (const unsigned char *)[data bytes];
    const unsigned char *pend = p + [data length];
    
    // 1バイトずつ16進数に変換していく
    for (; p != pend; p++)
    {
        [str appendFormat:@"%02X", *p];
    }
    return str;
}

// POSTで渡せるように、辞書に格納された文字列から
// 「application/x-www-form-urlencoded」形式の
// データを作成する
- (NSData *)formEncodedDataFromDictionary:(NSDictionary *)dict
{
    NSMutableString *str;
    
    str = [NSMutableString stringWithCapacity:0];
    
    // 「キー=値」のペアを「&」で結合して列挙する
    // キーと値はどちらもURLエンコードを行い、スペースは「+」に置き換える
    for (NSString *key in [dict allKeys])
    {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        NSString *value = [dict objectForKey:key];
        
        // スペースを「+」に置き換える
        key = [key stringByReplacingOccurrencesOfString:@" "
                                             withString:@"+"];
        value = [value stringByReplacingOccurrencesOfString:@" "
                                                 withString:@"+"];
        // URLエンコードを行う
        key = [key stringByAddingPercentEscapesUsingEncoding:
               NSUTF8StringEncoding];
        value = [value stringByAddingPercentEscapesUsingEncoding:
                 NSUTF8StringEncoding];
        
        // 文字列を連結する
        if ([str length] > 0)
        {
            [str appendString:@"&"];
        }
        
        [str appendFormat:@"%@=%@", key, value];
        
        [pool drain];
    }
    
    // 作成した文字列をUTF-8で符号化する
    NSData *data;
    data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    return data;
}

@end
