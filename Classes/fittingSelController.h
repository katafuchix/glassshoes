//
//  fittingSelController.h
//  glassshoes
//
//  Created by james Lee on 11/08/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oyaController.h"

@class aboutMutiQues;

@interface fittingSelController : oyaController<UITableViewDelegate, UITableViewDataSource> {

	aboutMutiQues* m_helpCtrl;
	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_manImg;
	IBOutlet UIImageView* m_womanImg;
	
	IBOutlet UITableView* m_manTableView;
	IBOutlet UITableView* m_womanTableView;
	
	IBOutlet UIButton* m_helpBtn;
	IBOutlet UIButton* m_fitBtn;
	IBOutlet UIButton* m_backBtn;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSMutableArray* m_manLists;
	NSMutableArray* m_womanLists;
	
	NSInteger m_selMan;
	NSInteger m_selWoman;
}
@property(nonatomic, retain)aboutMutiQues* m_helpCtrl;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_manImg;
@property(nonatomic, retain)UIImageView* m_womanImg;

@property(nonatomic, retain)UITableView* m_manTableView;
@property(nonatomic, retain)UITableView* m_womanTableView;

@property(nonatomic, retain)UIButton* m_helpBtn;
@property(nonatomic, retain)UIButton* m_fitBtn;
@property(nonatomic, retain)UIButton* m_backBtn;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

@property(nonatomic, retain)NSMutableArray* m_manLists;
@property(nonatomic, retain)NSMutableArray* m_womanLists;

-(IBAction)selToFit:(id)sender;
-(IBAction)selToHelp:(id)sender;
-(IBAction)selToBack:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showHelpPage;
-(void)closeHelpPage;
-(void)showBadge;
@end
