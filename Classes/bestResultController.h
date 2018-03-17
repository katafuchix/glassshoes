//
//  bestResultController.h
//  glassshoes
//
//  Created by james Lee on 11/08/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class myGlassController;
@class aboutMutiQues;

#import "oyaController.h"

@interface bestResultController : oyaController {

	aboutMutiQues* m_helpCtrl;
	
	IBOutlet UIScrollView*	m_scrollView;

	NSMutableArray* m_leftShoesLists;
	NSMutableArray* m_rightShoesLists;
	NSMutableArray* m_leftNameLists;
	NSMutableArray* m_rightNameLists;
	NSMutableArray* m_cursorLists;
	
	//myGlassController* m_leftShoes;
	//myGlassController* m_rightShoes;
	
	IBOutlet UIImageView* m_bkImg;
	
	//IBOutlet UILabel* m_leftName;
	//IBOutlet UILabel* m_rightName;

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
	
	NSInteger m_cnt;
}

@property(nonatomic, retain)aboutMutiQues* m_helpCtrl;

@property(nonatomic, retain)UIScrollView*	m_scrollView;

@property(nonatomic, retain)NSMutableArray* m_leftShoesLists;
@property(nonatomic, retain)NSMutableArray* m_rightShoesLists;
@property(nonatomic, retain)NSMutableArray* m_leftNameLists;
@property(nonatomic, retain)NSMutableArray* m_rightNameLists;
@property(nonatomic, retain)NSMutableArray* m_cursorLists;

//@property(nonatomic, retain)myGlassController* m_leftShoes;
//@property(nonatomic, retain)myGlassController* m_rightShoes;

@property(nonatomic, retain)UIImageView* m_bkImg;

//@property(nonatomic, retain)UILabel* m_leftName;
//@property(nonatomic, retain)UILabel* m_rightName;
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
