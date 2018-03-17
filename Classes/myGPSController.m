//
//  myGPSController.m
//  glassshoes
//
//  Created by james Lee on 11/09/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "startController.h"
#import "helpController.h"
#import "inputController.h"
#import "quizController.h"
#import "checkController.h"
#import "chkResultController.h"
#import "mutiResultController.h"
#import "fitTopController.h"
#import "fitSelController.h"
#import "profileController.h"
#import "profileTopController.h"
#import "fittingController.h"
#import "singleFittingController.h"
#import "resultController.h"
#import "glassShoes.h"
#import "mutiChkController.h"
#import "bestResultController.h"
#import "wastResultController.h"
#import "fittingSelController.h"
#import "mutiFittingController.h"
#import "fitResultController.h"
#import "settingController.h"
#import "historyTopController.h"
#import "historyController.h"
#import "searchHistoryController.h"
#import "searchTopController.h"
#import "glassShoes.h"
#import "question.h"
#import "profile.h"
#import "nearController.h"
#import "worldController.h"

@implementation myGPSController

@synthesize m_startCtrl;
@synthesize m_helpCtrl;
@synthesize m_inputCtrl;
@synthesize m_quizCtrl;
@synthesize m_chkCtrl;
@synthesize m_chkResultCtrl;
@synthesize m_mutiChkResultCtrl;
@synthesize m_fitTopCtrl;
@synthesize m_fitSelCtrl;
@synthesize m_profileCtrl;
@synthesize m_profileTopCtrl;
@synthesize m_fittingCtrl;
@synthesize m_singleFittingCtrl;
@synthesize m_resultCtrl;

@synthesize m_mutiChkCtrl;
@synthesize m_bestResultCtrl;
@synthesize m_wastResultCtrl;
@synthesize m_fittingSelCtrl;
@synthesize m_mutiFittingCtrl;
@synthesize m_fitResultCtrl;

@synthesize m_settingCtrl;
@synthesize m_historyTopCtrl;
@synthesize m_historyCtrl;
@synthesize m_searchHistoryCtrl;
@synthesize m_searchCtrl;
@synthesize m_nearCtrl;
@synthesize m_worldCtrl;

@synthesize locationManager = _locationManager;

@synthesize placemark = _placemark;
@synthesize reverseGeocoder = _reverseGeocoder;

// プロパティとメンバー変数の設定
@synthesize urlRequest = _urlRequest;
@synthesize connection = _connection;
@synthesize downloadedData = _downloadedData;
@synthesize response = _response;

// ユーザーデフォルトのキー
// プッシュ通知を受け取るかどうかを記憶する
static NSString *kReceiveNotification = @"receiveNotification";

// プロバイダの登録APIのURL
static NSString *bumpURL = @"http://www.vuude.com/bump.php";
static NSString *registURL = @"http://www.vuude.com/register.php";
static NSString *nearURL = @"http://www.vuude.com/nearSearching.php";
static NSString *worldURL = @"http://www.vuude.com/worldSearch.php";

// HTTPのステータスコードを格納したエラー情報を示すドメイン
static NSString *HTTPErrorDomain = @"HTTPErrorDomain";


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.m_startCtrl = nil;
		self.m_helpCtrl = nil;
		self.m_inputCtrl = nil;
		self.m_quizCtrl = nil;
		self.m_chkCtrl = nil;
		self.m_chkResultCtrl = nil;
		self.m_mutiChkResultCtrl = nil;
		self.m_fitTopCtrl = nil;
		self.m_fitSelCtrl = nil;
		self.m_profileCtrl = nil;
		self.m_profileTopCtrl = nil;
		self.m_fittingCtrl = nil;
		self.m_singleFittingCtrl = nil;
		self.m_resultCtrl = nil;
		
		self.m_mutiChkCtrl = nil;
		self.m_bestResultCtrl = nil;
		self.m_wastResultCtrl = nil;
		self.m_fittingSelCtrl = nil;
		self.m_mutiFittingCtrl = nil;
		self.m_fitResultCtrl = nil;
		self.m_settingCtrl = nil;
		self.m_historyTopCtrl = nil;
		self.m_historyCtrl = nil;
		self.m_searchHistoryCtrl = nil;
		self.m_searchCtrl = nil;
		self.m_nearCtrl = nil;
		self.m_worldCtrl = nil;
		
        _placemark = nil;
        _urlRequest = nil;
        _connection = nil;
        _downloadedData = nil;
        _response = nil;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	BOOL canComm = [appli canDoComm];
	
	if ( canComm ) {
		
		[self registDevice];
	}
	
	[self showStartPage];
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
	
    [_locationManager release];
	
    [_reverseGeocoder release];
    [_placemark release];
	
    [_urlRequest release];
    [_connection release];
    [_downloadedData release];
    [_response release];
	
	[self closeStartPage];
	[self closeHelpPage];
	[self closeInputPage];
	[self closeQuizPage];
	[self closeChkPage];
	[self closeChkResultPage];
	[self closeMutiChkResultPage];
	[self closeFitTopPage];
	[self closeFitSelPage];
	[self closeProfilePage];
	[self closeProfileTopPage];
	[self closeFittingPage];
	[self closeSingleFittingPage];
	[self closeResultPage];
	
	[self closeMutiChkPage];
	[self closeBestFitPage];
	[self closeWastFitPage];
	[self closeMutiFitSelPage];
	[self closeMutiFittingPage];
	[self closeMutiFitResultPage];
	
	[self closeSettingPage];
	[self closeHistoryPage];
	[self closeFitHistoryPage];
	[self closeSearchHistoryPage];
	[self closeSearchPage];
	[self closeNearPage];
	[self closeWorldPage];
	
    [super dealloc];
}

- (void)prepareGPS{

    if ([CLLocationManager locationServicesEnabled])
    {
        CLLocationManager *manager;
        manager = [[CLLocationManager alloc] init];
        [self setLocationManager:manager];
		
        [manager setDelegate:self];
        
        [manager release];
		 
		[self controlGPS];
    }
}

- (void)controlGPS{
	
	CLLocationManager *manager = self.locationManager;

	//イベントを発生させる最小の距離（デフォルトは距離指定なし）
	manager.distanceFilter = kCLDistanceFilterNone;
	manager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
	
	[manager startUpdatingLocation];
}

// 位置情報が更新されたきに呼ばれるメソッド
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    // 位置を取得する
	glassShoes *gs = [glassShoes sharedInstance];
	if( [gs setCoord:newLocation.coordinate] == true ){

		[self reloadFromReverseGeocoder];
		[manager stopUpdatingLocation];
	}
}

// GPS測位が失敗した場合に呼ばれる
// 起動時ポップアップで許可しないを選んだ時とか
- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error{

	glassShoes *gs = [glassShoes sharedInstance];
	[gs setCanLocation:false];
}

// プロパティ「placemark」から情報を取得して表示するメソッド
- (void)reloadFromPlacemark
{
	glassShoes *gs = [glassShoes sharedInstance];
	if( gs.m_myPlace != nil ){

		[gs.m_myPlace release];
	}
	
	gs.m_myPlace = [[NSString alloc] initWithFormat:@"%@", self.placemark.subLocality];
	
	if( gs.m_upPlace != nil ){
		
		[gs.m_upPlace release];
	}
	
	gs.m_upPlace = [[NSString alloc] initWithFormat:@"%@,%@,%@,%@,%@", self.placemark.countryCode, self.placemark.country, self.placemark.administrativeArea, self.placemark.locality, self.placemark.subLocality];

	[gs setCanLocation:true];
	
	[self connectToServer:COMM_REG];
}

// 逆ジオコーダから情報を取得する
- (void)reloadFromReverseGeocoder
{
    // 逆ジオコーダのインスタンス作成
	glassShoes *gs = [glassShoes sharedInstance];
    MKReverseGeocoder *geocoder;
    geocoder = [[MKReverseGeocoder alloc]
                initWithCoordinate:[gs getCoord]];
    
    // デリゲートを設定する
    [geocoder setDelegate:self];
    
    // 取得開始
    [geocoder start];
    
    // プロパティにセットする
    [self setReverseGeocoder:geocoder];
    
    [geocoder release];
}

// 逆ジオコーダから情報を取得できたときに呼ばれるメソッド
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder
       didFindPlacemark:(MKPlacemark *)placemark
{
	
    // 取得した情報をプロパティにセット
    [self setPlacemark:placemark];
    
    // 逆ジオコーダを解放する
    [self setReverseGeocoder:nil];
    
    // 取得した情報を表示する
    [self reloadFromPlacemark];
}

// 逆ジオコーダから情報を取得できなかったときに呼ばれるメソッド
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder
       didFailWithError:(NSError *)error
{

	glassShoes *gs = [glassShoes sharedInstance];
	[gs setCanLocation:false];
}

- (void)registDevice{
	
	glassShoes *gs = [glassShoes sharedInstance];

	if( [gs checkToken] == true )
		return;

    {
        int types;
        types = (UIRemoteNotificationTypeSound |
				 UIRemoteNotificationTypeBadge |
                 UIRemoteNotificationTypeAlert);
        
        // デバイスを登録する
        UIApplication *app;
        app = [UIApplication sharedApplication];
        [app registerForRemoteNotificationTypes:types];
        
        // スイッチをオンにする
		[gs setPushFlag:true];
    }
}

// プッシュ通知を受け取るか設定するスイッチの状態を
// APNsにデバイスを登録できたときに呼ばれるメソッド
- (void)didRegisterForRemoteNotificationsWithDeviceToken:
(NSData *)deviceToken
{
	glassShoes *gs = [glassShoes sharedInstance];
	
	if( [gs checkToken] == true )
		return;
	
    // デバイストークンを16進ダンプする
    NSString *str;
    str = [self hexDumpString:deviceToken];
    if (!str){
		
		[self didFailToRegisterForRemoteNotificationsWithError:nil];
        return; // 作成できなかった
    }
		
	[gs setCanToken:true];
	
	if( gs.m_token != nil )
		[gs.m_token release];
	
	NSString* token = [[NSString alloc] initWithFormat:@"%@", str];
	gs.m_token = token;
	[token release];

    // ユーザーデフォルトに、通知をオンにしたことを記憶する
    NSUserDefaults *userDefaults;
    userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES
                   forKey:kReceiveNotification];
	
	[self prepareGPS];
}

- (void)connectToServer:(NSInteger)type{

	glassShoes *gs = [glassShoes sharedInstance];
	
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
	
	CLLocationCoordinate2D coord = [gs getCoord];
	NSString* token = nil;
	NSString* strIdo = nil;
	NSString* strKedo = nil;
	if( gs.m_token == nil || [gs checkToken] == false ){
		
		return;
	}
	else {
		token = [[NSString alloc] initWithFormat:@"%@", gs.m_token ];
		strIdo = [[NSString alloc] initWithFormat:@"%f", coord.latitude];
		strKedo = [[NSString alloc] initWithFormat:@"%f", coord.longitude];
	}
	
	if ( type < 3 && [gs haveProfile] == false ) {
		return;
	}
	
	m_commType = type;
	profile* theProfile = nil;
	NSString* name;
	NSInteger sex = 1;
	
	if ( type < 5 ) {
		
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
	
	NSString* place;
	if ( gs.m_upPlace != nil ) {
		
		place = [[NSString alloc] initWithFormat:@"%@", gs.m_upPlace];
	}
	else {
		place = [[NSString alloc] initWithFormat:@"未登録"];
	}

	NSString* myplace;
	if ( gs.m_myPlace != nil ) {
		
		myplace = [[NSString alloc] initWithFormat:@"%@", gs.m_myPlace];
	}
	else {
		myplace = [[NSString alloc] initWithFormat:@"未登録"];
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
						  token, @"token",
						  name, @"name",
						  sexStr, @"sex",
						  strIdo, @"ido",
						  strKedo, @"kedo",
						  place, @"place",
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
						  myplace, @"myplace",
						  nil];
	
		
    NSData *data;
    data = [self formEncodedDataFromDictionary:dict];
    
    // プロバイダにデバイストークンを送信する
    // 接続要求を作成する
    NSURL *url;
	
	if ( m_commType == 1 ) {
		url = [NSURL URLWithString:registURL];
	}
	else if ( m_commType == 2 ) {
		url = [NSURL URLWithString:nearURL];
	}
	else if ( m_commType == 3 ) {
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
	[myplace release];
	[token release];
	
	[place release];
	[name release];
	[sexStr release];
}

- (void)doComm:(NSMutableURLRequest*)request{

    // 接続要求を取得する
    if (!request)
    {
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
	NSString* str = [[NSString alloc] initWithData:self.downloadedData encoding:NSUTF8StringEncoding];	

	if ( m_searchCtrl != nil ) {
		
		[m_searchCtrl stopTimeout];
	}
	
	if ( m_commType == 2 ) {
		
		[self showNearPage:str];
	}
	else if( m_commType == 3 ){
		
		[self showWorldPage:str];
	}
	
	[str release];
}

// データ取得失敗時に呼ばれるメソッド
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
}

// レスポンスを受け取った直後に呼ばれるメソッド
- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    // レスポンスを記憶する
    [self setResponse:response];
    
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
        
		if ( value == nil) {
			
			continue;
		}
		
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

// APNsにデバイスを登録できなかったときに呼ばれるメソッド
- (void)didFailToRegisterForRemoteNotificationsWithError:
(NSError *)error
{
	glassShoes *gs = [glassShoes sharedInstance];
	
    // 失敗してしまったので、スイッチをオフにする
	[gs setCanToken:false];
}

// プッシュ通知を受け取ったときに呼び出すメソッド
- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo show:(BOOL)show
{
	glassShoes *gs = [glassShoes sharedInstance];
	if( show ){
		[gs addBadge:1];
		
		// 通知されたメッセージを取得する
		NSString *message;
		message = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
		
		// アラートビューを作成する
		UIAlertView *alert;
		alert = [[UIAlertView alloc] initWithTitle:@"プッシュ通知"
										   message:message
										  delegate:nil
								 cancelButtonTitle:@"OK"
								 otherButtonTitles:nil];
		
		// アラートビューを表示する
		[alert show];
		
		// 解放
		[alert release];
	}
		
	NSString* history = [userInfo objectForKey:@"color"];
	[gs addBeSearchHistory:history];
	
	if( show ){
		[self showBadge];
	}
}

-(void)showBadge{

	if( m_startCtrl != nil )
		[m_startCtrl showBadge];
	
	if( m_helpCtrl != nil )
		[m_helpCtrl showBadge];

	if( m_inputCtrl != nil )
		[m_inputCtrl showBadge];
	
	if( m_quizCtrl != nil )
		[m_quizCtrl showBadge];

	if( m_chkCtrl != nil )
		[m_chkCtrl showBadge];

	if( m_chkResultCtrl != nil )
		[m_chkResultCtrl showBadge];

	if( m_mutiChkResultCtrl != nil )
		[m_mutiChkResultCtrl showBadge];

	if( m_fitTopCtrl != nil )
		[m_fitTopCtrl showBadge];

	if( m_fitSelCtrl != nil )
		[m_fitSelCtrl showBadge];
	
	if( m_profileCtrl != nil )
		[m_profileCtrl showBadge];

	if( m_profileTopCtrl != nil )
		[m_profileTopCtrl showBadge];

	if( m_fittingCtrl != nil )
		[m_fittingCtrl showBadge];
	
	if( m_singleFittingCtrl != nil )
		[m_singleFittingCtrl showBadge];

	if( m_resultCtrl != nil )
		[m_resultCtrl showBadge];
	
	if( m_mutiChkCtrl != nil )
		[m_mutiChkCtrl showBadge];

	if( m_bestResultCtrl != nil )
		[m_bestResultCtrl showBadge];
	
	if( m_wastResultCtrl != nil )
		[m_wastResultCtrl showBadge];

	if( m_fittingSelCtrl != nil )
		[m_fittingSelCtrl showBadge];
	
	if( m_mutiFittingCtrl != nil )
		[m_mutiFittingCtrl showBadge];

	if( m_fitResultCtrl != nil )
		[m_fitResultCtrl showBadge];

	if( m_settingCtrl != nil )
		[m_settingCtrl showBadge];
	
	if( m_historyTopCtrl != nil )
		[m_historyTopCtrl showBadge];
	
	if( m_historyCtrl != nil )
		[m_historyCtrl showBadge];

	if( m_searchHistoryCtrl != nil ){
		
		[self closeSearchHistoryPage];
		[self showSearchHistoryPage:true];
		
		//[m_searchHistoryCtrl showBadge];
	}
		
	if( m_searchCtrl != nil )
		[m_searchCtrl showBadge];
	
	if( m_nearCtrl != nil )
		[m_nearCtrl showBadge];
		
	if( m_worldCtrl != nil )
		[m_worldCtrl showBadge];
}

-(void)showStartPage{
	
	glassShoes *gs = [glassShoes sharedInstance];
	startController* ctrl; 
	
	if ( [gs haveProfile]) {
		ctrl = [[startController alloc] initWithNibName:@"start2Controller" bundle:[NSBundle mainBundle]];
	}
	else {
		ctrl = [[startController alloc] initWithNibName:@"startController" bundle:[NSBundle mainBundle]];
	}
	
	self.m_startCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_startCtrl view]];
}

-(void)closeStartPage{
	
	if( m_startCtrl != nil ){
		
		[[m_startCtrl view] removeFromSuperview];
		[m_startCtrl release];
		m_startCtrl = nil;
	}
}

-(void)showHelpPage{
	
	helpController* ctrl = [[helpController alloc] initWithNibName:@"helpController" bundle:[NSBundle mainBundle]];
	
	self.m_helpCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_helpCtrl view]];
}

-(void)closeHelpPage{
	
	if( m_helpCtrl != nil ){
		
		[[m_helpCtrl view] removeFromSuperview];
		[m_helpCtrl release];
		m_helpCtrl = nil;
	}
}

-(void)showInputPage:(BOOL)bSingle num:(NSInteger)num{
	
	inputController* ctrl = [[inputController alloc] initWithNibName:@"inputController" bundle:[NSBundle mainBundle]];
	self.m_inputCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_inputCtrl view]];
	[m_inputCtrl setInfo:bSingle num:num];
}

-(void)closeInputPage{
	
	if( m_inputCtrl != nil ){
		
		[[m_inputCtrl view] removeFromSuperview];
		[m_inputCtrl release];
		m_inputCtrl = nil;
	}
}

-(void)showQuizPage:(NSInteger)quizNo single:(BOOL)bSingle num:(NSInteger)num{
	
	quizController* ctrl = [[quizController alloc] initWithNibName:@"quizController" bundle:[NSBundle mainBundle]];
	self.m_quizCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_quizCtrl view]];
	[m_quizCtrl setInfo:bSingle quizNo:quizNo num:num];
}

-(void)closeQuizPage{
	
	if( m_quizCtrl != nil ){
		
		[[m_quizCtrl view] removeFromSuperview];
		[m_quizCtrl release];
		m_quizCtrl = nil;
	}
}

-(void)showChkPage{
	
	checkController* ctrl = [[checkController alloc] initWithNibName:@"checkController" bundle:[NSBundle mainBundle]];
	self.m_chkCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_chkCtrl view]];
}

-(void)closeChkPage{
	
	if( m_chkCtrl != nil ){
		
		[[m_chkCtrl view] removeFromSuperview];
		[m_chkCtrl release];
		m_chkCtrl = nil;
	}
}

-(void)showChkResultPage{
	
	chkResultController* ctrl = [[chkResultController alloc] initWithNibName:@"chkResultController" bundle:[NSBundle mainBundle]];
	self.m_chkResultCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_chkResultCtrl view]];
}

-(void)closeChkResultPage{
	
	if( m_chkResultCtrl != nil ){
		
		[[m_chkResultCtrl view] removeFromSuperview];
		[m_chkResultCtrl release];
		m_chkResultCtrl = nil;
	}
}

-(void)showMutiChkResultPage{
	
	mutiResultController* ctrl = [[mutiResultController alloc] initWithNibName:@"mutiResultController" bundle:[NSBundle mainBundle]];
	self.m_mutiChkResultCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_mutiChkResultCtrl view]];
}

-(void)closeMutiChkResultPage{
	
	if( m_mutiChkResultCtrl != nil ){
		
		[[m_mutiChkResultCtrl view] removeFromSuperview];
		[m_mutiChkResultCtrl release];
		m_mutiChkResultCtrl = nil;
	}
}

-(void)showFitTopPage{
	
	fitTopController* ctrl = [[fitTopController alloc] initWithNibName:@"fitTopController" bundle:[NSBundle mainBundle]];
	self.m_fitTopCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_fitTopCtrl view]];
}

-(void)closeFitTopPage{
	
	if( m_fitTopCtrl != nil ){
		
		[[m_fitTopCtrl view] removeFromSuperview];
		[m_fitTopCtrl release];
		m_fitTopCtrl = nil;
	}
}

-(void)showFitSelPage:(BOOL)bFit{
	
	fitSelController* ctrl = [[fitSelController alloc] initWithNibName:@"fitSelController" bundle:[NSBundle mainBundle]];
	self.m_fitSelCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_fitSelCtrl view]];
	[m_fitSelCtrl setInfo:bFit];
}

-(void)closeFitSelPage{
	
	if( m_fitSelCtrl != nil ){
		
		[[m_fitSelCtrl view] removeFromSuperview];
		[m_fitSelCtrl release];
		m_fitSelCtrl = nil;
	}
}

-(void)showProfilePage:(NSInteger)profileNo from:(BOOL)bFit{
	
	profileController* ctrl = [[profileController alloc] initWithNibName:@"profileController" bundle:[NSBundle mainBundle]];
	self.m_profileCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_profileCtrl view]];
	[m_profileCtrl setInfo:profileNo from:bFit];
}

-(void)closeProfilePage{
	
	if( m_profileCtrl != nil ){
		
		[[m_profileCtrl view] removeFromSuperview];
		[m_profileCtrl release];
		m_profileCtrl = nil;
	}
}

-(void)showProfileTopPage{
	
	profileTopController* ctrl = [[profileTopController alloc] initWithNibName:@"profileTopController" bundle:[NSBundle mainBundle]];
	self.m_profileTopCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_profileTopCtrl view]];
}

-(void)closeProfileTopPage{
	
	if( m_profileTopCtrl != nil ){
		
		[[m_profileTopCtrl view] removeFromSuperview];
		[m_profileTopCtrl release];
		m_profileTopCtrl = nil;
	}
}

-(void)showFittingPage:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft{
	
	fittingController* ctrl = [[fittingController alloc] initWithNibName:@"fittingController" bundle:[NSBundle mainBundle]];
	self.m_fittingCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_fittingCtrl view]];
	[m_fittingCtrl setInfo:left right:right from:from bLeft:bLeft];
}

-(void)closeFittingPage{
	
	if( m_fittingCtrl != nil ){
		
		[[m_fittingCtrl view] removeFromSuperview];
		//[m_fittingCtrl release];
		m_fittingCtrl = nil;
	}
}

-(void)showSingleFittingPage:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft{
	
	singleFittingController* ctrl = [[singleFittingController alloc] initWithNibName:@"singleFittingController" bundle:[NSBundle mainBundle]];
	self.m_singleFittingCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_singleFittingCtrl view]];
	[m_singleFittingCtrl setInfo:left right:right from:from bLeft:bLeft];
}

-(void)closeSingleFittingPage{
	
	if( m_singleFittingCtrl != nil ){
		
		[[m_singleFittingCtrl view] removeFromSuperview];
		[m_singleFittingCtrl release];
		m_singleFittingCtrl = nil;
	}
}

-(void)showResultPage:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft{
	
	resultController* ctrl = [[resultController alloc] initWithNibName:@"resultController" bundle:[NSBundle mainBundle]];
	self.m_resultCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_resultCtrl view]];
	[m_resultCtrl setInfo:left right:right from:from bLeft:bLeft];
}

-(void)closeResultPage{
	
	if( m_resultCtrl != nil ){
		
		[[m_resultCtrl view] removeFromSuperview];
		[m_resultCtrl release];
		m_resultCtrl = nil;
	}
}

//
-(void)showMutiChkPage{
	
	mutiChkController* ctrl = [[mutiChkController alloc] initWithNibName:@"mutiChkController" bundle:[NSBundle mainBundle]];
	self.m_mutiChkCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_mutiChkCtrl view]];
}

-(void)closeMutiChkPage{
	
	if( m_mutiChkCtrl != nil ){
		
		[[m_mutiChkCtrl view] removeFromSuperview];
		[m_mutiChkCtrl release];
		m_mutiChkCtrl = nil;
	}
}

-(void)showBestFitPage{
	
	bestResultController* ctrl = [[bestResultController alloc] initWithNibName:@"bestResultController" bundle:[NSBundle mainBundle]];
	self.m_bestResultCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_bestResultCtrl view]];
}

-(void)closeBestFitPage{
	
	if( m_bestResultCtrl != nil ){
		
		[[m_bestResultCtrl view] removeFromSuperview];
		[m_bestResultCtrl release];
		m_bestResultCtrl = nil;
	}
}

-(void)showWastFitPage{
	
	wastResultController* ctrl = [[wastResultController alloc] initWithNibName:@"wastResultController" bundle:[NSBundle mainBundle]];
	self.m_wastResultCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_wastResultCtrl view]];
}

-(void)closeWastFitPage{
	
	if( m_wastResultCtrl != nil ){
		
		[[m_wastResultCtrl view] removeFromSuperview];
		[m_wastResultCtrl release];
		m_wastResultCtrl = nil;
	}
}

-(void)showMutiFitSelPage{
	
	fittingSelController* ctrl = [[fittingSelController alloc] initWithNibName:@"fittingSelController" bundle:[NSBundle mainBundle]];
	self.m_fittingSelCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_fittingSelCtrl view]];
}

-(void)closeMutiFitSelPage{
	
	if( m_fittingSelCtrl != nil ){
		
		[[m_fittingSelCtrl view] removeFromSuperview];
		[m_fittingSelCtrl release];
		m_fittingSelCtrl = nil;
	}
}

-(void)showMutiFittingPage:(NSInteger)left right:(NSInteger)right{
	
	mutiFittingController* ctrl = [[mutiFittingController alloc] initWithNibName:@"mutiFittingController" bundle:[NSBundle mainBundle]];
	self.m_mutiFittingCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_mutiFittingCtrl view]];
	[m_mutiFittingCtrl setInfo:left right:right];
}

-(void)closeMutiFittingPage{
	
	if( m_mutiFittingCtrl != nil ){
		
		[[m_mutiFittingCtrl view] removeFromSuperview];
		[m_mutiFittingCtrl release];
		m_mutiFittingCtrl = nil;
	}
}

-(void)showMutiFitResultPage:(NSInteger)left right:(NSInteger)right{
	
	fitResultController* ctrl = [[fitResultController alloc] initWithNibName:@"fitResultController" bundle:[NSBundle mainBundle]];
	self.m_fitResultCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_fitResultCtrl view]];
	[m_fitResultCtrl setInfo:left right:right];
}

-(void)closeMutiFitResultPage{
	
	if( m_fitResultCtrl != nil ){
		
		[[m_fitResultCtrl view] removeFromSuperview];
		[m_fitResultCtrl release];
		m_fitResultCtrl = nil;
	}
}

-(void)showSettingPage{
	
	settingController* ctrl = [[settingController alloc] initWithNibName:@"settingController" bundle:[NSBundle mainBundle]];
	self.m_settingCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_settingCtrl view]];
}

-(void)closeSettingPage{
	
	if( m_settingCtrl != nil ){
		
		[[m_settingCtrl view] removeFromSuperview];
		[m_settingCtrl release];
		m_settingCtrl = nil;
	}
}

-(void)showHistoryPage{
	
	glassShoes *gs = [glassShoes sharedInstance];
	NSInteger nBadge = [gs getBadge];
	
	if ( nBadge > 0 ) {
		
		[self showSearchHistoryPage:true];
		return;
	}
	
	historyTopController* ctrl = [[historyTopController alloc] initWithNibName:@"historyTopController" bundle:[NSBundle mainBundle]];
	self.m_historyTopCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_historyTopCtrl view]];
}

-(void)closeHistoryPage{

	if( m_historyTopCtrl != nil ){
		
		[[m_historyTopCtrl view] removeFromSuperview];
		[m_historyTopCtrl release];
		m_historyTopCtrl = nil;
	}
}

-(void)showFitHistoryPage:(BOOL)inScreen{
	
	historyController* ctrl = [[historyController alloc] initWithNibName:@"historyController" bundle:[NSBundle mainBundle]];
	self.m_historyCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_historyCtrl view]];
	
	if ( !inScreen ) {
		
		m_historyCtrl.view.frame = CGRectMake( -320, 0, 320, 480);
	}
}

-(void)moveFitHistoryPage:(NSInteger)type{

	if ( type == 0 ) {
		
		m_historyCtrl.view.frame = CGRectMake( -320, 0, 320, 480);
	}
	else {
		m_historyCtrl.view.frame = CGRectMake( 0, 0, 320, 480);
	}
}

-(void)closeFitHistoryPage{
	
	if( m_historyCtrl != nil ){
		
		[[m_historyCtrl view] removeFromSuperview];
		[m_historyCtrl release];
		m_historyCtrl = nil;
	}
}

-(void)showSearchHistoryPage:(BOOL)inScreen{
	
	searchHistoryController* ctrl = [[searchHistoryController alloc] initWithNibName:@"searchHistoryController" bundle:[NSBundle mainBundle]];
	self.m_searchHistoryCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_searchHistoryCtrl view]];

	if ( !inScreen ) {
		
		m_searchHistoryCtrl.view.frame = CGRectMake( 320, 0, 320, 480);
	}
}

-(void)closeSearchHistoryPage{
	
	if( m_searchHistoryCtrl != nil ){
		
		[[m_searchHistoryCtrl view] removeFromSuperview];
		[m_searchHistoryCtrl release];
		m_searchHistoryCtrl = nil;
	}
}

-(void)moveSearchHistoryPage:(NSInteger)type{
	
	if ( type == 0 ) {
		
		m_searchHistoryCtrl.view.frame = CGRectMake( 320, 0, 320, 480);
	}
	else {
		m_searchHistoryCtrl.view.frame = CGRectMake( 0, 0, 320, 480);
	}
}

-(void)showSearchPage{
	
	searchTopController* ctrl = [[searchTopController alloc] initWithNibName:@"searchTopController" bundle:[NSBundle mainBundle]];
	self.m_searchCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_searchCtrl view]];
}

-(void)closeSearchPage{
	
	if( m_searchCtrl != nil ){
		
		[[m_searchCtrl view] removeFromSuperview];
		[m_searchCtrl release];
		m_searchCtrl = nil;
	}
}

-(void)showNearPage:(NSString*)data{
	
	nearController* ctrl = [[nearController alloc] initWithNibName:@"nearController" bundle:[NSBundle mainBundle]];
	self.m_nearCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_nearCtrl view]];
	[m_nearCtrl setInfo:data];
}

-(void)closeNearPage{
	
	if( m_nearCtrl != nil ){
		
		[[m_nearCtrl view] removeFromSuperview];
		[m_nearCtrl release];
		m_nearCtrl = nil;
	}
}

-(void)showWorldPage:(NSString*)data{
	
	worldController* ctrl = [[worldController alloc] initWithNibName:@"worldController" bundle:[NSBundle mainBundle]];
	self.m_worldCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_worldCtrl view]];
	[m_worldCtrl setInfo:data];
}

-(void)closeWorldPage{
	
	if( m_worldCtrl != nil ){
		
		[[m_worldCtrl view] removeFromSuperview];
		[m_worldCtrl release];
		m_worldCtrl = nil;
	}
}

@end
