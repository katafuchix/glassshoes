//
//  glassShoes.h
//  glassshoes
//
//  Created by james Lee on 11/08/08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class question;
@class profile;

@interface glassShoes : NSObject
{
	NSMutableArray* m_sQuesLists;
	NSMutableArray* m_mQuesLists;
	
	profile* m_myProfile;
	profile* m_guestProfile;
	NSMutableArray* m_friendLists;
	NSMutableArray* m_mutiLists;

	NSMutableArray* m_fitLists;
	NSMutableArray* m_searchLists;
	
	BOOL m_bMan;
	NSString* m_name;
	NSInteger m_type;
	
	NSInteger m_nBestFit;
	NSInteger m_nBestMan[12];
	NSInteger m_nBestWoman[12];
	NSInteger m_nBestFitCnt;
	
	NSInteger m_nWastFit;
	NSInteger m_nWastMan[12];
	NSInteger m_nWastWoman[12];
	NSInteger m_nWastFitCnt;

	BOOL		m_bPushReceive;
	NSInteger	m_GPStime;
//	BOOL		m_bComm;
	NSString*	m_token;
	NSDate*		m_fireDate;

    // 位置
	CLLocationCoordinate2D coordinate;
	
	NSString* m_myPlace;
	NSString* m_upPlace;
	
	NSString*	m_worldSearchTime;
	NSString*	m_worldSearchNum;
	NSString*	m_worldSearchNear;
	NSString*	m_worldSearchDistance;
	
	BOOL	m_haveToken;
	BOOL	m_canLocation;
	
	NSInteger	m_badge;
}

@property( nonatomic, retain )NSDate* m_fireDate;

@property( nonatomic, retain )NSMutableArray* m_fitLists;
@property( nonatomic, retain )NSMutableArray* m_searchLists;

@property( nonatomic, retain )NSMutableArray* m_sQuesLists;
@property( nonatomic, retain )NSMutableArray* m_mQuesLists;

@property( nonatomic, retain )profile* m_myProfile;
@property( nonatomic, retain )profile* m_guestProfile;
@property( nonatomic, retain )NSMutableArray* m_friendLists;
@property( nonatomic, retain )NSMutableArray* m_mutiLists;

@property( nonatomic, retain )NSString* m_name;

@property( nonatomic, retain )NSString* m_token;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property( nonatomic, retain )NSString* m_myPlace;
@property( nonatomic, retain )NSString* m_upPlace;

@property( nonatomic, retain )NSString*	m_worldSearchTime;
@property( nonatomic, retain )NSString*	m_worldSearchNum;
@property( nonatomic, retain )NSString*	m_worldSearchNear;
@property( nonatomic, retain )NSString*	m_worldSearchDistance;

-(id)init;

// glassShoesのインスタンスを取得します。
+(glassShoes*)sharedInstance;

-(BOOL)checkToken;
-(void)setCanToken:(BOOL)bCan;
-(BOOL)checkLocation;
-(void)setCanLocation:(BOOL)bCan;

- (void)clearFriendProfiles;
- (void)clearMutiProfiles;

- (void)clearSingleQuiz;
- (void)clearMutiQuiz;
- (void)resetSingleQuiz;
- (void)resetMutiQuiz;

- (question*)getSingleQuiz:(NSInteger)place;
- (void)setSingleQuizAnswer:(NSInteger)quizNo answer:(NSInteger)answer;
- (question*)getMutiQuiz:(NSInteger)place;
- (void)setMutiQuizAnswer:(NSInteger)quizNo answer:(NSInteger)answer;

- (void)setSex:(BOOL)bMan single:(BOOL)bSingle;
- (NSInteger)checkSingleType;
- (NSInteger)checkSingleTypes:(NSMutableArray*)plist;
- (BOOL)isMan;

- (void)setName:(NSString*)name;

- (void)setProfile:(BOOL)bSelf;
- (BOOL)canSaveFriend;
- (NSInteger)getNewProfilePos;

- (void)saveUserData;
- (void)loadUserData;

- (void)saveMyProfile;
- (void)loadMyProfile;

- (void)saveFriendsProfile;
- (void)loadFriendsProfile;

- (void)addMutiProfile;
- (NSInteger)getMutiNumber;
- (BOOL)haveTwoSex;
- (void)getBestWast;
- (NSInteger)checkMutiFit:(profile*)left right:(profile*)right;
- (NSInteger)getMaxFit;
- (NSInteger)getMaxFitCnt;
- (NSInteger)getMaxFitMan:(NSInteger)number;
- (NSInteger)getMaxFitWoman:(NSInteger)number;
- (NSInteger)getMinFit;
- (NSInteger)getMinFitCnt;
- (NSInteger)getMinFitMan:(NSInteger)number;
- (NSInteger)getMinFitWoman:(NSInteger)number;

- (BOOL)haveProfile;

- (void)delFriendProfile:(NSInteger)place;

- (NSInteger)checkFit:(NSInteger)left right:(NSInteger)right;

- (BOOL)setCoord:(CLLocationCoordinate2D)coord;
- (CLLocationCoordinate2D)getCoord;

- (void)clearFitLists;
- (void)clearSearchLists;

- (void)addFitHistory:(NSString*)left right:(NSString*)right per:(NSInteger)per;
- (void)delFitHistory:(NSInteger)place;
- (void)saveFitHistory;
- (void)loadFitHistory;

- (void)addSearchHistory:(NSInteger)best good:(NSInteger)good;
- (void)addBeSearchHistory:(NSString*)str;
- (void)delSearchHistory:(NSInteger)place;
- (void)saveSearchHistory;
- (void)loadSearchHistory;

- (BOOL)getPushFlag;
- (void)setPushFlag:(BOOL)bPush;
- (NSInteger)getGPSFlag;
- (void)setGPSFlag:(NSInteger)gpstime;

- (void)addBadge:(NSInteger)cnt;
- (NSInteger)getBadge;
- (void)clearBadge;

@end
