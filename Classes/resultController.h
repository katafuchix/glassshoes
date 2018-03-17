//
//  resultController.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myGlassController;
@class aboutProfile;

#import "oyaController.h"

@interface resultController : oyaController {

	myGlassController* m_leftShoes;
	myGlassController* m_rightShoes;
	aboutProfile* m_quesCtrl;
	
	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_guideImg;

	IBOutlet UILabel* m_leftName;
	IBOutlet UILabel* m_rightName;
	IBOutlet UILabel* m_fittingPer;

	IBOutlet UIButton* m_backBtn;
	IBOutlet UIButton* m_helpBtn;
	IBOutlet UIButton* m_saveBtn;
	
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
	BOOL m_from;
	BOOL m_bLeft;
	BOOL m_bSaved;
}

@property(nonatomic, retain)myGlassController* m_leftShoes;
@property(nonatomic, retain)myGlassController* m_rightShoes;
@property( nonatomic, retain )aboutProfile* m_quesCtrl;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_guideImg;

@property(nonatomic, retain)UILabel* m_leftName;
@property(nonatomic, retain)UILabel* m_rightName;
@property(nonatomic, retain)UILabel* m_fittingPer;

@property(nonatomic, retain)UIButton* m_backBtn;
@property(nonatomic, retain)UIButton* m_helpBtn;
@property(nonatomic, retain)UIButton* m_saveBtn;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)setInfo:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft;

-(void)showQuesHelpPage;
-(void)closeQuesHelpPage;

-(IBAction)selToBack:(id)sender;
-(IBAction)selToSave:(id)sender;
-(IBAction)selToHelp:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;
@end
