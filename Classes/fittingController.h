//
//  fittingController.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oyaController.h"

@class myGlassController;

@interface fittingController : oyaController<UIAccelerometerDelegate> {

	myGlassController* m_leftShoes;
	myGlassController* m_rightShoes;
	
	IBOutlet UIImageView* m_bkImg;

	UIImageView* m_msg1Img;
	UIImageView* m_msg2Img;
	
	UIImageView* m_guideImg;
	UIImageView* m_guide2Img;
	UIImageView* m_guide3Img;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger m_nLeft;
	NSInteger m_nRight;
	NSInteger m_cnt;
	NSInteger m_type;
	
	UIAccelerometer *m_accelerometer;
	BOOL m_bGet;
	BOOL m_bBump;

    // 接続要求
    NSURLRequest *_urlRequest;
    
    // サーバとの通信管理
    NSURLConnection *_connection;
    
    // ダウンロードしたデータ
    NSMutableData *_downloadedData;
    
    // サーバからのレスポンス
    NSURLResponse *_response;
	
	NSInteger m_commType;
	
	NSInteger m_chkCnt;
	
	NSTimer* m_timeoutTime;
	
	BOOL m_from;
	BOOL m_bLeft;
}

@property(nonatomic, retain)UIAccelerometer *m_accelerometer;

@property(nonatomic, retain)myGlassController* m_leftShoes;
@property(nonatomic, retain)myGlassController* m_rightShoes;

@property(nonatomic, retain)UIImageView* m_bkImg;

@property(nonatomic, retain)UIImageView* m_msg1Img;
@property(nonatomic, retain)UIImageView* m_msg2Img;

@property(nonatomic, retain)UIImageView* m_guideImg;
@property(nonatomic, retain)UIImageView* m_guide2Img;
@property(nonatomic, retain)UIImageView* m_guide3Img;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

// プロパティの定義
@property (retain, nonatomic) NSURLRequest *urlRequest;
@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *downloadedData;
@property (retain, nonatomic) NSURLResponse *response;

@property(nonatomic, retain)NSTimer* m_timeoutTime;

-(void)setInfo:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft;

- (void)stopTimer;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
-(void)doBump;
- (void)commTimeOut:( NSTimer *)aTimer;
- (void)connectCheckTimeOut:( NSTimer *)aTimer;

// type 1:	register
//		2:	nearSearch
//		3:	worldSearch
//		4:	bump me
//		5:	bump current
//		6+:	bump friend
- (void)connectToServer;
- (void)connectToServer2;
- (void)connectionDidFinished;
- (void)doComm:(NSMutableURLRequest*)request;

- (NSString *)hexDumpString:(NSData *)data;
- (NSData *)formEncodedDataFromDictionary:(NSDictionary *)dict;

-(void)showBadge;
@end
