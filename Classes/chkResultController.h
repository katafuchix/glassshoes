//
//  chkResultController.h
//  glassshoes
//
//  Created by james Lee on 11/08/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myGlassController;

@class chkHelpController;
@class chkFitController;
@class chkSaveController;
@class aboutType;
@class aboutProfile;
@class chkReplaceController;
@class chkOverController;

#import "oyaController.h"

@interface chkResultController : oyaController {

	myGlassController* m_shoes;
	
	chkHelpController* m_helpCtrl;
	chkFitController* m_fitCtrl;
	chkSaveController* m_saveCtrl;
	aboutType* m_typeCtrl;
	aboutProfile* m_quesCtrl;
	chkReplaceController* m_replaceCtrl;
	chkOverController* m_overCtrl;
	
	IBOutlet UIScrollView* m_scrollView;
	IBOutlet UIButton* m_helpBtn;
	IBOutlet UIButton* m_fitBtn;
	IBOutlet UIButton* m_saveBtn;
	
	IBOutlet UILabel* m_nameLabel;
	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_wakuImg;
	UIImageView* m_typeImg;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	IBOutlet UIButton* m_downBtn;
	NSInteger m_cnt;
}

@property(nonatomic, retain)myGlassController* m_shoes;

@property(nonatomic, retain)chkHelpController* m_helpCtrl;
@property(nonatomic, retain)chkFitController* m_fitCtrl;
@property(nonatomic, retain)chkSaveController* m_saveCtrl;

@property( nonatomic, retain )aboutType* m_typeCtrl;
@property( nonatomic, retain )aboutProfile* m_quesCtrl;

@property( nonatomic, retain )chkReplaceController* m_replaceCtrl;
@property( nonatomic, retain )chkOverController* m_overCtrl;

@property(nonatomic, retain)UIScrollView* m_scrollView;

@property(nonatomic, retain)UIButton* m_helpBtn;
@property(nonatomic, retain)UIButton* m_fitBtn;
@property(nonatomic, retain)UIButton* m_saveBtn;
@property(nonatomic, retain)UIButton* m_downBtn;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UILabel* m_nameLabel;
@property(nonatomic, retain)UIImageView* m_wakuImg;
@property(nonatomic, retain)UIImageView* m_typeImg;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)showHelpSelPage;
-(void)closeHelpSelPage;

-(void)showFitSelPage;
-(void)closeFitSelPage;

-(void)showSaveSelPage;
-(void)closeSaveSelPage;

-(void)showTypeHelpPage;
-(void)closeTypeHelpPage;

-(void)showQuesHelpPage;
-(void)closeQuesHelpPage;

-(void)showReplacePage;
-(void)closeReplacePage;

-(void)showOverPage;
-(void)closeOverPage;

-(IBAction)selToDown:(id)sender;
-(IBAction)selToHelp:(id)sender;
-(IBAction)selToFit:(id)sender;
-(IBAction)selToSave:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;

@end
