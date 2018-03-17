//
//  glassShoes.m
//  glassshoes
//
//  Created by james Lee on 11/08/08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "glassshoesAppDelegate.h"
#import "glassShoes.h"
#import "question.h"
#import "profile.h"

@implementation glassShoes

@synthesize m_fitLists;
@synthesize m_searchLists;

@synthesize m_myPlace;
@synthesize m_upPlace;

@synthesize m_worldSearchTime;
@synthesize m_worldSearchNum;
@synthesize m_worldSearchNear;
@synthesize m_worldSearchDistance;

@synthesize m_sQuesLists;
@synthesize m_mQuesLists;

@synthesize m_myProfile;
@synthesize m_guestProfile;
@synthesize m_friendLists;
@synthesize m_mutiLists;

@synthesize m_name;
@synthesize m_token;
@synthesize m_fireDate;

@synthesize coordinate = _coordinate;

static glassShoes *_instance = nil;

-(id)init {

	if ([super init]) {

        memset(&_coordinate, 0, sizeof(_coordinate));
		m_GPStime = 1;
		//[self setGPSFlag:1];
		//[self setPushFlag:true];
		
		self.m_fitLists = nil;
		self.m_searchLists = nil;
		
		self.m_sQuesLists = nil;
		self.m_mQuesLists = nil;
		self.m_myProfile = nil;
		self.m_guestProfile = nil;
		self.m_friendLists = nil;
		self.m_mutiLists = nil;
		self.m_name = nil;
		self.m_token = nil;
		self.m_fireDate = nil;
		self.m_myPlace = nil;
		self.m_upPlace = nil;
		self.m_worldSearchTime = nil;		
		self.m_worldSearchNum = nil;		
		self.m_worldSearchNear = nil;		
		self.m_worldSearchDistance = nil;	
		
		m_haveToken = false;
		m_canLocation = false;
		
		[self loadUserData];
		[self loadMyProfile];
		[self loadFriendsProfile];
		[self loadFitHistory];
		[self loadSearchHistory];
	}
	return self;
}

+(glassShoes*)sharedInstance {
	
	if (_instance == nil) {
		_instance = [[glassShoes alloc] init];
	}
	return _instance;
}

- (void)dealloc {

	if( self.m_worldSearchTime != nil ){
		[m_worldSearchTime release];
		m_worldSearchTime = nil;
	}
	
	if( self.m_worldSearchNum != nil ){
		[m_worldSearchNum release];
		m_worldSearchNum = nil;
	}

	if( self.m_worldSearchNear != nil ){
		[m_worldSearchNear release];
		m_worldSearchNear = nil;
	}
	
	if( self.m_worldSearchDistance != nil ){
		[m_worldSearchDistance release];
		m_worldSearchDistance = nil;
	}
	
	if( self.m_myPlace != nil ){
		[m_myPlace release];
		m_myPlace = nil;
	}

	if( self.m_upPlace != nil ){
		[m_upPlace release];
		m_upPlace = nil;
	}
	
	if( self.m_name != nil ){
		[m_name release];
		m_name = nil;
	}
	
	if ( m_guestProfile != nil ) {
		[m_guestProfile release];
		m_guestProfile = nil;
	}
	
	if ( m_myProfile != nil ) {
		[m_myProfile release];
		m_myProfile = nil;
	}
	
	[self clearFriendProfiles];
	[self clearMutiProfiles];
	
	[self clearMutiQuiz];
	[self clearSingleQuiz];
	
	[self clearFitLists];
	[self clearSearchLists];
	
	if ( m_token != nil ) {
		[m_token release];
		m_token = nil;
	}
	
	if ( m_fireDate != nil ) {
		[m_fireDate release];
		m_fireDate = nil;
	}
	
    [super dealloc];
}

-(BOOL)checkToken{

	return m_haveToken; 
}

-(void)setCanToken:(BOOL)bCan{

	m_haveToken = bCan;
}

-(BOOL)checkLocation{
	
	return m_canLocation; 
}

-(void)setCanLocation:(BOOL)bCan{
	
	m_canLocation = bCan;
}

- (void)clearFitLists{
	
	if ( m_fitLists != nil ) {
		
		[m_fitLists removeAllObjects];
		[m_fitLists release];
		m_fitLists = nil;
	}
}

- (void)clearSearchLists{
	
	if ( m_searchLists != nil ) {
		
		[m_searchLists removeAllObjects];
		[m_searchLists release];
		m_searchLists = nil;
	}
}

- (void)clearSingleQuiz{
	
	if ( m_sQuesLists != nil ) {
		
		[m_sQuesLists removeAllObjects];
		[m_sQuesLists release];
		m_sQuesLists = nil;
	}
}

- (void)clearMutiQuiz{
	
	if ( m_mQuesLists != nil ) {
		
		[m_mQuesLists removeAllObjects];
		[m_mQuesLists release];
		m_mQuesLists = nil;
	}
}

- (void)clearMutiProfiles{
	
	if ( m_mutiLists != nil ) {
		
		[m_mutiLists removeAllObjects];
		[m_mutiLists release];
		m_mutiLists = nil;
	}
}

- (void)clearFriendProfiles{
	
	if ( m_friendLists != nil ) {
		
		[m_friendLists removeAllObjects];
		[m_friendLists release];
		m_friendLists = nil;
	}
}

- (void)resetSingleQuiz{

	int i;
	
	[self clearSingleQuiz];

	m_sQuesLists = [[NSMutableArray alloc] init];

	NSMutableArray* initLists = [[NSMutableArray alloc] init];
	
	for( i= 0; i< 20; i++ ){
		
		[initLists addObject:[NSNumber numberWithInt:(i+1)]];
	}

	srand( time(nil) );
	
	for( i= 0; i< 20; i++ ){

		NSInteger count = [initLists count];
		
		int place = rand()%count;

		NSNumber* element = [initLists objectAtIndex:place];
		NSInteger nextQuiz = [element unsignedIntValue];
		[initLists removeObjectAtIndex:place];

		question* q = [[question alloc] init:nextQuiz];
		[m_sQuesLists addObject:q];
	}
	
	[initLists removeAllObjects];
	[initLists release];
	initLists = nil;
}

- (void)resetMutiQuiz{
	
	int i;
	
	[self clearMutiQuiz];
	
	m_mQuesLists = [[NSMutableArray alloc] init];
	
	NSMutableArray* initLists = [[NSMutableArray alloc] init];
	
	srand( time(nil) );
	
	for( i= 0; i< 5; i++ ){

		int place = rand()%2;
		
		[initLists addObject:[NSNumber numberWithInt:(i*2+place+1)]];
	}
	
	for( i= 0; i< 5; i++ ){
		
		NSInteger count = [initLists count];
		
		int place = rand()%count;
		
		NSNumber* element = [initLists objectAtIndex:place];
		NSInteger nextQuiz = [element unsignedIntValue];
		[initLists removeObjectAtIndex:place];
		
		question* q = [[question alloc] init:nextQuiz];
		[m_mQuesLists addObject:q];
	}
	
	[initLists removeAllObjects];
	[initLists release];
	initLists = nil;
}

- (question*)getSingleQuiz:(NSInteger)place{

	if ( place > 19 ) {
		
		return nil;
	}
	
	if( m_sQuesLists == nil ){

		[self resetSingleQuiz];
	}
	
	return [m_sQuesLists objectAtIndex:place];
}

- (void)setSingleQuizAnswer:(NSInteger)quizNo answer:(NSInteger)answer{

	question* q = [m_sQuesLists objectAtIndex:quizNo];
	[q setAnswer:answer];
}

- (question*)getMutiQuiz:(NSInteger)place{
	
	if ( place > 4 ) {
		
		return nil;
	}
	
	if( m_mQuesLists == nil ){
		
		[self resetMutiQuiz];
	}
	
	return [m_mQuesLists objectAtIndex:place];
}

- (void)setMutiQuizAnswer:(NSInteger)quizNo answer:(NSInteger)answer{
	
	question* q = [m_mQuesLists objectAtIndex:quizNo];
	[q setAnswer:answer];
}

- (void)setSex:(BOOL)bMan single:(BOOL)bSingle{

	m_bMan = bMan;
	
	if ( bSingle) {
		[self resetSingleQuiz];
	}
}

- (NSInteger)checkSingleType{

	m_type = [self checkSingleTypes:m_sQuesLists];
	return m_type;
}

- (NSInteger)checkSingleTypes:(NSMutableArray*)plist{

	int i;
	NSInteger nT[] = { 0, 0, 0, 0 };	//内向or外向
										//五感or直感
										//思考or情緒
										//決断or柔軟
	
	for( i= 0; i< 20; i++ ){
		
		question* q = [plist objectAtIndex:i];
		NSInteger quizNo = [q getQuizNo]-1;
		NSInteger answer = [q getSelAnswer];
		
		//NSLog( @"q[%d] : no = %d, answer = %d ", i, quizNo, answer );
		
		if ( answer > 2 ){
			  
			nT[quizNo/5]++;
		}
	}

	for( i= 0; i< 4; i++ ){

		//NSLog( @"old nT[%d] = %d ", i, nT[i] );
		if ( i == 2 ) {

			if ( nT[i] > 2 ) {
				
				nT[i] = 1;
			}
			else {
				nT[i] = 0;
			}
		}
		else {
			if ( nT[i] > 2 ) {
				
				nT[i] = 0;
			}
			else {
				nT[i] = 1;
			}
		}
	}

	// type 0 : A2 B2 C2 D2 才能みなぎる「宮廷音楽家」
	// type 1 : A2 B2 C2 D1 使命感あふれる「医者」
	// type 2 : A2 B2 C1 D2 聡明な「預言者」
	// type 3 : A2 B2 C1 D1 頭のきれる「参謀」
	// type 4 : A2 B1 C2 D2 温厚な「宮廷料理人」
	// type 5 : A2 B1 C2 D1 誇り高き「騎士団長」
	// type 6 : A2 B1 C1 D2 孤高の「サムライ」
	// type 7 : A2 B1 C1 D1 厳しい教育係「ばあや」
	// type 8 : A1 B2 C2 D2 好奇心の塊「発明家」
	// type 9 : A1 B2 C2 D1 人の為に尽くす「シスター」
	// type10 : A1 B2 C1 D2 熱意メラメラの「商人」
	// type11 : A1 B2 C1 D1 生まれついての「国王」
	// type12 : A1 B1 C2 D2 陽気な「吟遊詩人」
	// type13 : A1 B1 C2 D1 気立てのいい「貴族」
	// type14 : A1 B1 C1 D2 人生を楽しむ「海賊」
	// type15 : A1 B1 C1 D1 頼りになる「大臣」
	NSInteger type = nT[0]*8+ nT[1]*4+ nT[2]*2+ nT[3];

	//NSLog( @"type = %d, nT[0] = %d, nT[1] = %d, nT[2] = %d, nT[3] = %d", type, nT[0], nT[1], nT[2], nT[3] );
	
	return type;
}

- (BOOL)haveProfile{

	if ( self.m_myProfile != nil ) {
		
		return true;
	}
	
	return false;
}

- (void)addMutiProfile{
	
	profile* p = [[profile alloc] init:m_name type:100 bMan:m_bMan data:m_mQuesLists];
	
	if ( m_mutiLists == nil ) {
		
		m_mutiLists = [[NSMutableArray alloc] init];
	}
	
	[m_mutiLists addObject:p];
}

- (NSInteger)getMutiNumber{

	if ( m_mutiLists == nil ) {

		return 0;
	}
	
	return [m_mutiLists count];
}

- (BOOL)haveTwoSex{

	if ( m_mutiLists == nil ) {
		
		return false;
	}
	
	BOOL have_man = false;
	BOOL have_woman = false;

	if ( m_bMan ) {
		have_man = true;
	}
	else {
		have_woman = true;
	}

	
	for( int i= 0; i< [m_mutiLists count]; i++ ){
	
		profile* p = (profile*)[m_mutiLists objectAtIndex:i];
		if ( [p isMan] ) {
			have_man = true;
		}
		else {
			have_woman = true;
		}
	}

	if ( have_man && have_woman ) {
		
		return true;
	}
	
	return false;
}

- (void)getBestWast{
	
	m_nBestFitCnt = 0;
	m_nWastFitCnt = 0;
	
	NSInteger maxPt = 0;
	NSInteger minPt = 100;
	
	for( int i= 0; i< [m_mutiLists count]; i++ ){

		profile* l = (profile*)[m_mutiLists objectAtIndex:i];
		if ( [l isMan] == false ) {
			continue;
		}
		
		for( int j= 0; j< [m_mutiLists count]; j++ ){
	
			profile* r = (profile*)[m_mutiLists objectAtIndex:j];
			if ( [r isMan] == true ) {
				continue;
			}
			
			NSInteger pt = [self checkMutiFit:l right:r];
			if ( pt > maxPt ) {

				maxPt = pt;
				m_nBestMan[0] = i;
				m_nBestWoman[0] = j;
				m_nBestFitCnt = 1;
			}
			else if ( pt == maxPt ) {
				
				m_nBestMan[m_nBestFitCnt] = i;
				m_nBestWoman[m_nBestFitCnt] = j;
				m_nBestFitCnt++;
			}
			
			if ( pt < minPt ) {
				
				minPt = pt;
				m_nWastMan[0] = i;
				m_nWastWoman[0] = j;
				m_nWastFitCnt = 1;
			}
			else if ( pt == minPt ) {
				
				m_nWastMan[m_nWastFitCnt] = i;
				m_nWastWoman[m_nWastFitCnt] = j;
				m_nWastFitCnt++;
			}
		}
	}
	
	m_nBestFit = maxPt;
	m_nWastFit = minPt;
}

- (NSInteger)getMaxFit{

	return m_nBestFit;
}

- (NSInteger)getMaxFitCnt{

	return m_nBestFitCnt;
}

- (NSInteger)getMaxFitMan:(NSInteger)number{
	
	return m_nBestMan[number];
}

- (NSInteger)getMaxFitWoman:(NSInteger)number{
	
	return m_nBestWoman[number];
}

- (NSInteger)getMinFit{
	
	return m_nWastFit;
}

- (NSInteger)getMinFitCnt{
	
	return m_nWastFitCnt;
}

- (NSInteger)getMinFitMan:(NSInteger)number{
	
	return m_nWastMan[number];
}

- (NSInteger)getMinFitWoman:(NSInteger)number{
	
	return m_nWastWoman[number];
}

- (NSInteger)checkMutiFit:(profile*)left right:(profile*)right{
	
	NSInteger cnt = 0;
	
	for ( int i= 0; i < 5; i ++ ) {
		
		question* l = (question*)[left.m_quesLists objectAtIndex:i];
		question* r = (question*)[right.m_quesLists objectAtIndex:i];
		
		NSInteger quizNo = [l getQuizNo];
		NSInteger la = [l getSelAnswer];
		NSInteger ra = [r getSelAnswer];

		//NSLog( @" q[%d] - %d : %d", quizNo, la, ra );
		
		if( quizNo == 5 || quizNo == 7 || quizNo == 9 )
			cnt += abs( la- ra )* 20;
		else
			cnt += ( 3- abs( la- ra ))* 20;
	}
	
	//NSLog( @" %@ - %@ : %d", left.m_name, right.m_name, cnt/3 );
	
	return cnt/3;
}

- (BOOL)isMan{

	return m_bMan;
}

- (void)setName:(NSString*)name{
	
	NSString* str = [[NSString alloc] initWithFormat:@"%@", name];
	self.m_name = str;
	[str release];
}

- (void)setProfile:(BOOL)bSelf{

	profile* p = [[profile alloc] init:m_name type:m_type bMan:m_bMan data:m_sQuesLists];
	
	if ( bSelf ) {
		
		self.m_myProfile = p;
		[p release];
		
		[self saveMyProfile];
		return;
	}

	if ( m_friendLists == nil ) {
		
		m_friendLists = [[NSMutableArray alloc] init];
	}

	if ( [m_friendLists count] == 30){
		
		[m_friendLists removeObjectAtIndex:0];
	}

	[m_friendLists addObject:p];
	
	[self saveFriendsProfile];
}

- (BOOL)canSaveFriend{

	if ( m_friendLists == nil ) {
		return true;
	}
	
	NSInteger max = 30;
	NSInteger count = [m_friendLists count];
	
	if ( count >= max ) {
		
		return false;
	}
	
	return true;
}

- (NSInteger)getNewProfilePos{

	if ( m_friendLists == nil ) {
		return 0;
	}
	
	return [m_friendLists count];
}

- (void)saveMyProfile{
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"myProfile.dat"];
	NSError *error;

	NSString* bodyText;
	
	if ( m_myProfile == nil  ) {

		bodyText = [[[NSString alloc] initWithFormat:@"0"] autorelease];
	}
	else {
		bodyText = [[[NSString alloc] initWithFormat:@"1#%@", [m_myProfile save]] autorelease];
	}
	
	BOOL ok = [bodyText writeToFile:fileName atomically:YES encoding:NSShiftJISStringEncoding error:&error];
	
	if( ok == true ){
		
		glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
		[appli.m_gpsCtrl connectToServer:1];
	}
}

- (void)loadMyProfile{
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"myProfile.dat"];
	
	NSData *data = [NSData dataWithContentsOfFile:fileName];
	
	if( data != nil ){
		
		NSString *bodyText = [[NSString alloc] initWithData:data encoding:NSShiftJISStringEncoding];
		NSArray *items = [bodyText componentsSeparatedByString:@"#"];
		NSInteger count = [[items objectAtIndex:0] intValue];

		if ( count == 1 && [items count] == 2 ) {
			
			profile* p = [[profile alloc] load:[items objectAtIndex:1]];
			self.m_myProfile = p;
			[p release];
		}
		
		[bodyText release];
	}
}

- (void)saveUserData{

/*	
	NSString* worldSearchTime = @"";
	if ( m_worldSearchTime != nil ) {
		
		worldSearchTime = m_worldSearchTime;	
	}
	
	NSString* worldSearchNum = @"";
	if ( m_worldSearchNum != nil ) {
		
		worldSearchNum = m_worldSearchNum;
	}
	
	NSString* worldSearchNear = @"";
	if ( m_worldSearchNear != nil ) {
		
		worldSearchNear = m_worldSearchNear;
	}
	
	NSString* worldSearchDistance = @"";
	if ( m_worldSearchDistance != nil ) {
		
		worldSearchDistance = m_worldSearchDistance;
	}
*/
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"userData.dat"];
	NSError *error;
	
	NSString* bodyText = [[[NSString alloc] initWithFormat:@"%d#%d", 
						   m_GPStime, m_badge] autorelease];
	
	BOOL ok = [bodyText writeToFile:fileName atomically:YES encoding:NSShiftJISStringEncoding error:&error];
	
	if( ok == true ){
		
	}
	
	/*
	NSString* upPlace = @"";
	if ( m_upPlace != nil ) {
		
		upPlace = m_upPlace;
	}

	NSString* myPlace = @"";
	if ( m_myPlace != nil ) {
		
		myPlace = m_myPlace;
	}

	NSString* worldSearchTime = @"";
	if ( m_worldSearchTime != nil ) {
		
		worldSearchTime = m_worldSearchTime;	
	}
	
	NSString* worldSearchNum = @"";
	if ( m_worldSearchNum != nil ) {
		
		worldSearchNum = m_worldSearchNum;
	}

	NSString* worldSearchNear = @"";
	if ( m_worldSearchNear != nil ) {
		
		worldSearchNear = m_worldSearchNear;
	}
	
	NSString* worldSearchDistance = @"";
	if ( m_worldSearchDistance != nil ) {
		
		worldSearchDistance = m_worldSearchDistance;
	}
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateFormat  = @"yyyy/MM/dd HH:mm:ss";
	
	NSString* fireDate = @"";
	if( m_fireDate != nil )
		fireDate = [df stringFromDate:m_fireDate];
	 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"userData.dat"];
	NSError *error;
	
	NSString* bodyText = [[[NSString alloc] initWithFormat:@"%@#%d#%f#%f#%@#%@#%@#%@#%@#%@#%@", 
						   m_token, m_GPStime, coordinate.latitude, coordinate.longitude, upPlace, myPlace, 
						   fireDate, worldSearchTime, worldSearchNum, worldSearchNear, worldSearchDistance] autorelease];
	
	BOOL ok = [bodyText writeToFile:fileName atomically:YES encoding:NSShiftJISStringEncoding error:&error];
	
	if( ok == true ){
		
	}
	*/ 
}

- (void)loadUserData{

	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"userData.dat"];
	
	NSData *data = [NSData dataWithContentsOfFile:fileName];
	
	if( data != nil ){
		
		NSString *bodyText = [[NSString alloc] initWithData:data encoding:NSShiftJISStringEncoding];
		NSArray *items = [bodyText componentsSeparatedByString:@"#"];
		
		if ( [items count] == 2 ) {
			
			m_GPStime = [[items objectAtIndex:0] intValue];
			m_badge = [[items objectAtIndex:1] intValue];
		}
		else if ( [items count] == 11 ) {

			NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:0]];
			m_token = str;
			[str release];
			
			m_GPStime = [[items objectAtIndex:1] intValue];
			coordinate.longitude = [[items objectAtIndex:2] floatValue];
			coordinate.longitude = [[items objectAtIndex:3] floatValue];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:4]];
			m_upPlace = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:5]];
			m_myPlace = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:6]];
			if( [str length] == 19 ){
			
				NSDateFormatter *df = [[NSDateFormatter alloc] init];
				df.dateFormat  = @"yyyy/MM/dd HH:mm:ss";
			
				m_fireDate = [df dateFromString:[items objectAtIndex:6]];
			}
			else {
				m_fireDate = nil;
			}

			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:7]];
			m_worldSearchTime = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:8]];
			m_worldSearchNum = str;
			[str release];

			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:9]];
			m_worldSearchNear = str;
			[str release];

			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:10]];
			m_worldSearchDistance = str;
			[str release];
		}
		else if ( [items count] == 5 ) {
			
			m_GPStime = [[items objectAtIndex:1] intValue];

			NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:1]];
			m_worldSearchTime = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:2]];
			m_worldSearchNum = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:3]];
			m_worldSearchNear = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:4]];
			m_worldSearchDistance = str;
			[str release];
			
			m_badge = 0;
		}
		else if ( [items count] == 6 ) {
			
			m_GPStime = [[items objectAtIndex:1] intValue];
			
			NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:1]];
			m_worldSearchTime = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:2]];
			m_worldSearchNum = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:3]];
			m_worldSearchNear = str;
			[str release];
			
			str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:4]];
			m_worldSearchDistance = str;
			[str release];
			
			m_badge = [[items objectAtIndex:5] intValue];
		}
		else{
			
			m_GPStime = 0;
			m_badge = 0;
		}
		
		[bodyText release];
	}
}

- (void)delFriendProfile:(NSInteger)place{

	if ( m_friendLists == nil ) {
		
		return;
	}
	
	NSInteger count = [m_friendLists count];
	
	if( place >= count )
		return;
	
	[m_friendLists removeObjectAtIndex:place];
	[self saveFriendsProfile];
}

- (void)saveFriendsProfile{
	
	NSInteger count = 0;
	if( m_friendLists != nil ){
		
		count = [m_friendLists count];
	}
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"friends.dat"];
	NSError *error;
	
	NSString* bodyText = [[[NSString alloc] initWithFormat:@"%d", count] autorelease];
	
	for ( int i= 0; i < count; i++ ) {
		
		profile* data = (profile*)[m_friendLists objectAtIndex:i];
		bodyText = [[[NSString alloc] initWithFormat:@"%@#%@", bodyText, [data save]] autorelease];
	}
	
	BOOL ok = [bodyText writeToFile:fileName atomically:YES encoding:NSShiftJISStringEncoding error:&error];
	
	if( ok != true ){
	}
}

- (void)loadFriendsProfile{
	
	if ( m_friendLists == nil ) {
		
		m_friendLists = [[NSMutableArray alloc] init];
	}
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"friends.dat"];
	
	NSData *data = [NSData dataWithContentsOfFile:fileName];
	
	if( data != nil ){
		
		NSString *bodyText = [[NSString alloc] initWithData:data encoding:NSShiftJISStringEncoding];
		NSArray *items = [bodyText componentsSeparatedByString:@"#"];
		NSInteger count = [[items objectAtIndex:0] intValue];
		
		for ( NSInteger i= 0; i< count; i++ ) {
			
			profile* p = [[profile alloc] load:[items objectAtIndex:(i+1)]];

			if ( p != nil ) {
				
				[m_friendLists addObject:p];
			}
		}
		
		[bodyText release];
	}
}

- (NSInteger)checkFit:(NSInteger)left right:(NSInteger)right{

	int i;
	NSInteger nLeft[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	NSInteger nRight[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

	for ( i= 0; i < 20; i ++ ) {

		question* l = nil;
		question* r = nil;
		
		if ( left == -1 )
			l = (question*)[m_sQuesLists objectAtIndex:i];
		else if( left == 0 )
			l = (question*)[m_myProfile.m_quesLists objectAtIndex:i];
		else if( left == -2 )
			l = (question*)[m_guestProfile.m_quesLists objectAtIndex:i];
		else {
			profile* p = [m_friendLists objectAtIndex:(left-1)];
			l = (question*)[p.m_quesLists objectAtIndex:i];
		}

		if ( right == -1 )
			r = (question*)[m_sQuesLists objectAtIndex:i];
		else if( right == 0 )
			r = (question*)[m_myProfile.m_quesLists objectAtIndex:i];
		else if( right == -2 )
			r = (question*)[m_guestProfile.m_quesLists objectAtIndex:i];
		else {
			profile* p = [m_friendLists objectAtIndex:(right-1)];
			r = (question*)[p.m_quesLists objectAtIndex:i];
		}

		NSInteger lp = [l getQuizNo]-1;
		NSInteger la = [l getSelAnswer];
		NSInteger rp = [r getQuizNo]-1;
		NSInteger ra = [r getSelAnswer];
		
		nLeft[lp] = la;
		nRight[rp] = ra;
	}
	
	NSInteger cnt = 0;
	for ( i= 0; i < 20; i ++ ) {

		if( i == 4 || i == 7 || i == 11 || i == 12 || i == 18 ){
			
			cnt += abs( nLeft[i]- nRight[i] )* 5;
		}
		else {
			
			cnt += ( 3- abs( nLeft[i]- nRight[i] ))* 5;
		}
	}
	
	//NSLog( @" %d - %d : %d", left, right, cnt/3 );
	
	return cnt/3;
}

- (BOOL)setCoord:(CLLocationCoordinate2D)coord{

	if ( m_fireDate != nil ) {

		/*
		NSInteger time = 30*60;
		if( m_GPStime > 0 )
			time = m_GPStime* 3600;
		
		// 無視する
		NSTimeInterval t;
		t = [[NSDate date] timeIntervalSinceDate:m_fireDate];
		if (t < time )
			return false; // 無視する
		*/
		 
		[m_fireDate release];
		m_fireDate = nil;
	}
	
	m_fireDate = [[NSDate alloc] init];
	
	coordinate = coord;
	return true;
}

- (CLLocationCoordinate2D)getCoord{
	
	return coordinate;
}

- (void)addFitHistory:(NSString*)left right:(NSString*)right per:(NSInteger)per{
	
	NSString* str;
	
	if ( left == nil ) {
		str = [[NSString alloc] initWithFormat:@"%@さんとの相性は%d％", right, per ];
	}
	else if ( right == nil ) {
		
		str = [[NSString alloc] initWithFormat:@"%@さんとの相性は%d％", left, per ];
	}
	else {
		str = [[NSString alloc] initWithFormat:@"%@さんと%@さんの相性は%d％", left, right, per ];
	}
	
	if ( m_fitLists == nil ) {
		
		m_fitLists = [[NSMutableArray alloc] init];
	}
	
	[m_fitLists addObject:str];
	
	[self saveFitHistory];
}

- (void)delFitHistory:(NSInteger)place{
	
	if ( m_fitLists == nil ) {
		
		return;
	}
	
	NSInteger count = [m_fitLists count];
	
	if( place >= count )
		return;
	
	[m_fitLists removeObjectAtIndex:place];
	[self saveFitHistory];
}

- (void)saveFitHistory{
	
	NSInteger count = 0;
	if( m_fitLists != nil ){
		
		count = [m_fitLists count];
	}
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"fitHistory.dat"];
	NSError *error;
	
	NSString* bodyText = [[[NSString alloc] initWithFormat:@"%d", count] autorelease];
	
	for ( int i= 0; i < count; i++ ) {
		
		NSString* data = (NSString*)[m_fitLists objectAtIndex:i];
		bodyText = [[[NSString alloc] initWithFormat:@"%@#%@", bodyText, data] autorelease];
	}
	
	BOOL ok = [bodyText writeToFile:fileName atomically:YES encoding:NSShiftJISStringEncoding error:&error];
	
	if( ok != true ){
	}
}


- (void)loadFitHistory{
	
	if ( m_fitLists == nil ) {
		
		m_fitLists = [[NSMutableArray alloc] init];
	}
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"fitHistory.dat"];
	
	NSData *data = [NSData dataWithContentsOfFile:fileName];
	
	if( data != nil ){
		
		NSString *bodyText = [[NSString alloc] initWithData:data encoding:NSShiftJISStringEncoding];
		NSArray *items = [bodyText componentsSeparatedByString:@"#"];
		NSInteger count = [[items objectAtIndex:0] intValue];
		
		for ( NSInteger i= 0; i< count; i++ ) {
			
			NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:(i+1)] ];
			[m_fitLists addObject:str];
		}
		
		[bodyText release];
	}
}

- (void)addSearchHistory:(NSInteger)best good:(NSInteger)good{
	
	NSDate *now = [[NSDate alloc] init];
	// NSDate型を「yyyy/MM/dd HH:mm:ss」形式の文字列として取得する
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateFormat  = @"MM/dd HH:mm";
	NSString* str;
	
	if ( best == 0 && good == 0 ) {
		str = [[NSString alloc] initWithFormat:@"%@ %@&チョイデレラ・シンデレラ0人", [df stringFromDate:now], self.m_myPlace];
	}
	else {
		str = [[NSString alloc] initWithFormat:@"%@ %@&チョイデレラ%d人・シンデレラ%d人", [df stringFromDate:now], self.m_myPlace, good, best];
	}
	
	if ( m_searchLists == nil ) {
		
		m_searchLists = [[NSMutableArray alloc] init];
	}

	if ( [m_searchLists count] == 0 ) {
		
		[m_searchLists addObject:str];
	}
	else {
		[m_searchLists insertObject:str atIndex:0];// addObject:str];
	}
	
	[self saveSearchHistory];
}
	 
- (void)addBeSearchHistory:(NSString*)str{

	if ( [m_searchLists count] == 0 ) {
		
		[m_searchLists addObject:str];
	}
	else {
		[m_searchLists insertObject:str atIndex:0];// addObject:str];
	}
	
	[self saveSearchHistory];
}	 

- (void)delSearchHistory:(NSInteger)place{
	
	if ( m_searchLists == nil ) {
		
		return;
	}
	
	NSInteger count = [m_searchLists count];
	
	if( place >= count )
		return;
	
	[m_searchLists removeObjectAtIndex:place];
	[self saveSearchHistory];
}

- (void)saveSearchHistory{
	
	NSInteger count = 0;
	if( m_searchLists != nil ){
		
		count = [m_searchLists count];
	}
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"searchHistory.dat"];
	NSError *error;
	
	NSString* bodyText = [[[NSString alloc] initWithFormat:@"%d", count] autorelease];
	
	for ( int i= 0; i < count; i++ ) {
		
		NSString* data = (NSString*)[m_searchLists objectAtIndex:i];
		bodyText = [[[NSString alloc] initWithFormat:@"%@#%@", bodyText, data] autorelease];
	}
	
	BOOL ok = [bodyText writeToFile:fileName atomically:YES encoding:NSShiftJISStringEncoding error:&error];
	
	if( ok != true ){
	}
}

- (void)loadSearchHistory{
	
	if ( m_searchLists == nil ) {
		
		m_searchLists = [[NSMutableArray alloc] init];
	}
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"searchHistory.dat"];
	
	NSData *data = [NSData dataWithContentsOfFile:fileName];
	
	if( data != nil ){
		
		NSString *bodyText = [[NSString alloc] initWithData:data encoding:NSShiftJISStringEncoding];
		NSArray *items = [bodyText componentsSeparatedByString:@"#"];
		NSInteger count = [[items objectAtIndex:0] intValue];
		
		for ( NSInteger i= 0; i< count; i++ ) {
			
			NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:(i+1)] ];
			[m_searchLists addObject:str];
		}
		
		[bodyText release];
	}
}



- (BOOL)getPushFlag{

	return m_bPushReceive;
}

- (void)setPushFlag:(BOOL)bPush{

	m_bPushReceive = bPush;
	
	//[self saveUserData];
}

- (NSInteger)getGPSFlag{

	return m_GPStime;
}

- (void)setGPSFlag:(NSInteger)gpstime{

	m_GPStime = gpstime;
	[self saveUserData];
}

- (void)addBadge:(NSInteger)cnt{

	if ( cnt == 0 ) {
		
		return;
	}
	
	m_badge+= cnt;
	[self saveUserData];
}

- (NSInteger)getBadge{

	return m_badge;
}

- (void)clearBadge{

	m_badge = 0;
	[self saveUserData];
}

@end
