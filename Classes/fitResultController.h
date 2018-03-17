//
//  fitResultController.h
//  glassshoes
//
//  Created by james Lee on 11/08/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oyaController.h"

@class myGlassController;
@class aboutMutiQues;

@interface fitResultController : oyaController {

	aboutMutiQues* m_helpCtrl;
	myGlassController* m_leftShoes;
	myGlassController* m_rightShoes;
	
	IBOutlet UIImageView* m_bkImg;
	
	IBOutlet UILabel* m_leftName;
	IBOutlet UILabel* m_rightName;
	IBOutlet UILabel* m_fittingPer;
	
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
}
@property(nonatomic, retain)aboutMutiQues* m_helpCtrl;

@property(nonatomic, retain)myGlassController* m_leftShoes;
@property(nonatomic, retain)myGlassController* m_rightShoes;

@property(nonatomic, retain)UIImageView* m_bkImg;

@property(nonatomic, retain)UILabel* m_leftName;
@property(nonatomic, retain)UILabel* m_rightName;
@property(nonatomic, retain)UILabel* m_fittingPer;

@property(nonatomic, retain)UIButton* m_helpBtn;
@property(nonatomic, retain)UIButton* m_saveBtn;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)setInfo:(NSInteger)left right:(NSInteger)right;

-(IBAction)selToSave:(id)sender;
-(IBAction)selToHelp:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showHelpPage;
-(void)closeHelpPage;
-(void)showBadge;
@end
