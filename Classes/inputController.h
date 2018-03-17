//
//  inputController.h
//  glassshoes
//
//  Created by james Lee on 11/08/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

#define MAX_NAME_LENGTH 11

#import "oyaController.h"

@interface inputController : oyaController<UITabBarDelegate,UITextFieldDelegate> {

	IBOutlet UITextField* m_nameInp;
	IBOutlet UIImageView* m_inputImg;
	IBOutlet UIButton* m_manBtn;
	IBOutlet UIButton* m_womanBtn;
	
	IBOutlet UIImageView* m_bkImg;
	
	IBOutlet UIImageView* m_starImg;
	IBOutlet UIImageView* m_star2Img;
	IBOutlet UIImageView* m_star3Img;
	
	IBOutlet UIImageView* m_wakuImg;
	UIImageView* m_titleImg;
	
	//IBOutlet UILabel* m_title;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	BOOL		m_bSingle;
	NSInteger	m_number;
	
	NSInteger	m_cnt;
}

@property(nonatomic, retain)UITextField* m_nameInp;
@property(nonatomic, retain)UIImageView* m_inputImg;
@property(nonatomic, retain)UIButton* m_manBtn;
@property(nonatomic, retain)UIButton* m_womanBtn;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_starImg;
@property(nonatomic, retain)UIImageView* m_star2Img;
@property(nonatomic, retain)UIImageView* m_star3Img;

@property(nonatomic, retain)UIImageView* m_wakuImg;
@property(nonatomic, retain)UIImageView* m_titleImg;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)setInfo:(BOOL)bSingle num:(NSInteger)num;

- (void)showStart1;
- (void)showStart2;
- (void)showStart3;

-(IBAction)selBeMan:(id)sender;
-(IBAction)selBeWoman:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

- (IBAction)startInpText:(id)sender;
- (IBAction)changeTexted:(id)sender;

-(void)showBadge;

@end
