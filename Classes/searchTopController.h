//
//  searchTopController.h
//  glassshoes
//
//  Created by james Lee on 11/08/27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class searchingController;
@class nearController;
@class worldController;

@interface searchTopController : UIViewController {

	searchingController* m_searchCtrl;
	nearController* m_nearCtrl;
	worldController* m_worldCtrl;
	
	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_wakuImg;
	
	IBOutlet UIImageView* m_starImg;
	IBOutlet UIImageView* m_star2Img;
	IBOutlet UIImageView* m_star3Img;
	
	IBOutlet UIButton* m_nearBtn;
	IBOutlet UIButton* m_worldBtn;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger m_cnt;
	NSInteger m_mode;
}

@property(nonatomic, retain)searchingController* m_searchCtrl;
@property(nonatomic, retain)nearController* m_nearCtrl;
@property(nonatomic, retain)worldController* m_worldCtrl;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_starImg;
@property(nonatomic, retain)UIImageView* m_star2Img;
@property(nonatomic, retain)UIImageView* m_star3Img;
@property(nonatomic, retain)UIImageView* m_wakuImg;

@property(nonatomic, retain)UIButton* m_nearBtn;
@property(nonatomic, retain)UIButton* m_worldBtn;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

- (void)showStart1;
- (void)showStart2;
- (void)showStart3;

-(IBAction)selToNear:(id)sender;
-(IBAction)selToWorld:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showSearchingPage:(BOOL)bNear;
-(void)closeSearchingPage;
-(void)stopTimeout;

-(void)showNearPage;
-(void)closeNearPage;

-(void)showWorldPage;
-(void)closeWorldPage;
-(void)showBadge;
@end
