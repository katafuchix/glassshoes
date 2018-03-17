//
//  mutiResultController.h
//  glassshoes
//
//  Created by james Lee on 11/08/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>

@class myGlassController;

#import "oyaController.h"

@interface mutiResultController : oyaController {

	myGlassController* m_shoes;
	
	IBOutlet UIButton* m_nextBtn;
	IBOutlet UIButton* m_fitBtn;
	
	IBOutlet UILabel* m_nameLabel;
	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_paperImg;
	IBOutlet UIImageView* m_nameImg;
	IBOutlet UIImageView* m_wakuImg;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
}

@property(nonatomic, retain)myGlassController* m_shoes;

@property(nonatomic, retain)UIButton* m_nextBtn;
@property(nonatomic, retain)UIButton* m_fitBtn;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_paperImg;
@property(nonatomic, retain)UIImageView* m_nameImg;
@property(nonatomic, retain)UIImageView* m_wakuImg;
@property(nonatomic, retain)UILabel* m_nameLabel;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(IBAction)selToNext:(id)sender;
-(IBAction)selToFit:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;
@end
