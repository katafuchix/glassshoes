//
//  myGPSController.h
//  glassshoes
//
//  Created by james Lee on 11/09/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

// 位置情報の更新通知に必要な最低距離
static const CLLocationDistance kMinimumDistance = 20.0;

#define COMM_REG		1
#define COMM_NEAR		2
#define COMM_WORLD		3
#define COMM_BUMP_ME	4
#define COMM_BUMP_CUR	5
#define COMM_BUMP_FRD	6

@class startController;
@class helpController;
@class inputController;
@class quizController;
@class checkController;
@class chkResultController;
@class fitTopController;
@class fitSelController;
@class profileController;
@class profileTopController;
@class fittingController;
@class singleFittingController;
@class resultController;
@class mutiResultController;
@class mutiChkController;
@class bestResultController;
@class wastResultController;
@class fittingSelController;
@class mutiFittingController;
@class fitResultController;
@class settingController;
@class historyTopController;
@class historyController;
@class searchHistoryController;
@class searchTopController;
@class nearController;
@class worldController;

@interface myGPSController : UIViewController<CLLocationManagerDelegate,MKReverseGeocoderDelegate> {

	startController* m_startCtrl;
	helpController* m_helpCtrl;
	inputController* m_inputCtrl;
	quizController* m_quizCtrl;
	checkController* m_chkCtrl;
	chkResultController* m_chkResultCtrl;
	mutiResultController* m_mutiChkResultCtrl;
	
	mutiChkController* m_mutiChkCtrl;
	bestResultController* m_bestResultCtrl;
	wastResultController* m_wastResultCtrl;
	fittingSelController* m_fittingSelCtrl;
	mutiFittingController* m_mutiFittingCtrl;
	fitResultController* m_fitResultCtrl;
	
	fitTopController* m_fitTopCtrl;
	fitSelController* m_fitSelCtrl;
	profileController* m_profileCtrl;
	profileTopController* m_profileTopCtrl;
	
	fittingController* m_fittingCtrl;
	singleFittingController* m_singleFittingCtrl;
	resultController* m_resultCtrl;
	
	searchTopController* m_searchCtrl;
	settingController* m_settingCtrl;
	
	historyTopController* m_historyTopCtrl;
	historyController* m_historyCtrl;
	searchHistoryController* m_searchHistoryCtrl;
	
	nearController* m_nearCtrl;
	worldController* m_worldCtrl;
	
    // 位置情報を取得するためのオブジェクト
    CLLocationManager *_locationManager;
	
    // 逆ジオコーダから取得した情報
    MKPlacemark *_placemark;
    
    // 逆ジオコーダ
    MKReverseGeocoder *_reverseGeocoder;

    // 接続要求
    NSURLRequest *_urlRequest;
    
    // サーバとの通信管理
    NSURLConnection *_connection;
    
    // ダウンロードしたデータ
    NSMutableData *_downloadedData;
    
    // サーバからのレスポンス
    NSURLResponse *_response;
	
	NSInteger m_commType;
}

@property (nonatomic, retain)startController* m_startCtrl;
@property (nonatomic, retain)helpController* m_helpCtrl;
@property (nonatomic, retain)inputController* m_inputCtrl;
@property (nonatomic, retain)quizController* m_quizCtrl;
@property (nonatomic, retain)checkController* m_chkCtrl;
@property (nonatomic, retain)chkResultController* m_chkResultCtrl;
@property (nonatomic, retain)fitTopController* m_fitTopCtrl;
@property (nonatomic, retain)fitSelController* m_fitSelCtrl;
@property (nonatomic, retain)profileController* m_profileCtrl;
@property (nonatomic, retain)profileTopController* m_profileTopCtrl;
@property (nonatomic, retain)fittingController* m_fittingCtrl;
@property (nonatomic, retain)singleFittingController* m_singleFittingCtrl;
@property (nonatomic, retain)resultController* m_resultCtrl;
@property (nonatomic, retain)mutiResultController* m_mutiChkResultCtrl;
@property (nonatomic, retain)mutiChkController* m_mutiChkCtrl;
@property (nonatomic, retain)bestResultController* m_bestResultCtrl;
@property (nonatomic, retain)wastResultController* m_wastResultCtrl;
@property (nonatomic, retain)fittingSelController* m_fittingSelCtrl;
@property (nonatomic, retain)mutiFittingController* m_mutiFittingCtrl;
@property (nonatomic, retain)fitResultController* m_fitResultCtrl;
@property (nonatomic, retain)searchTopController* m_searchCtrl;
@property (nonatomic, retain)settingController* m_settingCtrl;
@property (nonatomic, retain)historyTopController* m_historyTopCtrl;
@property (nonatomic, retain)historyController* m_historyCtrl;
@property (nonatomic, retain)searchHistoryController* m_searchHistoryCtrl;
@property (nonatomic, retain)nearController* m_nearCtrl;
@property (nonatomic, retain)worldController* m_worldCtrl;

@property (retain, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, retain) MKPlacemark *placemark;
@property (nonatomic, retain) MKReverseGeocoder *reverseGeocoder;

// プロパティの定義
@property (retain, nonatomic) NSURLRequest *urlRequest;
@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *downloadedData;
@property (retain, nonatomic) NSURLResponse *response;

-(void)showStartPage;
-(void)closeStartPage;

-(void)showHelpPage;
-(void)closeHelpPage;

-(void)showInputPage:(BOOL)bSingle num:(NSInteger)num;
-(void)closeInputPage;

-(void)showQuizPage:(NSInteger)quizNo single:(BOOL)bSingle num:(NSInteger)num;
-(void)closeQuizPage;

-(void)showChkPage;
-(void)closeChkPage;

-(void)showChkResultPage;
-(void)closeChkResultPage;

-(void)showMutiChkResultPage;
-(void)closeMutiChkResultPage;

-(void)showFitTopPage;
-(void)closeFitTopPage;

-(void)showFitSelPage:(BOOL)bFit;
-(void)closeFitSelPage;

-(void)showProfilePage:(NSInteger)profileNo from:(BOOL)bFit;
-(void)closeProfilePage;

-(void)showProfileTopPage;
-(void)closeProfileTopPage;

-(void)showFittingPage:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft;
-(void)closeFittingPage;

-(void)showSingleFittingPage:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft;
-(void)closeSingleFittingPage;

-(void)showResultPage:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft;
-(void)closeResultPage;

-(void)showMutiChkPage;
-(void)closeMutiChkPage;

-(void)showBestFitPage;
-(void)closeBestFitPage;

-(void)showWastFitPage;
-(void)closeWastFitPage;

-(void)showMutiFitSelPage;
-(void)closeMutiFitSelPage;

-(void)showMutiFittingPage:(NSInteger)left right:(NSInteger)right;
-(void)closeMutiFittingPage;

-(void)showMutiFitResultPage:(NSInteger)left right:(NSInteger)right;
-(void)closeMutiFitResultPage;

-(void)showSettingPage;
-(void)closeSettingPage;

-(void)showHistoryPage;
-(void)closeHistoryPage;

-(void)showFitHistoryPage:(BOOL)inScreen;
-(void)closeFitHistoryPage;
-(void)moveFitHistoryPage:(NSInteger)type;

-(void)showSearchHistoryPage:(BOOL)inScreen;
-(void)closeSearchHistoryPage;
-(void)moveSearchHistoryPage:(NSInteger)type;

-(void)showSearchPage;
-(void)closeSearchPage;

-(void)showNearPage:(NSString*)data;
-(void)closeNearPage;

-(void)showWorldPage:(NSString*)data;
-(void)closeWorldPage;

- (void)prepareGPS;
- (void)controlGPS;

- (void)reloadFromPlacemark;
- (void)reloadFromReverseGeocoder;

- (void)registDevice;
- (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
- (NSString *)hexDumpString:(NSData *)data;
- (NSData *)formEncodedDataFromDictionary:(NSDictionary *)dict;
- (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo show:(BOOL)show;

- (void)connectToServer:(NSInteger)type;

- (void)doComm:(NSMutableURLRequest*)request;

-(void)showBadge;

@end
