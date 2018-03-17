//
//  profileController.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>

@class myGlassController;
@class chkHelpController;
@class chkFitController;
@class aboutProfile;
@class aboutType;

#import "oyaController.h"

@interface profileController : oyaController {

	myGlassController* m_shoes;
	
	chkHelpController* m_helpCtrl;
	chkFitController* m_fitCtrl;
	aboutType* m_typeCtrl;
	aboutProfile* m_quesCtrl;
	
	IBOutlet UIScrollView* m_scrollView;
	IBOutlet UIButton* m_helpBtn;
	IBOutlet UIButton* m_fitBtn;
	IBOutlet UIButton* m_backBtn;
	
	IBOutlet UILabel* m_nameLabel;
	IBOutlet UIImageView* m_bkImg;
	UIImageView* m_titleImg;
	IBOutlet UIImageView* m_wakuImg;
	IBOutlet UIButton* m_downBtn;
	UIImageView* m_typeImg;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger m_cnt;
	NSInteger m_profileNo;	// 0 == me
							// 1+ = friends
	BOOL m_bFromFit;
}

@property(nonatomic, retain)myGlassController* m_shoes;

@property(nonatomic, retain)chkHelpController* m_helpCtrl;
@property(nonatomic, retain)chkFitController* m_fitCtrl;
@property( nonatomic, retain )aboutType* m_typeCtrl;
@property( nonatomic, retain )aboutProfile* m_quesCtrl;

@property(nonatomic, retain)UIScrollView* m_scrollView;

@property(nonatomic, retain)UIButton* m_helpBtn;
@property(nonatomic, retain)UIButton* m_fitBtn;
@property(nonatomic, retain)UIButton* m_backBtn;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UILabel* m_nameLabel;
@property(nonatomic, retain)UIImageView* m_wakuImg;
@property(nonatomic, retain)UIImageView* m_titleImg;
@property(nonatomic, retain)UIImageView* m_typeImg;
@property(nonatomic, retain)UIButton* m_downBtn;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)setInfo:(NSInteger)profileNo from:(BOOL)bFit;

-(void)showFitSelPage;
-(void)closeFitSelPage;

-(void)showHelpSelPage;
-(void)closeHelpSelPage;

-(void)showTypeHelpPage;
-(void)closeTypeHelpPage;

-(void)showQuesHelpPage;
-(void)closeQuesHelpPage;

-(IBAction)selToHelp:(id)sender;
-(IBAction)selToFit:(id)sender;
-(IBAction)selToBack:(id)sender;
-(IBAction)selToDown:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;
@end
