//
//  historyTopController.h
//  glassshoes
//
//  Created by james Lee on 11/09/16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface historyTopController : UIViewController {

	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_wakuImg;
	
	IBOutlet UIImageView* m_starImg;
	IBOutlet UIImageView* m_star2Img;
	IBOutlet UIImageView* m_star3Img;
	
	IBOutlet UIButton* m_fitBtn;
	IBOutlet UIButton* m_searchBtn;
	
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

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_starImg;
@property(nonatomic, retain)UIImageView* m_star2Img;
@property(nonatomic, retain)UIImageView* m_star3Img;
@property(nonatomic, retain)UIImageView* m_wakuImg;

@property(nonatomic, retain)UIButton* m_fitBtn;
@property(nonatomic, retain)UIButton* m_searchBtn;

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

-(IBAction)selToFit:(id)sender;
-(IBAction)selToSearchHistory:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;
@end
