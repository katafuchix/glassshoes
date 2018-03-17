//
//  startController.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface startController : UIViewController<UITabBarDelegate> {

	IBOutlet UIButton* m_chkOneBtn;
	IBOutlet UIButton* m_chkMutiBtn;
	IBOutlet UIButton* m_seachBtn;
	IBOutlet UIButton* m_fittingBtn;
	IBOutlet UIButton* m_helpBtn;

	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_wakuImg;
	
	IBOutlet UIImageView* m_starImg;
	IBOutlet UIImageView* m_star2Img;
	IBOutlet UIImageView* m_star3Img;
	
	IBOutlet UIImageView* m_guider;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger m_mode;
	
	NSInteger	m_cnt;
}

@property(nonatomic, retain)UIButton* m_chkOneBtn;
@property(nonatomic, retain)UIButton* m_chkMutiBtn;
@property(nonatomic, retain)UIButton* m_seachBtn;
@property(nonatomic, retain)UIButton* m_fittingBtn;
@property(nonatomic, retain)UIButton* m_helpBtn;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_starImg;
@property(nonatomic, retain)UIImageView* m_star2Img;
@property(nonatomic, retain)UIImageView* m_star3Img;
@property(nonatomic, retain)UIImageView* m_wakuImg;
@property(nonatomic, retain)UIImageView* m_guider;

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

-(IBAction)selToChkOne:(id)sender;
-(IBAction)selToChkMuti:(id)sender;
-(IBAction)selToFitting:(id)sender;
-(IBAction)selToHelp:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;

@end
